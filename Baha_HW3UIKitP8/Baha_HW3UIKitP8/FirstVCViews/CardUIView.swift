//
//  CardUIView.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/23/24.
//

import UIKit

class CardUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(hex: "#F1F1F1")
        self.layer.cornerRadius = 10
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}
