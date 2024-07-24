//
//  FirstVCUILabel.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/23/24.
//

import UIKit

class FirstVCUILabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, text: String, weight: UIFont.Weight, textColor : UIColor = .black){
        super.init(frame: frame)
        self.text = text
        font = UIFont.systemFont(ofSize: 16, weight: weight)
        self.textColor = textColor
        
    }
    
    private func configure() {
       
        
    }
    
    
    
    
    
}
