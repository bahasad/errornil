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
    
    
    lazy var imageViewHeader: UIImageView = {
        $0.frame = CGRect(x: 0, y: 0, width: 430, height: 156)
        $0.image = UIImage(named: "myImage")
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())
    
    lazy var familyImage: UIImageView = {
        let size = CGSize(width: 100, height: 100)
        let origin = CGPoint(x: 30.0, y: imageViewHeader.frame.height + 33.0)
        $0.frame = CGRect(origin: origin, size: size)
        $0.image = UIImage(named: "forFamily")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 50
        $0.layer.masksToBounds = true
        return $0
    }(UIImageView())
    
    lazy var nameLabel = UILabel()
    lazy var editBtn = UIButton()
    lazy var addDescLabel = UILabel()
    lazy var descTextView = UITextView()
    lazy var changePassLabel = UILabel()
    lazy var oldPassTextField = UITextField()
    lazy var newPassTextField = UITextField()
    lazy var saveBtn = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewHeader)
        view.addSubview(familyImage)
        setNameLabel()
        setEditBtn()
        setAddDescLabel()
        setDescTextView()
        setChangePassLabel()
        setOldPassTextField()
        setNewPassTextField()
        setSaveBtn()
        

        
        
    }
    
    func setNameLabel() {
        nameLabel = setSharedLabel(text: "Имя Фамилия",  weightValue: .bold, fontSize: 16)
        view.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: familyImage.frame.maxX + 16.0, y: imageViewHeader.frame.height + 52.0, width: 115, height: 19)
    }
    
    func setEditBtn() {
        editBtn = setSharedBtn(title: "редактировать", cornerRadius: 5)
        view.addSubview(editBtn)
        editBtn.frame = CGRect(x: familyImage.frame.maxX + 16.0, y: nameLabel.frame.maxY + 9.0, width: 147, height: 34)
        
    }
    
    func setAddDescLabel() {
        addDescLabel = setSharedLabel(text: "Добавить описание", weight: false, weightValue: nil, fontSize: 16)
        view.addSubview(addDescLabel)
        addDescLabel.frame = CGRect(x: familyImage.frame.minX, y: familyImage.frame.maxY + 52, width: 156, height: 19)
    }
    
    func setDescTextView() {
        descTextView.layer.cornerRadius = 15
        descTextView.backgroundColor = UIColor(hex: "#F0F0F0")
        view.addSubview(descTextView)
        descTextView.frame = CGRect(x: addDescLabel.frame.minX, y: addDescLabel.frame.maxY  + 9.0, width: 370, height: 150)
    }
    
    func setChangePassLabel() {
        changePassLabel = setSharedLabel(text: "Изменить пароль", weight: false, weightValue: nil, fontSize: 16)
        view.addSubview(changePassLabel)
        changePassLabel.frame = CGRect(x: descTextView.frame.minX, y: descTextView.frame.maxY + 33.0, width: 139, height: 19)
    }
    
    func setOldPassTextField() {
        oldPassTextField = setSharedTextField(placeholder: "Старый пароль", cornerRadiusValue: 10, size: 16)
        view.addSubview(oldPassTextField)
        oldPassTextField.frame = CGRect(x: changePassLabel.frame.minX, y: changePassLabel.frame.maxY + 9.0, width: 370, height: 52)
    }
    
    func setNewPassTextField() {
        newPassTextField = setSharedTextField(placeholder: "Новый пароль", cornerRadiusValue: 10, size: 16)
        view.addSubview(newPassTextField)
        newPassTextField.frame = CGRect(x: oldPassTextField.frame.minX, y: oldPassTextField.frame.maxY + 14.0, width: 370, height: 52)
    }
    
    func setSaveBtn() {
        saveBtn = setSharedBtn(title: "Сохранить", cornerRadius: 10)
        view.addSubview(saveBtn)
        saveBtn.frame = CGRect(x: newPassTextField.frame.minX, y: newPassTextField.frame.maxY + 127.0, width: 370, height: 55)
    }
    
    
    
    
    
    //MARK: setSharedLabel
    func setSharedLabel(text: String, weight: Bool = true, weightValue: UIFont.Weight?, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
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
    func setSharedBtn(title: String, cornerRadius: CGFloat) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = cornerRadius
        return btn
    }
    //MARK: setSharedTextField
    func setSharedTextField(placeholder: String, cornerRadiusValue: CGFloat, size: CGFloat) -> UITextField {
        let tf = UITextField()
        tf.backgroundColor = UIColor(hex: "#F0F0F0")
        tf.placeholder = placeholder
        tf.font = UIFont.systemFont(ofSize: size)
        tf.layer.cornerRadius = cornerRadiusValue
        tf.isSecureTextEntry = true
        return tf
    }
}

//MARK: Extension for UICOlor HEX to RGB convert
extension UIColor {
    convenience init?(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") { // Remove the '#' prefix if added.
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            hexString = String(hexString[start...])
        }
        if hexString.lowercased().hasPrefix("0x") { // Remove the '0x' prefix if added.
            let start = hexString.index(hexString.startIndex, offsetBy: 2)
            hexString = String(hexString[start...])
        }

        let r, g, b, a: CGFloat
        let scanner = Scanner(string: hexString)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else { return nil } // Make sure the string is a hex code.
        switch hexString.count {
        case 3, 4: // Color is in short hex format
            var updatedHexString = ""
            hexString.forEach { updatedHexString.append(String(repeating: String($0), count: 2)) }
            hexString = updatedHexString
            self.init(hex: hexString)

        case 6: // Color is in hex format without alpha.
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
            b = CGFloat(hexNumber & 0x0000FF) / 255.0
            a = 1.0
            self.init(red: r, green: g, blue: b, alpha: a)

        case 8: // Color is in hex format with alpha.
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(hexNumber & 0x000000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: a)

        default: // Invalid format.
            return nil
        }
    }
}




