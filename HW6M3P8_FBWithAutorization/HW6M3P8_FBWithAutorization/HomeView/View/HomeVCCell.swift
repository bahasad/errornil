//
//  HomeVCCell.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/10/24.
//

import UIKit

class HomeVCCell: UICollectionViewCell {
    
    static var reuseId = "HomeVCCell"
    private var build = ViewBuilder()
    private lazy var titleLabel = build.getCustomLabel(size: 14)
    private lazy var descLabel = build.getCustomLabel(size: 12, weight: .light)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
        clipsToBounds = true
        [titleLabel, descLabel].forEach {
            contentView.addSubview($0)
        }
        
        setConstraints()
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
   
    }
    
    func setCellData(notes: Note) {
        titleLabel.text = notes.header
        descLabel.text = notes.note
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
