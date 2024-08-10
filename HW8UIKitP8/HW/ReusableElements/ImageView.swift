//
//  ImageView.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

//
//  headerImageView.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ImageView: UIImageView {

    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        
        configure(cornerRadius: cornerRadius)
    }
    
    private func configure(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
