//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    var userData: [UserData] = UserData.mockData()
    
    lazy var collectionView: UICollectionView = {
        $0.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        $0.dataSource = self
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
        $0.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        $0.register(CarsCell.self, forCellWithReuseIdentifier: CarsCell.reuseID)
        $0.refreshControl = refresh
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout))
    
    lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.itemSize = CGSize(width: view.frame.width/2 - 32, height: 164)
        return $0
    }(UICollectionViewFlowLayout())
    
    lazy var refresh: UIRefreshControl = {
        return $0
    }(UIRefreshControl(frame: .zero, primaryAction: UIAction(handler: { [weak self] _ in
        self?.refresh.endRefreshing()
        self?.userData.insert(UserData(image: "AudiQ5.jpg", carName: "Audi Q555", carPrice: "1000 P", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]), at: 0)
        self?.collectionView.reloadData()
        
    })))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.backgroundColor = .red
        
    }


}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarsCell.reuseID, for: indexPath) as! CarsCell
        let item = userData[indexPath.item]
        cell.setCell(item: item)
        return cell
    }
    
    
}

