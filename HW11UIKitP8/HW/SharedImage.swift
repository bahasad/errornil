//
//  SharedImage.swift
//  HW
//
//  Created by Baha Sadyr on 8/20/24.
//

import UIKit

final class SharedImage: UIImageView {

    init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
