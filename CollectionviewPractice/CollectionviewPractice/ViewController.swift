//
//  ViewController.swift
//  CollectionviewPractice
//
//  Created by Baha Sadyr on 8/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    let userData = UserData.mockData()
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.contentInset = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
        $0.alwaysBounceVertical = true
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .white
        $0.register(GroupCellCollectionViewCell.self, forCellWithReuseIdentifier: GroupCellCollectionViewCell.reuseId)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 20
        $0.itemSize = CGSize(width: view.frame.width / 2 - 32, height: 200)
        return $0
    }(UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        view.backgroundColor = .lightGray
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupCellCollectionViewCell.reuseId, for: indexPath) as! GroupCellCollectionViewCell
        let item = userData[indexPath.item]
        cell.setCell(item: item)
        
        return cell
    }
    
    
}

