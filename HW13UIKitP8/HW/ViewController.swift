

import UIKit



class ViewController: UIViewController {

    
    private let inset: CGFloat = 30
    private let data = CollectionSection.mocData()
    
    lazy var collectionView: UICollectionView = {
        $0.backgroundColor = UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1.0)
        $0.dataSource = self
        $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.reuseId)
        $0.register(NewsSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NewsSectionHeader.reuseID)
        $0.register(NewsSectionFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NewsSectionFooter.reuseId)
        $0.register(EventsCell.self, forCellWithReuseIdentifier: EventsCell.reuseId)
        $0.register(EventsSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventsSectionHeader.reuseId)
        $0.register(UsersCell.self, forCellWithReuseIdentifier: UsersCell.reuseId)
        $0.register(UsersSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: UsersSectionHeader.reuseId)
        $0.delegate = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout:  createLayout()))
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { section, _ in
            
            switch section{
                case 0: return self.createNewsSection()
                case 1: return self.createEventsSection()
                default: return self.createUsersSection()
            }
        }
    }
    
    //NSCollectionLayoutBoundarySupplementaryItem
    //boundarySupplementaryItems

    //1 - delegate + viewForSupplementaryElementOfKind +
    //2 - create header cell - UICollectionReusableView +
    //3 - register+
    //4 - setup size+
    //5 - add in section

    private func createNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(314),
                                               heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: inset, bottom: 0, trailing: inset)
        
        section.boundarySupplementaryItems = [self.setupHeaderSize(), setupFooterSize()]
        
        return section
    }
    
    private func createEventsSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.73),
                                                                                        heightDimension: .estimated(44)), repeatingSubitem: item, count: 3)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = [self.setupHeaderSize()]
        
        return section
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(193)),
                                                       repeatingSubitem: item, count: 1)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        section.boundarySupplementaryItems = [self.setupUsersHeaderSize()]
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)
        
        return section
        
    }
    
    private func setupUsersHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
         let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(25)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 43, bottom: 15, trailing: 43)
        return header
    }
    
    
    
    
    private func setupHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem{
        
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(64)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    private func setupFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem{
        
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: . estimated(30)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }

}


extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = data[indexPath.section].items[indexPath.item]
        
        switch indexPath.section{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:NewsCell.reuseId, for: indexPath) as! NewsCell
            cell.setupCellData(item: item)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventsCell.reuseId, for: indexPath) as! EventsCell
            cell.setCellData(item: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCell.reuseId, for: indexPath) as! UsersCell
            cell.setCellData(item: item)
            return cell
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        let item = data[indexPath.section]
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
           
            
            switch indexPath.section {
                
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsSectionHeader.reuseID, for: indexPath) as! NewsSectionHeader
                
                header.setupHeader(text: item.header, type: .news)
                
                return header
            
            case 1:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EventsSectionHeader.reuseId, for: indexPath) as! EventsSectionHeader
                
                header.setHeaderData(item: data[indexPath.section])
                
                return header
            default:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UsersSectionHeader.reuseId, for: indexPath) as! UsersSectionHeader
                header.setHeaderData(item: data[indexPath.section])
                return header
            }
            
           
            
            
            default:
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsSectionFooter.reuseId, for: indexPath) as! NewsSectionFooter
        
            footer.setFooterData(item: item)
            
            return footer
        }
    
    }
}
