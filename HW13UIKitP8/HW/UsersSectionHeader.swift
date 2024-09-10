//
//  UsersSectionHeader.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class UsersSectionHeader: UICollectionReusableView {
    
    static let reuseId = "UsersSectionHeader"
    
    lazy var headerText: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .black)
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var headerBtn: UIButton = {
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton())
    
    lazy var hStack: UIStackView = {
        $0.addArrangedSubview(headerText)
        $0.addArrangedSubview(headerBtn)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [hStack].forEach {
            addSubview($0)
        }
        configure()
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
//            headerText.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            headerText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
//            headerBtn.topAnchor.constraint(equalTo: headerText.topAnchor),
//            headerBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
        ])
        
        
        
    }
    
    func setHeaderData(item: CollectionSection) {
        headerText.text = item.header
        headerBtn.setTitle( item.headerBtntext, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
