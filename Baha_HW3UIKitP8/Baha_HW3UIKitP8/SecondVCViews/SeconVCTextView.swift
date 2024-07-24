//
//  SeconVCTextView.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/23/24.
//

import UIKit

class SeconVCTextView: UITextView {

        init(frame: CGRect,text: String = "", textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
        self.text = text
        configure()
        
    }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure() {
        backgroundColor = UIColor(hex: "#F1F1F1")
        layer.cornerRadius = 10
        font = .systemFont(ofSize: 16)
        
    }

}
