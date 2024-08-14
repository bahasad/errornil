//
//  SharedLabel.swift
//  HW
//
//  Created by Baha Sadyr on 8/13/24.
//

import UIKit

class SharedLabel: UILabel {
    
    var size: CGFloat
    
    var weight: UIFont.Weight
    
    var color: UIColor
    
    var texxt: String

    init(size: CGFloat, weight: UIFont.Weight, color: UIColor = .black, texxt: String){
        self.size = size
        self.weight = weight
        self.color = color
        self.texxt = texxt
        super.init(frame: .zero)
        
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: self.size, weight: self.weight)
        textColor = self.color
        text = self.texxt
        numberOfLines = 0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
