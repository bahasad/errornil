//
//  FirstVCImageView.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/23/24.
//

import UIKit

class FirstVCImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.image = UIImage(named: "girl")
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
    
    
}
