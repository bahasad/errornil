//
//  SharedLabel.swift
//  HW
//
//  Created by Baha Sadyr on 8/10/24.
//

import UIKit

final class SharedLabel: UILabel {

    init(size: CGFloat, weight: UIFont.Weight = .bold){
        super.init(frame: .zero)
        
        configure(size: size, weight: weight)
        
    }
    
    private func configure(size: CGFloat, weight: UIFont.Weight) {
        font = UIFont.systemFont(ofSize: size, weight: weight)
        textColor = .white
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
