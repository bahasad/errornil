//
//  HeaderFooterView.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/30/24.
//

import UIKit

class HeaderFooterView: UIView {
   
   
    private var boldText: String
    private var boldLabelFontSize: CGFloat
    
    private lazy var boldLabel: UILabel = {
        $0.text = boldText
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: boldLabelFontSize)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
        }(UILabel())
    
    
    
    private var lightText: String
    
    private lazy var lightLabel: UILabel = {
        $0.text = lightText
        $0.textColor = UIColor(hex: "#7B6D6D")
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var btn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(.arrowbtn, for: .normal)
        return $0
    }(UIButton())

    init(radius: CGFloat = 0, boldText: String, boldLabelFontSize: CGFloat = 15, lightText: String, includeBtn: Bool = false, lightLabelWidth: CGFloat, lightLabelHeight: CGFloat, backgroundColor: UIColor? = .white, boldLabelWidth: CGFloat? = nil) {
        self.boldText = boldText
        self.lightText = lightText
        self.boldLabelFontSize = boldLabelFontSize
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = radius
        self.backgroundColor = backgroundColor
        self.addSubviews(view: boldLabel, lightLabel)
        
        if includeBtn {
            self.addSubview(btn)
        }
        
        
        configure(boldText: boldText, lightText: lightText, boldLabelFontSize: boldLabelFontSize, includeBtn: includeBtn, lightLabelWidth: lightLabelWidth, lightLabelHeight: lightLabelHeight, boldLabelWidth: boldLabelWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(boldText: String, lightText: String, boldLabelFontSize: CGFloat, includeBtn: Bool, lightLabelWidth: CGFloat, lightLabelHeight: CGFloat, boldLabelWidth: CGFloat?) {
        boldLabel.text = boldText
        lightLabel.text = lightText
        boldLabel.font = UIFont.boldSystemFont(ofSize: boldLabelFontSize)
        NSLayoutConstraint.activate([
            boldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            boldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            lightLabel.topAnchor.constraint(equalTo: boldLabel.bottomAnchor, constant: 4),
            lightLabel.leadingAnchor.constraint(equalTo: boldLabel.leadingAnchor),
            lightLabel.widthAnchor.constraint(equalToConstant: lightLabelWidth),
            lightLabel.heightAnchor.constraint(equalToConstant: lightLabelHeight),
            
        ])
        if let width = boldLabelWidth {
            boldLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if includeBtn {
            NSLayoutConstraint.activate([
                btn.heightAnchor.constraint(equalToConstant: 10),
                btn.widthAnchor.constraint(equalToConstant: 5),
                btn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17.5),
                btn.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            ])

        }

        
    }


}
