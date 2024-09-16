//
//  MainCell.swift
//  HW
//
//  Created by Baha Sadyr on 9/11/24.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    static var reuseId = "MainCell"
    
    private lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var titleLabel = setLabel(weight: .bold)
    
    private lazy var descLabel = setLabel(weight: .light)
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)

        [imageView, titleLabel, descLabel].forEach {
            contentView.addSubview($0)
        }
        
        setConstraints()
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 182),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        
    }
    
    func setCellData(results: Results) {
        guard let url = URL(string: results.image ?? "" ) else { return }
        imageView.load(url: url)
        titleLabel.text = results.name
        descLabel.text = results.gender
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabel(weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    
}
