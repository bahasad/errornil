//
//  AvatarUIView.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class AvatarUIView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    func configure() {
        self.image = .ava
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 25
        
        
    }

}
