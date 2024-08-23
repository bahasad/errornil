//
//  MyCollectionViewCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/21/24.
//

import UIKit


class MyCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "MyCollectionViewCell"
    
    let images = UserData.mockData()
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        let images: [UIImage] = [
            UIImage(named: "AudiQ5"),
            UIImage(named: "CherryTiggo7"),
            UIImage(named: "cherryTiggoCar"),
            UIImage(named: "GeelyMonjaro"),
            UIImage(named: "LiXiangL9"),
            UIImage(named: "volvoCar"),
        ].compactMap({$0})
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
        
        
        setImages()
        
    }
    
    private func setImages() {
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

struct UserData {
    var image: String
    static func mockData() -> [UserData] {
        [
            UserData(image: "AudiQ5"),
            UserData(image: "CherryTiggo7"),
            UserData(image: "cherryTiggoCar"),
            UserData(image: "GeelyMonjaro"),
            UserData(image: "LiXiangL9"),
            UserData(image: "volvoCar"),
        ]
    }
}
