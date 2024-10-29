//
//  NoteDetailsViewController.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/23/24.
//

import UIKit

protocol NoteDetailsViewControllerDelegate: AnyObject {
    func didSaveNote()
}

class NoteDetailsViewController: UIViewController {
    weak var delegate: NoteDetailsViewControllerDelegate?
    var note: Note?

    // UI elements: UITextField for header, UIImageView for photo, UIDatePicker for date, UITextView for text
    let headerField = UITextField()
    let photoImageView = UIImageView()
    let datePicker = UIDatePicker()
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = note == nil ? "Add Note" : "Edit Note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        // Layout UI elements here (e.g., add them as subviews, set constraints)
    }

    @objc func saveNote() {
        var photoLink: String? = nil
        if let image = photoImageView.image {
            photoLink = CoreDataManager.shared.saveImageToFileManager(image: image, withName: UUID().uuidString)
        }

        if note == nil {
            note = CoreDataManager.shared.createNote(header: headerField.text ?? "", text: textView.text, date: datePicker.date, photoLink: photoLink)
        } else {
            CoreDataManager.shared.updateNote(note: note!, header: headerField.text ?? "", text: textView.text, date: datePicker.date, photoLink: photoLink)
        }
        delegate?.didSaveNote()
        navigationController?.popViewController(animated: true)
    }
}

class SubtaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var note: Note?
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Subtasks"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSubtask))
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SubtaskCell")
    }

    @objc func addSubtask() {
        let alert = UIAlertController(title: "New Subtask", message: "Enter subtask title", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            guard let self = self, let title = alert.textFields?.first?.text, !title.isEmpty, let note = self.note else { return }
            let subtask = Subtask(context: CoreDataManager.shared.context)
            subtask.title = title
            subtask.isCompleted = false
            note.addToSubtasks(subtask)
            do {
                try CoreDataManager.shared.context.save()
                self.tableView.reloadData()
            } catch {
                print("Error saving subtask: \(error)")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return note?.subtasks?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubtaskCell", for: indexPath)
        if let subtask = note?.subtasks?[indexPath.row] as? Subtask {
            cell.textLabel?.text = subtask.title
            cell.accessoryType = subtask.isCompleted ? .checkmark : .none
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let subtask = note?.subtasks?[indexPath.row] as? Subtask {
            subtask.isCompleted.toggle()
            do {
                try CoreDataManager.shared.context.save()
                tableView.reloadData()
            } catch {
                print("Error updating subtask: \(error)")
            }
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete, let subtask = note?.subtasks?[indexPath.row] as? Subtask {
            CoreDataManager.shared.context.delete(subtask)
            do {
                try CoreDataManager.shared.context.save()
                tableView.reloadData()
            } catch {
                print("Error deleting subtask: \(error)")
            }
        }
    }
}



