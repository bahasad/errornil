//
//  SharedLabel.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/28/24.
//

import UIKit

final class SharedLabel: UILabel {

    init(size: CGFloat, weight: UIFont.Weight = .bold, textColor: UIColor = .black, text: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textColor = textColor
        self.text = text
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.adjustsFontSizeToFitWidth = true
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        
    }

}
