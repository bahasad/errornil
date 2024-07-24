//
//  FirstVCUIButton.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/23/24.
//

import UIKit

class FirstVCUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, title: String, radius: CGFloat ){
        super.init(frame: frame)
        configure()
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = radius
    }
    private func configure() {
        titleLabel?.font = .systemFont(ofSize: 12)
        backgroundColor = .blue
        setTitleColor(.white, for: .normal)
    }

}
