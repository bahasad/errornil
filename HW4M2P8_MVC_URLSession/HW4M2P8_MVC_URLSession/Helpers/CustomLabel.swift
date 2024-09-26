//
//  CustomLabel.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/21/24.
//

import UIKit

class CustomLabel: UILabel {
    
    init(size: CGFloat, weight: UIFont.Weight = .bold, textColor: UIColor = .black ){
        super.init(frame: .zero)
        font = .systemFont(ofSize: size, weight: weight)
        self.textColor = textColor
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
