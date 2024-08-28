//
//  NewsSectionFooter.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class NewsSectionFooter: UICollectionReusableView {
    
    static var reuseId = "NewsSectionFooter"
    
    private lazy var descLabel = CustomLabel(size: 12, weight: .light, color: UIColor(red: 152/255.0, green: 152/255.0, blue: 152/255.0, alpha: 1.0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(descLabel)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30),
        ])
       
    }
    
    func setFooterData(item: CollectionSection){
        descLabel.text = item.footer
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
