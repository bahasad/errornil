//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    private var results: [Results] = []
    
    private lazy var btn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .blue
        $0.setTitle("Получить запипи", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
        $0.setTitleColor(.white, for: .normal)
        return $0
    }(UIButton(primaryAction: UIAction(handler: {  _ in
        self.sendReq()
    })))
    
    private lazy var collectionView: UICollectionView = {
        $0.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: setLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [collectionView, btn].forEach {
            view.addSubview($0)
        }
        setConstraints()
    }
    
    private func setLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            default: self.createSection()
            }
            
        }
    }
    
    private func createSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) ,
                                                                             heightDimension: .fractionalHeight(1) ))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(206), heightDimension: .absolute(286) ), repeatingSubitem: item, count: 2 )

        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38),
            btn.heightAnchor.constraint(equalToConstant: 66),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseId, for: indexPath) as! MainCell
            cell.setCellData(results: results[indexPath.item])
            UIImageView.load()
            return cell
        }
    }
    
    
}

extension ViewController {
    func sendReq(){
        networkManager.sendRequest { [weak self] results in
            guard let self = self else { return }
            self.results = results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }
    
}
