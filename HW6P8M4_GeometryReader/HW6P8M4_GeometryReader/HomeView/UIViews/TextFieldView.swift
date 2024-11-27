//
//  TextFieldView.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import UIKit

class TextFieldView: UIView {
    
    lazy var textField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        $0.leftView = UIView(frame: CGRect(x: 00, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.layer.cornerRadius = 15
        $0.placeholder = "Enter text here"
        return $0
    }(UITextField())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textField)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setDelegate(_ delegate: UITextFieldDelegate) {
        textField.delegate = delegate
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
