//
//  MainCell.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/21/24.
//

import UIKit
import Kingfisher

class MainCell: UICollectionViewCell {
    static var reuseId = "MainCell"
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = CustomLabel(size: 16)
    
    private lazy var descLabel: UILabel = CustomLabel(size: 14, weight: .light, textColor: UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1.0))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        layer.cornerRadius = 20
        [imageView, titleLabel, descLabel].forEach {
            contentView.addSubview($0)
        }
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 186),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        ])
        
    }
    
    func setCellData(items: Items) {
        guard let url = URL(string: items.posterUrl ?? "" ) else { return }
        imageView.kf.setImage(with: url, placeholder: UIImage(systemName: "plus"))
        titleLabel.text = items.nameRu
        descLabel.text = items.nameOriginal
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
