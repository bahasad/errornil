//
//  MessageCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import UIKit

class MessageCell: UICollectionViewCell, CellProtocol  {
    
    static var reuseId: String = "MessageCell"
    
    var imageView: UIImageView = CustomImageView(radius: 20)
    
    lazy var textLabel = CustomLabel(size: 14, weight: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 217/255.0, green: 217/255.0, blue: 217/255.0, alpha: 1.0)
        clipsToBounds = true
        layer.cornerRadius = 10
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    func setupCell(item: CollectionItem) {
        
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
        
       
    }
    
}
