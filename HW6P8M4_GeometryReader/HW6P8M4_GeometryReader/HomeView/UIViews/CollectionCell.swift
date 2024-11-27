//
//  CollectionCell.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import UIKit
import Kingfisher

class CollectionCell: UICollectionViewCell {
    
    static var reuseId = "CollectionCell"
    
    lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 8)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var labelText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 8)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView, label, labelText].forEach {
            contentView.addSubview($0)
        }
        setConstraints()
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        contentView.layer.cornerRadius = 15
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            labelText.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            labelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    func setData(item: DataModel) {
        label.text = item.firstName
        labelText.text = item.lastName
        if let url = URL(string: item.avatar) {
            imageView.kf.setImage(with: url, placeholder: UIImage(systemName: "plus"))
        } else {
            imageView.image = UIImage(systemName: "person")
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

