//
//  CustomLabel.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import UIKit

class CustomLabel: UILabel {

    init(textAlignment: NSTextAlignment = .natural, size: CGFloat = 16, weight: UIFont.Weight = .light, color: UIColor = .black) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        self.textAlignment = textAlignment
        font = .systemFont(ofSize: size, weight: weight)
        textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
