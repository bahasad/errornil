//
//  SharedImageView.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/30/24.
//

import UIKit

class SharedImageView: UIImageView {

    init(radius: CGFloat = 0, image: UIImage?) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = radius
        self.image = image
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
       
        
    }

}
