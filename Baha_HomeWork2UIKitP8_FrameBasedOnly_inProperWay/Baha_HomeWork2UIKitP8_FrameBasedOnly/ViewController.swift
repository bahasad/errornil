//
//  ViewController.swift
//  Baha_HomeWork2UIKitP8_FrameBasedOnly
//
//  Created by Baha Sadyr on 7/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    //uiimage view 430 x 156
    //add desc label  52 to uiimage
    //Изменить пароль 139X19 -> up 33
    //Старый пароль 370x52 -> up 9 (UITextField)
    //Новый пароль 370x52 -> up 14 (UITextField)
    //Сохранить 370x55 -> up 127 , font size = 14
    
    lazy var viewWidth = view.frame.size.width
    lazy var viewHeight = view.frame.size.height
    lazy var viewCenterX = view.center.x
    
    lazy var imageViewHeader = setSharedImageView(offsetX: 0, offsetY: 0, width: viewWidth, height: 156, contentMode: .scaleToFill, name: "myImage", cornerRadius: 0)
    lazy var familyImage = setSharedImageView(offsetX: 30.0, offsetY: imageViewHeader.frame.height + 33.0, width: 100, height: 100, contentMode: .scaleAspectFill, name: "forFamily", cornerRadius: 50, masksToBounds: true)
    lazy var nameLabel = setSharedLabel(offsetX: familyImage.frame.maxX + 16.0, offsetY: imageViewHeader.frame.height + 52.0, width: (viewWidth - familyImage.frame.maxX - 16.0 - 115.0), height: 19, text: "Имя Фамилия", weightValue: .bold, fontSize: 16)
    lazy var editBtn = setSharedBtn(offsetX: familyImage.frame.maxX + 16.0, offsetY: nameLabel.frame.maxY + 9.0, width: (viewWidth - familyImage.frame.maxX - 16.0 - 147.0), height: 34, title: "редактировать", cornerRadius: 5)
    lazy var addDescLabel = setSharedLabel(offsetX: familyImage.frame.minX, offsetY: familyImage.frame.maxY + 52.0, width: (viewWidth - 30 - 156), height: 19, text: "Добавить описание", weight: false, weightValue: nil, fontSize: 16)
    lazy var descTextView: UITextView = {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(hex: "#F0F0F0")
        $0.frame = CGRect(x: addDescLabel.frame.minX, y: addDescLabel.frame.maxY  + 9.0, width: (viewWidth - 60), height: 150)
        return $0
    }(UITextView())
    lazy var changePassLabel = setSharedLabel(offsetX: 30, offsetY: descTextView.frame.maxY + 9.0, width: (viewWidth - 60), height: 52, text: "Изменить пароль", weight: false, weightValue: nil, fontSize: 16)
    lazy var oldPassTextField = setSharedTextField(offsetX: changePassLabel.frame.minX, offsetY: changePassLabel.frame.maxY + 9.0, width: (viewWidth - 60), height: 52, placeholder: "Старый пароль", cornerRadiusValue: 10, size: 16)
    lazy var newPassTextField = setSharedTextField(offsetX: oldPassTextField.frame.minX, offsetY: oldPassTextField.frame.maxY + 14.0, width: (viewWidth - 60), height: 52, placeholder: "Новый пароль", cornerRadiusValue: 10, size: 16)
    lazy var saveBtn: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewHeader)
        view.addSubview(familyImage)
        view.addSubview(nameLabel)
        view.addSubview(editBtn)
        view.addSubview(addDescLabel)
        view.addSubview(descTextView)
        setupSaveButton()
        view.addSubview(changePassLabel)
        view.addSubview(oldPassTextField)
        view.addSubview(newPassTextField)
   

        
        
    }
    
    private func setupSaveButton() {
        let safeAreaInsets = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .compactMap({$0 as? UIWindowScene})
                    .first?.windows
                    .first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero
        
        saveBtn = setSharedBtn(offsetX: 30, offsetY: viewHeight - 52.0 - safeAreaInsets.bottom - 30.0, width: (viewWidth - 60), height: 55, title: "Сохранить", cornerRadius: 10)
                view.addSubview(saveBtn)
    }

    //MARK: setSharedLabel
    private func setSharedLabel(offsetX: Double, offsetY: Double, width: Double, height: Double, text: String, weight: Bool = true, weightValue: UIFont.Weight?, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: offsetX, y: offsetY, width: width, height: height)
        label.text = text
        label.numberOfLines = 0
        if weight {
            if let weightValue = weightValue {
                label.font = UIFont.systemFont(ofSize: fontSize, weight: weightValue)
            }
        } else {
            label.font = UIFont.systemFont(ofSize: fontSize)
        }
        label.textColor = .black
        return label
    }
    
    //MARK: setSharedBtn
    private func setSharedBtn(offsetX: Double, offsetY: Double, width: Double, height: Double,title: String, cornerRadius: CGFloat) -> UIButton {
        let btn = UIButton()
        btn.frame = CGRect(x: offsetX, y: offsetY, width: width, height: height)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = cornerRadius
        return btn
    }
    
    //MARK: setSharedTextField
    private func setSharedTextField(offsetX: Double, offsetY: Double, width: Double, height: Double, placeholder: String, cornerRadiusValue: CGFloat, size: CGFloat) -> UITextField {
        let tf = UITextField()
        tf.frame = CGRect(x: offsetX, y: offsetY, width: width, height: height)
        tf.backgroundColor = UIColor(hex: "#F0F0F0")
        tf.placeholder = placeholder
        tf.font = UIFont.systemFont(ofSize: size)
        tf.layer.cornerRadius = cornerRadiusValue
        tf.isSecureTextEntry = true
        return tf
    }
    
    //MARK: setSharedImageView
    private func setSharedImageView(offsetX: Double, offsetY: Double, width: Double, height: Double, contentMode: UIView.ContentMode, name: String,cornerRadius: CGFloat,  masksToBounds: Bool = false ) -> UIImageView {
        let iv = UIImageView()
        iv.frame = CGRect(x: offsetX, y: offsetY, width: width, height: height)
        iv.contentMode = contentMode
        iv.image = UIImage(named: name)
        iv.layer.cornerRadius = cornerRadius
        iv.layer.masksToBounds = masksToBounds
        return iv
    }
    
    
    
}

//MARK: Extension for UICOlor HEX to RGB convert
extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            hexString = String(hexString[start...])
        }
        if hexString.lowercased().hasPrefix("0x") {
            let start = hexString.index(hexString.startIndex, offsetBy: 2)
            hexString = String(hexString[start...])
        }

        let r, g, b, a: CGFloat
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else { return nil }
        switch hexString.count {
        case 3, 4:
            var updatedHexString = ""
            hexString.forEach { updatedHexString.append(String(repeating: String($0), count: 2)) }
            hexString = updatedHexString
            self.init(hex: hexString)

        case 6:
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
            b = CGFloat(hexNumber & 0x0000FF) / 255.0
            a = 1.0
            self.init(red: r, green: g, blue: b, alpha: a)

        case 8:
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(hexNumber & 0x000000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: a)

        default:
            return nil
        }
    }
}




