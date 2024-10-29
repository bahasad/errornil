//
//  NoteListViewController.swift
//  HW7M3P8_CoreData
//
//  Created by Baha Sadyr on 10/23/24.
//

import UIKit

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var notes: [Note] = []
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNote))
        setupTableView()
        fetchNotes()
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoteCell")
    }

    func fetchNotes() {
        notes = CoreDataManager.shared.fetchNotes()
        tableView.reloadData()
    }

    @objc func addNote() {
        let noteDetailsVC = NoteDetailsViewController()
        noteDetailsVC.delegate = self
        navigationController?.pushViewController(noteDetailsVC, animated: true)
    }

    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.header
        if let date = note.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subtasksVC = SubtaskListViewController()
        subtasksVC.note = notes[indexPath.row]
        navigationController?.pushViewController(subtasksVC, animated: true)
    }
}

extension NoteListViewController: NoteDetailsViewControllerDelegate {
    func didSaveNote() {
        fetchNotes()
    }
}

