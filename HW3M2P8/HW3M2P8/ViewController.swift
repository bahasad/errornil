//
//  ViewController.swift
//  HW3M2P8
//
//  Created by Baha Sadyr on 9/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    
    var responseArr: [Response] = []
    
    lazy var collectionView: UICollectionView = {
        $0.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout()))

    
    private func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 10
        let sectionInset: CGFloat = 20
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing + sectionInset * 2
        let itemWidth = (view.frame.width - totalSpacing) / numberOfItemsPerRow
        layout.itemSize = CGSize(width: itemWidth, height: 200)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: 0, right: sectionInset)
        return layout
    }
    lazy var btn: UIButton = {
        $0.frame = CGRect(x: view.frame.width - 60, y: view.frame.height - 60, width: 50, height: 50)
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.backgroundColor = .red
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.sendReq()
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(btn)
    }
    
    
   


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        responseArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseId, for: indexPath) as! MainCell
            cell.setCellData(items: responseArr[indexPath.item])
            return cell
        }
        
    }
    
    
}

extension ViewController {
    func sendReq() {
        networkManager.sendReq { [weak self] results in
            guard let self = self else { return }
            print(results ?? "def")
            self.responseArr = results!
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



