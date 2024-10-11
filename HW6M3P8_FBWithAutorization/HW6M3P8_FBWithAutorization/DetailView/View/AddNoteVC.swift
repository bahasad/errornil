//
//  DetailVC.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/10/24.
//

import UIKit

class AddNoteVC: UIViewController {
    
    private let noteService = NoteService()
    private var viewBuilder = ViewBuilder()
    var note: Note?
    var image: UIImage?
    
    
    private lazy var noteHeader = viewBuilder.createTextField(placeholder: "title")
    private lazy var noteText = viewBuilder.createTextField(placeholder: "note")
    private lazy var imageView = viewBuilder.getCustomImageView(target: self, action: #selector(imageTapped))
    
    lazy var imagePicker: UIImagePickerController = {
        $0.sourceType = .photoLibrary
        $0.allowsEditing = true
        $0.delegate = self
        return $0
    }(UIImagePickerController())
    
    private lazy var btn = viewBuilder.getBtn(title: note != nil ? "UPDATE" : "SAVE")
    
    func setBtn() {
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
    }
    
    @objc func btnAction() {
        if self.note == nil {
            let note = Note(header: noteHeader.text ?? "", note: noteText.text ?? "", image: nil)
            if image != nil {
                let imageData = image?.jpegData(compressionQuality: 0.5)
                noteService.createNote(note: note, image: imageData) { isAdd in
                    switch isAdd {
                    case .success(let success):
                        self.navigationController?.popViewController(animated: true)
                    case .failure(let failure):
                        print(failure)
                    }
                }
            } else {
                noteService.createNote(note: note, image: nil) { isAdd in
                    switch isAdd {
                    case .success(let success):
                        self.navigationController?.popViewController(animated: true)
                    case .failure(let failure):
                        print(failure)
                    }
                }
            }
        } else {
            let note = Note(id: note!.id, header: noteHeader.text ?? "", note: noteText.text ?? "", image: nil)
            noteService.updateNote(note: note) { _ in
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [noteHeader, noteText,imageView, btn].forEach {
            view.addSubview($0)
        }
        setConstraints()
        setBtn()
        setData()
        setLoadImage()
        
    }
    
    private func setLoadImage(){
        if note != nil, let url = note?.image, let urlToImage = URL(string: url) {
            imageView.load(url: urlToImage)
        }
    }
    
    private func setData() {
        noteHeader.text = note?.header
        noteText.text = note?.note
    }
    
    @objc func imageTapped() {
        present(imagePicker, animated: true)
    }
    
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            noteHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            noteHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noteHeader.heightAnchor.constraint(equalToConstant: 100),
            noteHeader.widthAnchor.constraint(equalToConstant: 200),
            noteText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noteText.topAnchor.constraint(equalTo: noteHeader.bottomAnchor, constant: 20),
            noteText.heightAnchor.constraint(equalToConstant: 100),
            noteText.widthAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: noteText.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            btn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn.heightAnchor.constraint(equalToConstant: 50),
            btn.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    
}

extension AddNoteVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
            self.image = image
        }
        picker.dismiss(animated: true)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

