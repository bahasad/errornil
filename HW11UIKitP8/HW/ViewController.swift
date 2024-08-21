//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let userData = UserData.mockData()
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        
        
        $0.showsVerticalScrollIndicator = false
        $0.dataSource = self
        $0.register(DetailsCell.self, forCellWithReuseIdentifier: DetailsCell.reuseId)
        $0.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        return $0
        
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCell.reuseId, for: indexPath) as! DetailsCell
        let item = userData[indexPath.item]
        cell.setData(item: item)
        return cell
    }
    
    
}

struct UserData {
    var imgInImg: String
    var mainImage: String
    var nameLabel: String
    var dateLabel: String
    var mainTitleLabel: String
    var descLabel: String
    
    static func mockData() -> [UserData] {
        [
            UserData(imgInImg: "Face082001", mainImage: "Nature082001", nameLabel: "User Name", dateLabel: "23 апреля 2024", mainTitleLabel: "Ut enim ad minim veniam", descLabel: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip\nex ea commodo consequat. Duis aute irure\ndolor in "),
//            UserData(imgInImg: "Face082001", mainImage: "Nature082001", nameLabel: "User Name", dateLabel: "23 апреля 2024", mainTitleLabel: "Ut enim ad minim veniam", descLabel: "Lorem ipsum dolor sit amet, consectetur"),
            UserData(imgInImg: "Face082002", mainImage: "Nature082003", nameLabel: "User Name 2", dateLabel: "23 апреля 2024", mainTitleLabel: "Ut enim ad minim veniam\n  eiusmod tempor", descLabel: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit, sed do eiusmod tempor\nincididunt ut labore"),
            UserData(imgInImg: "Face082003", mainImage: "Nature082002", nameLabel: "User Name 3", dateLabel: "23 апреля 2024", mainTitleLabel: "Ut enim ad minim veniam\n  eiusmod tempor", descLabel: "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do ")
        ]
    }
}

