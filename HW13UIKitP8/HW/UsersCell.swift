//
//  UsersCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class UsersCell: UICollectionViewCell {
    
    static let reuseId = "UsersCell"
    
    private lazy var imageMain = CustomImage(radius: 26)
    
    private lazy var nameLabel = CustomLabel(size: 14, weight: .bold)
    
    private lazy var descLabel = CustomLabel(size: 14, weight: .light, color: UIColor(red: 152/255.0, green: 152/255.0, blue: 152/255.0, alpha: 1.0))
    
    private lazy var writeBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton())

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 15
        [imageMain, nameLabel, descLabel, writeBtn].forEach {
            contentView.addSubview($0)
        }
        setConstraints()
    }
    
    private func setConstraints() {
        descLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            imageMain.widthAnchor.constraint(equalToConstant: 50),
            imageMain.heightAnchor.constraint(equalToConstant: 50),
            imageMain.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageMain.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            nameLabel.topAnchor.constraint(equalTo: imageMain.bottomAnchor, constant: 4),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            descLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            writeBtn.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 11),
            writeBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setCellData(item: CollectionItems) {
        imageMain.image = UIImage(named: item.image)
        nameLabel.text = item.name
        descLabel.text = item.text
        writeBtn.setTitle(item.headerText, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
