//
//  NoteService.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/10/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

struct Constants {
    static let users = "users"
    static let notes = "notes"
}

class NoteService {
    
    func getUserUid() -> String? {
        return Auth.auth().currentUser?.uid
    }
    
    func createNote(note: Note, image: Data?, completion: @escaping (Result<Bool, Error>) -> Void){
        guard let uid = getUserUid() else { return }
        let noteId = UUID().uuidString
        
        Firestore.firestore()
            .collection(Constants.users)
            .document(uid)
            .collection(Constants.notes)
            .document(noteId)
            .setData(["header": note.header, "note": note.note]) { [weak self] _ in
                guard let self = self else { return }
                guard let image else {
                    completion(.success(true))
                    return
                }
                
                let storage = Storage.storage()
                    .reference()
                    .child(Constants.notes)
                    .child(uid)
                    .child("\(UUID().uuidString).jpg")
                
                self.oneImageLoad(image, storage) { result in
                    switch result {
                    case .success(let url):
                        let photoUrl = url.absoluteString
                        
                        Firestore.firestore()
                            .collection(Constants.users)
                            .document(uid)
                            .collection(Constants.notes)
                            .document(noteId)
                            .setData(["photo": photoUrl], merge: true)
                        
                        completion(.success(true))
                        
                    case .failure(let failure):
                        print(failure)
                        completion(.failure(failure))
                    }
                }
                
                
                
            }
        
    }
    
    private func oneImageLoad(_ image: Data?, _ storage: StorageReference, _ completion: @escaping (Result<URL, Error>) -> ()) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        guard let imageData = image else { return }
        
        DispatchQueue.main.async {
            storage.putData(imageData, metadata: metadata) { meta, err in
                guard let _ = meta else {
                    completion(.failure(err!))
                    return
                }
                
                storage.downloadURL { url, err in
                    guard let url = url else {
                        completion(.failure(err!))
                        return
                    }
                    completion(.success(url))
                }
            }
        }
    }
    
    func loadNotes(completion: @escaping ([Note]) -> Void) {
        guard let uid = getUserUid() else { return }
        Firestore.firestore()
            .collection(Constants.users)
            .document(uid)
            .collection(Constants.notes)
            .addSnapshotListener { snap, err in
                var notes: [Note] = []
                if let data = snap?.documents {
                    data.forEach { doc in
                        let id = doc.documentID
                        print(id)
                        let header = doc["header"] as? String
                        let note = doc["note"] as? String
                        let image = doc["photo"] as? String
                        
                        let noteItem = Note(id: id, header: header ?? "", note: note ?? "", image: image)
                        notes.append(noteItem)
                    }
                    completion(notes)
            }
        }
    }
    
    func updateNote(note: Note, completion: @escaping (Bool) -> Void) {
        guard let uid = getUserUid() else { return }
        Firestore.firestore()
            .collection(Constants.users)
            .document(uid)
            .collection(Constants.notes)
            .document(note.id)
            .updateData(["header" : note.header, "note": note.note]) { _ in
                completion(true)
            }
    }
    
    func deleteNote(note: Note) {
        guard let uid = getUserUid() else { return }
        
        let noteRef = Firestore.firestore()
            .collection(Constants.users)
            .document(uid)
            .collection(Constants.notes)
            .document(note.id)
        
        
        if let imageUrl = note.image, let imageStorageRef = getImageStorageRef(for: imageUrl) {
            
            imageStorageRef.delete { error in
                if let error = error {
                    print(error)
                } else {
                    print("Image deleted")
                }
            }
        }
        
        
        noteRef.delete { error in
            if let error = error {
                print(error)
            } else {
                print("Note deleted")
            }
        }
    }

    
    private func getImageStorageRef(for imageUrl: String) -> StorageReference? {
        let storage = Storage.storage()
        if let url = URL(string: imageUrl), let path = url.pathComponents.last {
            return storage.reference().child(Constants.notes).child(getUserUid()!).child(path)
        }
        return nil
    }

        
}

