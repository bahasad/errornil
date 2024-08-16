//
//  SharedLabel.swift
//  p8m2l10
//
//  Created by Baha Sadyr on 8/15/24.
//

import UIKit

class SharedLabel: UILabel {

    init(size: CGFloat, weight: UIFont.Weight, color: UIColor = .black){
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
        //self.numberOfLines = 0
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
