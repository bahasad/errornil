//
//  RoundBtn.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class RoundBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }

    init(frame: CGRect, radius: CGFloat, image: UIImage?,backgroundColor: UIColor? ) {
        super.init(frame: frame)
        self.layer.cornerRadius = radius
        setBackgroundImage(image, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}
