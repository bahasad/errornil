//
//  CollectionViewController.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import UIKit

class CollectionViewController: UIViewController {
    
    var firstName: String?
    var lastName: String?
    var viewModel : HomeViewModel?
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.collectionViewLayout = setLayout()
        $0.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.reuseId)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: setLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setConstraints()
    }
    
    private func setLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 10 , left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 150)
        return layout
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel?.items.count ?? 0
        print("No of items \(count)")
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseId, for: indexPath) as! CollectionCell
        if let item = viewModel?.items[indexPath.row] {
            print("Configured cell for: \(item)")
            cell.setData(item: item)
        }
        return cell
    }
    
    
}

