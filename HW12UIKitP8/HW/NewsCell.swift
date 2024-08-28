//
//  NewsCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import UIKit

class NewsCell: UICollectionViewCell, CellProtocol {
    
    static var reuseId: String = "NewsCell"
    
    var imageView: UIImageView = CustomImageView(contentMode: .scaleAspectFill)
    
    lazy var titleLabel = CustomLabel(size: 24, weight: .bold, color: .white)
    
    lazy var descLabel = CustomLabel(size: 14, weight: .medium, color: .white)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 10
        
        [imageView, titleLabel, descLabel].forEach {
            contentView.addSubview($0)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40)
            
        ])
    }
    
    func setupCell(item: CollectionItem) {
        imageView.image = UIImage(named: item.image)
        titleLabel.text = item.header
        descLabel.text = item.text
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
