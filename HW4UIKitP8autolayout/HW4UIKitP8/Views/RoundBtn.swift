//
//  RoundBtn.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class RoundBtn: UIButton {

   
    init(radius: CGFloat, image: UIImage?,backgroundColor: UIColor? ) {
        super.init(frame: .zero)
        self.layer.cornerRadius = radius
        setBackgroundImage(image, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
