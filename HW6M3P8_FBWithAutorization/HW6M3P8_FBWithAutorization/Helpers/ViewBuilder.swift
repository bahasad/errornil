//
//  ViewBuilder.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/5/24.
//

import UIKit
class ViewBuilder {
    
    
    
    func getMainCustomLabel(color: UIColor = .white, text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = color
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    
    func getTextView(textField: UITextField, placeholder: String, placeholderForTextField: String, isPassword: Bool = false) -> UIStackView {
        
        lazy var hidePassword: UIButton = {
            let btn = UIButton(primaryAction: action)
            btn.setImage(UIImage(systemName: "eye"), for: .normal)
            btn.tintColor = UIColor(red: 160/255, green: 165/255, blue: 186/255, alpha: 1.0)
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        lazy var action = UIAction { _ in
            textField.isSecureTextEntry.toggle()
            if textField.isSecureTextEntry {
                hidePassword.setImage(UIImage(systemName: "eye"), for: .normal)
            } else {
                hidePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            }
            
        }
        
        var placeholderText: UILabel {
            let text = UILabel()
            text.translatesAutoresizingMaskIntoConstraints = false
            text.text = placeholder
            text.font = UIFont.systemFont(ofSize: 16, weight: .light)
            text.textColor = .black
            return text
        }
        lazy var fieldView: UIView = {
            let view = UIView()
            textField.translatesAutoresizingMaskIntoConstraints = false
            view.translatesAutoresizingMaskIntoConstraints = false
            
            textField.isSecureTextEntry = isPassword
            textField.placeholder = placeholderForTextField
            //            view.backgroundColor = .UIColor(red: 240/255, green: 245/255, blue: 250/255, alpha: 1.0)
            view.backgroundColor = UIColor(hex: "#F0F5FA")
            //view.backgroundColor = .gray
            view.layer.cornerRadius = 15
            view.addSubview(textField)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 71),
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21)
            ])
            
            if isPassword {
                view.addSubview(hidePassword)
                hidePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21).isActive = true
                hidePassword.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            }
            
            return view
        }()
        
        lazy var hStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 9.5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(placeholderText)
            stack.addArrangedSubview(fieldView)
            return stack
        }()
        
        return hStack
        
    }
    
    
    func getTermsStack() -> UIStackView {
        
        func getCheckBox() -> UIButton {
            let button = UIButton()
            let checkedImage = UIImage(systemName: "checkmark.square")
            let uncheckedImage = UIImage(systemName: "square")
            button.tintColor = UIColor(hex: "#7E8A97")
            var isChecked = false {
                didSet {
                    updateImage()
                }
            }
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 22).isActive = true
            button.widthAnchor.constraint(equalToConstant: 22).isActive = true
            button.setImage(uncheckedImage, for: .normal)
            
            func updateImage() {
                if isChecked {
                    button.setImage(checkedImage, for: .normal)
                } else {
                    button.setImage(uncheckedImage, for: .normal)
                }
            }
            
            button.addAction(UIAction { _ in
                isChecked.toggle()
                updateImage()
            }, for: .touchUpInside)
            
            return button
        }
        lazy var label: UILabel = {
            $0.text = "Я согласен с Условиями предоставления услуг\nи Политикой конфиденциальности"
            $0.textColor = UIColor(hex: "#7E8A97")
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 13, weight: .light)
            return $0
        }(UILabel())
        
        let checkBox = getCheckBox()
        
        
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(checkBox)
        stack.addArrangedSubview(label)
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }
    
    lazy var enterBtn: UIButton = {
        $0.backgroundColor = UIColor(hex: "#C2182E")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.setTitle("ВОЙТИ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        return $0
        
    }(UIButton(primaryAction: UIAction(handler: { _ in
        
    })))
    func getSignUpTextStack(labelText: String, btnText: String, uiAction: UIAction) -> UIStackView {
        lazy var signUpText: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 9
            stack.alignment = .center
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            var text: UILabel {
                let text = UILabel()
                text.translatesAutoresizingMaskIntoConstraints = false
                text.text = labelText
                text.font = UIFont.systemFont(ofSize: 18, weight: .light)
                return text
            }
            var btn: UIButton {
                let btn = UIButton(primaryAction: uiAction )
                btn.setTitle(btnText, for: .normal)
                btn.translatesAutoresizingMaskIntoConstraints = false
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                btn.setTitleColor(UIColor(hex: "#C2182E"), for: .normal)
                return btn
            }
            stack.addArrangedSubview(text)
            stack.addArrangedSubview(btn)
            
            
            return stack
        }()
        return signUpText
    }
    
    func getCustomLabel(size: CGFloat, weight: UIFont.Weight = .bold) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: size, weight: weight)
        label.numberOfLines = 0
        return label
    }
    
    func getCustomImageView(target: Any, action: Selector) -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
        
        return imageView
    }
    
    func createTextField(placeholder: String) -> UITextField{
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
            $0.placeholder = placeholder
            $0.layer.cornerRadius = 10
            return $0
        }(UITextField())
    }
    
    func getBtn(title: String) -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = UIColor(hex: "#C2182E")
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        return btn
    }
    
    
}
