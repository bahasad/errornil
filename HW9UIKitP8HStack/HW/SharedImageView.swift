//
//  SharedImageView.swift
//  HW
//
//  Created by Baha Sadyr on 8/13/24.
//

import UIKit

class SharedImageView: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
