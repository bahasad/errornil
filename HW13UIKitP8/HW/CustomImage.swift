//
//  CustomImage.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class CustomImage: UIImageView {

    init(radius: CGFloat = 0) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
