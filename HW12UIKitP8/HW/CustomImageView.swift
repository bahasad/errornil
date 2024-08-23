//
//  CustomImageView.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import UIKit

class CustomImageView: UIImageView {

    init(radius: CGFloat = 0, contentMode: UIView.ContentMode = .scaleAspectFill) {
        super.init(frame: .zero)
        configure(radius: radius, contentMode: contentMode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(radius: CGFloat, contentMode: UIView.ContentMode) {
        translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode
        clipsToBounds = true
        layer.cornerRadius = radius
    }

}
