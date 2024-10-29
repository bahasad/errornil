//
//  StorageManager.swift
//  HW7M3P8_2CoreData2
//
//  Created by Baha Sadyr on 10/24/24.
//
import Foundation
import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        
        let container = NSPersistentContainer(name: "HW7M3P8_2CoreData2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var folders: [Folder] = []
    func createFolder(name: String) {
        let folder = Folder(context: persistentContainer.viewContext)
        folder.date = Date()
        folder.name = name
        saveContext()
        getFolder()
    }
    
    func getFolder() {
        let req = Folder.fetchRequest()
        let result = try? persistentContainer.viewContext.fetch(req)
        
        self.folders = result ?? []
    }
    
    func addNote(name: String) {
        let note = Folder(context: persistentContainer.viewContext)
        note.date = Date()
        note.name = name
        saveContext()
        getFolder()
    }
    
    func deleteNote(index: Int) {
        let note = folders[index]
        persistentContainer.viewContext.delete(note)
        saveContext()
    }
    
    func editNote(name: String, index: Int) {
        let note = folders[index]
        note.name = name
        saveContext()
        
    }
    
}
