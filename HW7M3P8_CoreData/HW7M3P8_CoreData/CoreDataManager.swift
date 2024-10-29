//
//  CoreDataManager.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/23/24.
//

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

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private init() {
        persistentContainer = NSPersistentContainer(name: "HW7M3P8_CoreData")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    // Create Note
    func createNote(header: String, text: String?, date: Date?, photoLink: String?) -> Note? {
        let note = Note(context: context)
        note.header = header
        note.text = text
        note.date = date
        note.id = UUID().uuidString
        saveContext()
        return note
    }

    // Fetch Notes
    func fetchNotes() -> [Note] {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching notes: \(error)")
            return []
        }
    }

    // Update Note
    func updateNote(note: Note, header: String, text: String?, date: Date?, photoLink: String?) {
        note.header = header
        note.text = text
        note.date = date
        saveContext()
    }

    // Delete Note
    func deleteNote(note: Note) {
        context.delete(note)
        saveContext()
    }

    // Save Context
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }

    // Save Image to FileManager
    func saveImageToFileManager(image: UIImage, withName name: String) -> String? {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = directory.appendingPathComponent(name)
            do {
                try data.write(to: fileURL)
                return fileURL.absoluteString
            } catch {
                print("Error saving image: \(error)")
            }
        }
        return nil
    }

    // Load Image from FileManager
    func loadImageFromFileManager(withName name: String) -> UIImage? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent(name)
        if let data = try? Data(contentsOf: fileURL) {
            return UIImage(data: data)
        }
        return nil
    }
}

