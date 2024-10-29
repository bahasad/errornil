//
//  CoreManager.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/12/24.
//

import Foundation
import CoreData

//class CoreManager {
//    
//    
//    lazy var persistentContainer: NSPersistentContainer = {
//       
//        
//        let container = NSPersistentContainer(name: "HW7M3P8_CoreData")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//               
//                
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                
//                
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//    
//    //CRUD
//    
//    //create
//    func createNote(header: String, text: String) {
//        let note = Note(context: persistentContainer.viewContext)
//        note.header = header
//        note.text = text
//        note.date = Date()
//        note.id = UUID().uuidString
//        
//        saveContext()
//    }
//    //read
//    func fetchNotes()  -> [Note]{
//        let req = Note.fetchRequest()
//        let notes = try? persistentContainer.viewContext.fetch(req)
//        return notes ?? []
//    }
//    
//    func updateNotes(id: String, header: String) {
//        // 1 - search one note
//        let req = Note.fetchRequest()
//        req.predicate = NSPredicate(format: "id == %@", id)
//        
//        let note = try? persistentContainer.viewContext.fetch(req).first
//        
//        note?.header = header
//        note?.date = Date()
//        saveContext()
//    }
//    
//    func deleteNote(id: String) {
//        let req = Note.fetchRequest()
//        req.predicate = NSPredicate(format: "id == %@", id)
//        
//        guard let note = try? persistentContainer.viewContext.fetch(req).first else { return }
//        
//        persistentContainer.viewContext.delete(note)
//        
//        saveContext()
//    }
//    
//}
/// Pseudocode
// 1. Create a Core Data model for storing notes and subtasks. Each note contains attributes like header, text, date, and an optional photo link. Each subtask has attributes like title, isCompleted, etc.
// 2. Set up the UI using UIKit, with the following views:
//    a. First screen: UITableView for listing notes, a button to add a new note.
//    b. Note Details screen: A form to add or edit the note details (header, text, date, photo).
//    c. Subtask List screen: UITableView for listing subtasks with options to add, edit, delete, or mark as completed.
// 3. Implement navigation using UINavigationController.
// 4. Handle adding/editing notes and subtasks with Core Data operations (insert, update, delete).
// 5. Store images in FileManager and save the link to Core Data.
// 6. Use delegate pattern or notifications for communication between view controllers.

