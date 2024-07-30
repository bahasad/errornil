//
//  WriteBtn.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

final class WriteBtn: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
       
    }

    init( titleStr: String = "Написать", radius: CGFloat) {
        super.init(frame: .zero)
        
        self.setTitle(titleStr, for: .normal)
        self.layer.cornerRadius = radius
        self.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        titleLabel?.font = .systemFont(ofSize: 16)
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(hex: "#25A952")
    }
}
