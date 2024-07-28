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

    init(frame: CGRect, titleStr: String = "Написать", radius: CGFloat) {
        super.init(frame: frame)
        
        self.setTitle(titleStr, for: .normal)
        self.layer.cornerRadius = radius
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
