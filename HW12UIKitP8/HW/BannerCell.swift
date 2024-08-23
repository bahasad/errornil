//
//  BannerCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    static var reuseId: String = "BannerCell"
    
    var imageView: UIImageView = CustomImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 10
        contentView.backgroundColor = .none
        contentView.addSubview(imageView)
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setupCell(item: CollectionItem) {
        imageView.image = UIImage(named: item.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
