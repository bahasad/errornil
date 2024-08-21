//
//  SharedLabel.swift
//  HW
//
//  Created by Baha Sadyr on 8/20/24.
//

import UIKit

final class SharedLabel: UILabel {

    init(size: CGFloat, weight: UIFont.Weight, color: UIColor = .black) {
        super.init(frame: .zero)
        font = .systemFont(ofSize: size, weight: weight)
        textColor = color
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
