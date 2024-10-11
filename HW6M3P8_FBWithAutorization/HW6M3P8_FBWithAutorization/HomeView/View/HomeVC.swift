//
//  HomeVC.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/5/24.
//

import UIKit

class HomeVC : UIViewController {
    
    private var fbManager = FBManager()
    private let noteService = NoteService()
    var notes: [Note] = []
    

    
    lazy var addBtn: UIButton = {
        $0.backgroundColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .light)
        return $0
    }(UIButton(primaryAction: addAction))
    
    lazy var signOutBtn: UIButton = {
        $0.backgroundColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.setTitle("ВЫЙТИ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .light)
        return $0
    }(UIButton(primaryAction: outAction))
    
    lazy var collectionView: UICollectionView = {
        $0.register(HomeVCCell.self, forCellWithReuseIdentifier: HomeVCCell.reuseId)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: setCollectionViewLayout()))
    
    private func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //layout.estimatedItemSize = CGSize(width: 200, height: 150)
        let padding = 20.0
        //let totalPadding = padding * 2
       // let itemWidth = (view.frame.width - totalPadding) // Calculate item width
        let itemHeight: CGFloat = 100
        layout.itemSize = CGSize(width: view.frame.width - (padding), height: itemHeight)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
    
    lazy var outAction: UIAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        fbManager.signOut()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.login])
        
    }
    
    lazy var addAction: UIAction = UIAction { [weak self] _ in
        guard let self = self else { return }
        let addNoteVC = AddNoteVC()
        navigationController?.pushViewController(addNoteVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noteService.loadNotes { [weak self] note in
            guard let self = self else { return }
            self.notes = note
            
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(signOutBtn)
        view.addSubview(addBtn)
        setConstraints()
        
        
        
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        let location = gesture.location(in: collectionView)
        if let indexPath = collectionView.indexPathForItem(at: location) {
            let note = notes[indexPath.item]
            notes.remove(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
            noteService.deleteNote(note: note)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            signOutBtn.heightAnchor.constraint(equalToConstant: 40),
            signOutBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            signOutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            signOutBtn.widthAnchor.constraint(equalToConstant: 60),
            collectionView.topAnchor.constraint(equalTo: signOutBtn.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addBtn.heightAnchor.constraint(equalToConstant: 40),
            addBtn.widthAnchor.constraint(equalToConstant: 40),
            addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            addBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
        ])
    }
    
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVCCell.reuseId, for: indexPath) as! HomeVCCell
        let item = notes[indexPath.item]
        cell.setCellData(notes: item)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let addNoteVC = AddNoteVC()
        addNoteVC.note = notes[indexPath.item]
        self.navigationController?.pushViewController(addNoteVC, animated: true)
    }
    
 
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(actionProvider: { suggestedActions in
            if indexPaths.isEmpty {
                return UIMenu(children: [UIAction(title: "New Folder") { _ in }])
            } else if indexPaths.count == 1 {
                return UIMenu(children: [
                    UIAction(title: "Copy") { _ in },
                    UIAction(title: "Delete", attributes: .destructive) { _ in
                        guard let indexPath = indexPaths.first else { return }
                        let note = self.notes[indexPath.item]
                        self.notes.remove(at: indexPath.item)
                        collectionView.deleteItems(at: [indexPath])
                        self.noteService.deleteNote(note: note)
                    }
                ])
            } else {
                return UIMenu(children: [UIAction(title: "New Folder With Selection") { _ in }])
            }
        })
    }



    
    
}
