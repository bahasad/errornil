//
//  ViewController.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/21/24.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func reloadData()
}

class ViewController: UIViewController, ViewControllerProtocol, UICollectionViewDelegate {
    
    var presenter: MainViewPresenterProtocol!
    
    lazy var collectionView: UICollectionView = {
        $0.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseId)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: layout()))
    
    private func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 10
        let sectionInset: CGFloat = 20
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing + sectionInset * 2
        let itemWidth = (view.frame.width - totalSpacing) / numberOfItemsPerRow
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.6)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: 0, right: sectionInset)
        return layout
    }
    
    lazy var btn: UIButton = {
        let width = 390.0
        let height = 66.0
        $0.frame = CGRect(x: view.frame.width - width - CGFloat(20), y: view.frame.height - height - CGFloat(38), width: width, height: 66)
        $0.backgroundColor = .blue
        $0.setTitle("Получить запипи", for: .normal)
        $0.titleLabel?.font = . systemFont(ofSize: 12, weight: .light)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.presenter.fetchData()
    })))
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(btn)
        
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getItemCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseId, for: indexPath) as! MainCell
        let item = presenter.getItem(at: indexPath.row)
        cell.setCellData(items: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = presenter.getItem(at: indexPath.row)
        let detailVC = Builder.createDetailView(item: item)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

