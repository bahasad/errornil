//
//  FooterView.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/30/24.
//

import UIKit

class FooterView: UIView {
    
    let imageView: UIImageView = {
        $0.image = .buildingcomplex
        $0.layer.cornerRadius = 8
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var boldLabel: UILabel = {
        $0.text = "Ольховый Квартал от 8 029 445 ₽"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
        }(UILabel())
    
    private lazy var lightLabel: UILabel = {
        $0.text = "Москва, поселение Сосенское, деревня Столбово"
        $0.textColor = UIColor(hex: "#7B6D6D")
        $0.font = UIFont.systemFont(ofSize: 9)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    

    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor(hex: "#F8F8F8")
        self.addSubviews(view: imageView, boldLabel, lightLabel)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    func configureLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 122),
            boldLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 9),
            boldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            boldLabel.widthAnchor.constraint(equalToConstant: 133),
            lightLabel.topAnchor.constraint(equalTo: boldLabel.bottomAnchor, constant: 9),
            lightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            
        ])
        
        
    }
    func setLabel() {
        
    }

}
