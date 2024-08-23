//
//  StoryCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var reuseId: String {get}
    var imageView: UIImageView {get set}
    func setupCell(item: CollectionItem)
}

class StoryCell: UICollectionViewCell, CellProtocol {
    
    
    
    static var reuseId: String = "StoryCell"
    
//    lazy var imageView: UIImageView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.contentMode = .scaleAspectFill
//        $0.clipsToBounds = true
//        $0.layer.cornerRadius = 40
//        $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        return $0
//    }(UIImageView())
    
    var imageView: UIImageView = CustomImageView(radius: 40)
    
    lazy var nameLabel = CustomLabel(textAlignment: .center, size: 16, weight: .medium)
    
//    lazy var nameLabel: UILabel = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.numberOfLines = 0
//        $0.textAlignment = .center
//        return $0
//    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        print(contentView.frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupCell(item: CollectionItem) {
        
        imageView.image = UIImage(named: item.image)
        nameLabel.text = item.name
        
       
    }
    
    
}
