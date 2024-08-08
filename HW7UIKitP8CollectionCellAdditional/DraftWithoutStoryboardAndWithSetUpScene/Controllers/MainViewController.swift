//
//  MainViewController.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/28/24.
//

import UIKit

struct UserData {
    var mainImage: String
    var imgInImage: String
    let name: String
    let header: String
    let texttLabel: String
    
    static func mockData() -> [UserData] {
        [
            UserData(mainImage: "eagle" , imgInImage: "flowers" , name: "John Doe", header: "Заголовок", texttLabel: "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod\n tempor incididunt ut labore"),
            UserData(mainImage: "wall", imgInImage: "rain", name: "Robert Wilson", header: "Заголовок 2", texttLabel: "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod\n tempor incididunt ut labore in reprehenderit\n in voluptate velit esse cillum dolore eu\n fugiat nulla pariatur. Excepteur Lorem\n ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod tempor\n incididunt ut labore et dolore magna aliqua. " )
        ]
    }
}


final class MainViewController: UIViewController {
    
    var tableData = UserData.mockData()
    
    lazy var collectionView: UICollectionView = {
        $0.dataSource = self
        $0.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.reuseId)
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout()))
    
    
    private func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
//        let viewWidth = self.view.bounds.size.width
        layout.itemSize = CGSize(width: 400, height: 600)
//      layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        ////layout.minimumLineSpacing = 10
        ////.minimumInteritemSpacing = 10
//        layout.sectionInset = .init(top: 30, left: 30, bottom: 30, right: 30)
        layout.scrollDirection = .vertical
        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubviews(view: collectionView)
        setCollection()
    }
    
    private func setCollection() {
        
        
    }
    

   

}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tableData.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tableData[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.reuseId, for: indexPath) as! DetailCell
        cell.setupData(item: item)
        return cell
    }
    

}
