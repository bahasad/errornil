//
//  SharedStack.swift
//  HW
//
//  Created by Baha Sadyr on 8/13/24.
//

import UIKit

class SharedStack: UIStackView {
    
    private var stackDistribution: UIStackView.Distribution
    
    private var stackAlignment: UIStackView.Alignment
    
    private var stackSpacing: CGFloat

    init(stackDistribution: UIStackView.Distribution, stackAlignment: UIStackView.Alignment = .fill, stackSpacing: CGFloat = 0.0) {
        self.stackDistribution = stackDistribution
        self.stackAlignment = stackAlignment
        self.stackSpacing = stackSpacing
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
