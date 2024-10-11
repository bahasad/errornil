//
//  LoginVC.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/5/24.
//

import UIKit

class LoginVC  : UIViewController{
    
    private var build = ViewBuilder()
    private var fbManager = FBManager()
    
    lazy var contentView = build.contentView
    lazy var enterTitleLabel = build.getMainCustomLabel(text: "Войти")
    lazy var emailTextField = UITextField()
    lazy var emailStack = build.getTextView(textField: emailTextField, placeholder: "ПОЧТА", placeholderForTextField: "example@gmail.com")
    lazy var passTextField = UITextField()
    lazy var passStack = build.getTextView(textField: passTextField, placeholder: "ПАРОЛЬ", placeholderForTextField: "* * * * * * * * * *", isPassword: true)
    lazy var enterBtn = build.enterBtn
    lazy var signUpTextStack = build.getSignUpTextStack(labelText: "У вас нет аккаунта?", btnText: "РЕГИСТРАЦИЯ", uiAction: regAction)
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(enterTitleLabel)
        view.addSubview( contentView)
        [emailStack, passStack, enterBtn, signUpTextStack].forEach {
            contentView.addSubview($0)
        }
        
        setConstraints()
        addActionToBtn()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            enterTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterTitleLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -28),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 663),
            emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            passStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 28),
            passStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            passStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            enterBtn.topAnchor.constraint(equalTo: passStack.bottomAnchor, constant: 83),
            enterBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            enterBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            enterBtn.heightAnchor.constraint(equalToConstant: 71),
            signUpTextStack.topAnchor.constraint(equalTo: enterBtn.bottomAnchor, constant: 28),
            signUpTextStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -128),
            signUpTextStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor) 
        ])
        
    }
    
    private func addActionToBtn() {
        enterBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        
    }
    
    @objc func btnAction() {
        let email = emailTextField.text
        let password = passTextField.text
        
        
        let user = UserData(email: email ?? "", password: password ?? "", name: nil)
        
        fbManager.authUser(user: user) { isLogin in
            if isLogin {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.home])
            } else {
                print("error")
            }
        }
        
    }
    
    lazy var regAction: UIAction = UIAction { _ in
        NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.reg])
    }
    
}
