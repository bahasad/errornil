//
//  MessageViewController.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class MessageViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    lazy var msgTextView: UITextView = {
        $0.backgroundColor = UIColor(hex: "#F0F0F0")
        $0.layer.cornerRadius = 15
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextView())
    lazy var writeButton = WriteBtn( titleStr: "Написать", radius: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Сообщение"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        view.addSubviews(view: msgTextView, writeButton)
        setLayout()
        setWriteButton()
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            msgTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 39),
            msgTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            msgTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            msgTextView.heightAnchor.constraint(equalToConstant: 218),
            writeButton.heightAnchor.constraint(equalToConstant: 50),
            writeButton.topAnchor.constraint(equalTo: msgTextView.bottomAnchor, constant: 22),
            writeButton.leadingAnchor.constraint(equalTo: msgTextView.leadingAnchor),
            writeButton.trailingAnchor.constraint(equalTo: msgTextView.trailingAnchor)
            
            
        ])
    }
    func setWriteButton() {
        writeButton.addAction(actionOnWriteButton, for: .touchUpInside)
    }
    
    lazy var actionOnWriteButton: UIAction = UIAction { [weak self] _ in
        guard let self = self else {return}
        self.delegate?.setMessage(message: self.msgTextView.text ?? "")
        self.navigationController?.popViewController(animated: true)
        
    }
    

  

}
