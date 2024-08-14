//
//  SharedImage.swift
//  HW
//
//  Created by Baha Sadyr on 8/13/24.
//

import UIKit

class SharedImage: UIImageView {

    override init(image: UIImage?) {
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
