//
//  RegistrationVC.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/5/24.
//

import UIKit

class RegistrationVC: UIViewController {
    
    private var build = ViewBuilder()
    private var fbManager = FBManager()
    
    lazy var contentView = build.contentView
    lazy var regTitleLabel = build.getMainCustomLabel(text: "Регистрация")
    lazy var nameTextField = UITextField()
    lazy var nameStack = build.getTextView(textField: nameTextField, placeholder: "ИMЯ", placeholderForTextField: "Александр")
    lazy var emailTextField = UITextField()
    lazy var emailStack = build.getTextView(textField: emailTextField, placeholder: "ПОЧТА", placeholderForTextField: "example@gmail.com")
    lazy var passTextField = UITextField()
    lazy var passStack = build.getTextView(textField: passTextField, placeholder: "ПАРОЛЬ", placeholderForTextField: "* * * * * * * * * *", isPassword: true)
    lazy var termsStack = build.getTermsStack()
    lazy var enterBtn = build.enterBtn
    lazy var signUpTextStack = build.getSignUpTextStack(labelText: "Уже есть аккаунт?", btnText: "ВОЙТИ", uiAction: loginAction)
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(regTitleLabel)
        view.addSubview( contentView)
        [nameStack, emailStack, passStack, termsStack, enterBtn, signUpTextStack].forEach {
            contentView.addSubview($0)
        }
        
        setConstraints()
        addActionToBtn()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            regTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            regTitleLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -28),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            nameStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            nameStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            nameStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            emailStack.topAnchor.constraint(equalTo: nameStack.bottomAnchor, constant: 28),
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            passStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 28),
            passStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            passStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            termsStack.topAnchor.constraint(equalTo: passStack.bottomAnchor, constant: 28),
            termsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            termsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            enterBtn.topAnchor.constraint(equalTo: termsStack.bottomAnchor, constant: 22),
            enterBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            enterBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),
            enterBtn.heightAnchor.constraint(equalToConstant: 71),
            signUpTextStack.topAnchor.constraint(equalTo: enterBtn.bottomAnchor, constant: 28),
            signUpTextStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -51),
            signUpTextStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
            
        ])
        
    }
    
    private func addActionToBtn() {
        enterBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        
    }
    
    @objc func btnAction() {
        let email = emailTextField.text
        let password = passTextField.text
        let name = nameTextField.text
        
        let user = UserData(email: email ?? "", password: password ?? "", name: name)
        
        fbManager.regUser(user: user) { isLogin in
            if isLogin {
                NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.home])
            } else {
                print("error")
            }
            
        }
        
    }
    
    lazy var loginAction: UIAction = UIAction { _ in
        NotificationCenter.default.post(name: Notification.Name(rawValue: "routeVC"), object: nil, userInfo: ["vc": WindowCase.login])
    }
    
    
    
}
