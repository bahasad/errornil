//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionData = CollectionSection.mockData()
    
    private lazy var collectionView: UICollectionView = {
        $0.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseId)
        $0.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.reuseId)
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseId)
        $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(collectionView)
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                self.createStorySection()
            case 1:
                self.createMessageSection()
            case 2:
                self.createNewsSection()
            default:
                self.createBannerSection()
                
            }
        }
    }
    
    private func createStorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100),
                                               heightDimension: .estimated(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       repeatingSubitem: item, count: 1)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 20)
        
        return section
    }
    
    private func createMessageSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .estimated(98))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 46, trailing: 30)
        
        return section
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .absolute(152))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 46, trailing: 0)
        
        return section
    }

    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(216))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 23, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)
        
        return section
    }
    
   
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = collectionData[indexPath.section].items[indexPath.item]
        
        switch indexPath.section {
        
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.reuseId, for: indexPath) as! StoryCell
            cell.setupCell(item: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.reuseId, for: indexPath) as! MessageCell
            cell.setupCell(item: item)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell
            cell.setupCell(item: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseId, for: indexPath) as! BannerCell
            cell.setupCell(item: item)
            return cell
            
           
        }
    }
    
    
}

