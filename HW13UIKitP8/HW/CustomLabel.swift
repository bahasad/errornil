//
//  CustomLabel.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class CustomLabel: UILabel {

    init(size: CGFloat, weight: UIFont.Weight, color: UIColor = .black) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: size, weight: weight)
        textColor = color
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
