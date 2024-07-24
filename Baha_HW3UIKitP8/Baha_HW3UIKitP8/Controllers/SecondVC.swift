//
//  SecondVC.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/22/24.
//

import UIKit

class SecondVC: UIViewController {
    
    let safeAreaInsets = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero
    
    
    lazy var nameLabel =  FirstVCUILabel(frame: CGRect(x: 42, y: 97, width: 34, height: 19), text: "Имя", weight: .light)
    lazy var nameTextField = SeconVCTextField(frame: CGRect(x: 30, y: nameLabel.frame.maxY + 5, width: view.frame.size.width - 60, height: 51))
    lazy var surnameLabel =  FirstVCUILabel(frame: CGRect(x: nameTextField.frame.minX, y: nameTextField.frame.maxY + 22, width: 73, height: 19), text: "Фамилия", weight:.light)
    lazy var surnameTextField = SeconVCTextField(frame: CGRect(x: nameTextField.frame.minX, y: surnameLabel.frame.maxY + 5, width: nameTextField.frame.size.width, height: 51))
    lazy var descrLabel =  FirstVCUILabel(frame: CGRect(x: surnameLabel.frame.minX, y: surnameTextField.frame.maxY + 22, width: 80, height: 19), text: "Описание", weight: .light)
    lazy var descrTextView = SeconVCTextView(frame: CGRect(x: surnameTextField.frame.minX, y: descrLabel.frame.maxY + 5, width: surnameTextField.frame.size.width, height: 144))
    lazy var saveBtn = FirstVCUIButton(frame: CGRect(x: descrTextView.frame.minX, y: view.frame.size.height - 73 - safeAreaInsets.bottom - 30, width: descrTextView.frame.size.width, height: 60), title: "Сохранить", radius: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view.backgroundColor = .white
        view.addSubviews(view: nameLabel, nameTextField, surnameLabel, surnameTextField, descrLabel, descrTextView, saveBtn)
                         
                       

       
    }
    



}
