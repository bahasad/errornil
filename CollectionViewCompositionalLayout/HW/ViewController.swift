//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        $0.backgroundColor = .white
        $0.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: ViewController.createLayout()))
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        //item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1))
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.5)))
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2)
        
        //group
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticalStackItem,
            count: 2
        )
        
        let tripletItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .absolute(100)))
        
        let tripletHorizontazGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/3)),
            subitem: tripletItem,
            count: 3)
        
        
        
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(2/3)
            ),
            subitems: [
                item, verticalStackGroup
            ]
            )
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(3/5)
            ),
            subitems: [
                horizontalGroup, tripletHorizontazGroup
            ])
        //section
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        //return
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Page"
        view.addSubview(collectionView)
        
    }
    
}
extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseId, for: indexPath) as! MyCollectionViewCell
        return cell
    }
    
    
}

//extension ViewController {
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
//            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            btn.heightAnchor.constraint(equalToConstant: 60)
//        ])
//    }
//}

