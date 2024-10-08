//
//  SeconVCTextField.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/23/24.
//

import UIKit

class SeconVCTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = UIColor(hex: "#F1F1F1")
        layer.cornerRadius = 10
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        leftView = leftPaddingView
        leftViewMode = .always
        
    }

}
