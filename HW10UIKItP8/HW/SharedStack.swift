//
//  SharedStack.swift
//  p8m2l10
//
//  Created by Baha Sadyr on 8/15/24.
//

import UIKit

class SharedStack: UIStackView {

    init(distribution: UIStackView.Distribution, spacing: CGFloat = 0){
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = distribution
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
