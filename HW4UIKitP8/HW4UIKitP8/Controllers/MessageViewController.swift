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
        $0.frame = CGRect(x: 30, y: 201, width: view.frame.size.width - 60, height: 218)
        return $0
    }(UITextView())
    lazy var writeButton = WriteBtn(frame: CGRect(x: 30, y: msgTextView.frame.maxY + 22, width: view.frame.size.width - 60, height: 50), titleStr: "Написать", radius: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Сообщение"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        
        
        
       
        view.addSubviews(view: msgTextView, writeButton)
        setWriteButton()
            
    
        

        
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
