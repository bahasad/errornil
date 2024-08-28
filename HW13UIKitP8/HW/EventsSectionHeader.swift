//
//  EventsSectionHeader.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class EventsSectionHeader: UICollectionReusableView {
    
    static let reuseId = "EventsSectionHeader"
    
    lazy var headerText: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .black)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var headerBtn: UIButton = {
        $0.setTitleColor(.black, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        $0.setTitleColor(.blue, for: .normal)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [headerText, headerBtn].forEach {
            addSubview($0)
        }
        configure()
    }
    
    func configure() {
        NSLayoutConstraint.activate([
            headerText.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
//            headerText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            headerBtn.topAnchor.constraint(equalTo: headerText.topAnchor),
            headerBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            headerBtn.bottomAnchor.constraint(equalTo: headerText.bottomAnchor)
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
