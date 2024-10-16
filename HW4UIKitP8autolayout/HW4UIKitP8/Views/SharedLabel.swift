//
//  SharedLabel.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/28/24.
//

import UIKit

class SharedLabel: UILabel {

   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(size: CGFloat, weight: UIFont.Weight, text: String, textColor: UIColor) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: size, weight: weight)
        self.text = text
        self.textColor = textColor
    }
    
    
    

}
