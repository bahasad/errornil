//
//  FooterBtn.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class FooterBtn: UIButton {

    init() {
        super.init(frame: .zero)
        configure()
    }
    func configure() {
        backgroundColor = .black
        layer.cornerRadius = 25
        setTitle("show details", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
