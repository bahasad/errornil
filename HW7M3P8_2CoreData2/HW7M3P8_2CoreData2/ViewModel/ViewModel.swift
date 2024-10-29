//
//  ViewModel.swift
//  HW7M3P8_2CoreData2
//
//  Created by Baha Sadyr on 10/28/24.
//

import RxSwift
import RxCocoa


class ViewModel {
    
    var notes = BehaviorSubject(value: [Folder]())
    
    var storage = StorageManager.shared
    
    func fetchAllNotes() {
        storage.getFolder()
        notes.onNext(storage.folders)
    }
    
    func addNote(name: String) {
        storage.addNote(name: name)
        fetchAllNotes()
    }
    
    func editNote(name: String, index: Int) {
        storage.editNote(name: name, index: index)
        fetchAllNotes()
    }
    
    func deleteNote(index: Int) {
        guard var notes = try? notes.value() else { return }
        storage.deleteNote(index: index)
        fetchAllNotes()
    }
}

