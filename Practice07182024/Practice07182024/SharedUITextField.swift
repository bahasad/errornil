//
//  SharedUITextField.swift
//  Practice07182024
//
//  Created by Baha Sadyr on 7/24/24.
//

import UIKit

class SharedUITextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, leftView: UIView, rightView: UIView) {
        super.init(frame: frame)
        self.leftView = leftView
        self.rightView = rightView
    }
    
    private func configure() {
        
        
    }
}
