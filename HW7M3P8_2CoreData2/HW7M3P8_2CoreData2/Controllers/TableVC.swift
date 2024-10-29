//
//  TableVC.swift
//  HW7M3P8_2CoreData2
//
//  Created by Baha Sadyr on 10/28/24.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class TableVC: UIViewController {
    
    private var viewModel = ViewModel()
    private var disposeBag = DisposeBag()
    
    lazy var btn: UIButton = {
        $0.backgroundColor = .blue
        $0.setTitle("Add", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 15
        $0.frame = CGRect(x: Int(view.frame.width - 120.0) , y: Int(view.frame.height - 100), width: 100, height: 50)
        return $0
    }(UIButton())
    
    lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseId)
        return $0
    }(UITableView(frame: self.view.frame, style: .insetGrouped))
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Notes"
        view.addSubview(tableView)
        view.addSubview(btn)
        viewModel.fetchAllNotes()
        bindTableView()
        addBtn()
        setDelegates()
    }
    
    func addBtn() {
//        btn.rx.tap.subscribe(onNext: { [weak self] in
//            guard let self = self else { return }
//            let alert = UIAlertController(title: "Add Note", message: "Enter the note name", preferredStyle: .alert)
//            alert.addTextField { textField in
//                textField.placeholder = "Note name"
//            }
//            let addAction = UIAlertAction(title: "Add", style: .default) { _ in
//            if let noteName = alert.textFields?.first?.text, !noteName.isEmpty {
//                self.viewModel.addNote(name: noteName)
//                }
//            }
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            alert.addAction(addAction)
//            alert.addAction(cancelAction)
//            self.present(alert, animated: true, completion: nil)
//           
//        })
//        .disposed(by: disposeBag)
        btn.rx.tap.flatMapLatest { [weak self] _ -> Observable<String?> in
                guard let self = self else { return Observable.just(nil) }
                return Observable.create { observer in
                    let alert = UIAlertController(title: "Add Note", message: "Enter the note name", preferredStyle: .alert)
                    alert.addTextField { textField in
                        textField.placeholder = "Note name"
                    }
                    let addAction = UIAlertAction(title: "Add", style: .default) { _ in
                        let text = alert.textFields?.first?.text
                        observer.onNext(text)
                        observer.onCompleted()
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                        observer.onCompleted()
                    }
                    alert.addAction(addAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)
                    return Disposables.create {
                        alert.dismiss(animated: true, completion: nil)
                    }
                }
            }
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [weak self] noteName in
                self?.viewModel.addNote(name: noteName)
            })
            .disposed(by: disposeBag)

    }
    
    func bindTableView() {
        viewModel.notes.bind(to: tableView.rx.items(cellIdentifier: CustomTableViewCell.reuseId, cellType: CustomTableViewCell.self)) { (row, item, cell) in
            cell.textLabel?.text = item.name
    
        }.disposed(by: disposeBag)
        tableView.rx.itemSelected.subscribe(onNext: { indexPath in
            let alert = UIAlertController(title: "Note", message: "Edit Note", preferredStyle: .alert)
            alert.addTextField { textField in
                
            }
            alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { action in
                let textField = alert.textFields![0] as UITextField
                self.viewModel.editNote(name: textField.text ?? "", index: indexPath.row)
            }))
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            
        }).disposed(by: disposeBag)
        
        tableView.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            self.viewModel.deleteNote(index: indexPath.row)
        }).disposed(by: disposeBag)
    }
}

extension TableVC: UITableViewDelegate {
    
    func setDelegates() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
}

