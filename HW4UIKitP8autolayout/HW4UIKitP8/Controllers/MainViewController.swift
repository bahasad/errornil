//
//  MainViewController.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerDelegate {
    
    lazy var avatarUIImageView = AvatarUIView()
    
    lazy var roundCancelBtn = RoundBtn( radius: 32, image: UIImage(named: "cancelBtn"), backgroundColor: UIColor(hex: "#F4F4F4"))
    lazy var roundHeartBtn = RoundBtn( radius: 32, image: UIImage(named: "heartBtn"),backgroundColor: UIColor(hex: "#F4F4F4"))
    
    lazy var msgUIView: UIView = {
        $0.backgroundColor = UIColor(hex: "#F0F0F0")
        $0.layer.cornerRadius = 30
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    lazy var msgLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    lazy var instaBtn = RoundBtn(radius: 30, image: .insta, backgroundColor: .clear)
    lazy var tikBtn = RoundBtn(radius: 30, image: .tik, backgroundColor: .clear)
    lazy var vkBtn = RoundBtn(radius: 30, image: .vk, backgroundColor: .clear)
    
    lazy var ageLabel =  SharedLabel(size: 16, weight: .light, text: "25 лет", textColor: .white)
    lazy var nameLabel = SharedLabel(size: 20, weight: .bold, text: "Имя Фамилия", textColor: .white)
    lazy var starImageView: UIImageView = {
        $0.image = .star
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var threeDotsBtn = RoundBtn(radius: 0, image: UIImage(named: "threedots"), backgroundColor: .clear)
        
    lazy var writeBtn = WriteBtn( radius: 20)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "AppName"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        avatarUIImageView.addSubviews(view: instaBtn, tikBtn, vkBtn, ageLabel, nameLabel, starImageView, threeDotsBtn)
        view.addSubviews(view: avatarUIImageView, roundCancelBtn, roundHeartBtn, writeBtn, msgUIView)
        msgUIView.addSubview(msgLabel)
        setLayout()
        
        configureWriteBtn()
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            avatarUIImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            avatarUIImageView.heightAnchor.constraint(equalToConstant: 370),
            avatarUIImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            avatarUIImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            writeBtn.topAnchor.constraint(equalTo: avatarUIImageView.bottomAnchor, constant: 36),
            writeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 111),
            writeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -111),
            writeBtn.heightAnchor.constraint(equalToConstant: 50),
            roundCancelBtn.trailingAnchor.constraint(equalTo: writeBtn.leadingAnchor, constant: -16),
            roundCancelBtn.topAnchor.constraint(equalTo: avatarUIImageView.bottomAnchor, constant: 28),
            roundCancelBtn.heightAnchor.constraint(equalToConstant: 65),
            roundCancelBtn.widthAnchor.constraint(equalToConstant: 65),
            roundHeartBtn.leadingAnchor.constraint(equalTo: writeBtn.trailingAnchor, constant: 16),
            roundHeartBtn.topAnchor.constraint(equalTo: avatarUIImageView.bottomAnchor, constant: 28),
            roundHeartBtn.heightAnchor.constraint(equalToConstant: 65),
            roundHeartBtn.widthAnchor.constraint(equalToConstant: 65),
            
            msgUIView.topAnchor.constraint(equalTo: writeBtn.bottomAnchor, constant: 43),
            msgUIView.heightAnchor.constraint(equalToConstant: 84),
            msgUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            msgUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            msgLabel.topAnchor.constraint(equalTo: msgUIView.topAnchor),
            msgLabel.leadingAnchor.constraint(equalTo: msgUIView.leadingAnchor),
            msgLabel.trailingAnchor.constraint(equalTo: msgUIView.trailingAnchor),
            msgLabel.bottomAnchor.constraint(equalTo: msgUIView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            instaBtn.topAnchor.constraint(equalTo: avatarUIImageView.topAnchor, constant: 28),
            instaBtn.leadingAnchor.constraint(equalTo: avatarUIImageView.leadingAnchor, constant: 28),
            instaBtn.heightAnchor.constraint(equalToConstant: 34),
            instaBtn.widthAnchor.constraint(equalToConstant: 34),
            tikBtn.topAnchor.constraint(equalTo: avatarUIImageView.topAnchor, constant: 28),
            tikBtn.leadingAnchor.constraint(equalTo: instaBtn.trailingAnchor, constant: 12),
            tikBtn.heightAnchor.constraint(equalToConstant: 34),
            tikBtn.widthAnchor.constraint(equalToConstant: 34),
            vkBtn.topAnchor.constraint(equalTo: avatarUIImageView.topAnchor, constant: 28),
            vkBtn.leadingAnchor.constraint(equalTo: tikBtn.trailingAnchor, constant: 12),
            vkBtn.heightAnchor.constraint(equalToConstant: 34),
            vkBtn.widthAnchor.constraint(equalToConstant: 34),
            threeDotsBtn.topAnchor.constraint(equalTo: avatarUIImageView.topAnchor, constant: 21),
            threeDotsBtn.trailingAnchor.constraint(equalTo: avatarUIImageView.trailingAnchor, constant: -29),
            threeDotsBtn.heightAnchor.constraint(equalToConstant: 49),
            threeDotsBtn.widthAnchor.constraint(equalToConstant: 49),
            nameLabel.leadingAnchor.constraint(equalTo: instaBtn.leadingAnchor),
            //nameLabel.bottomAnchor.constraint(equalTo: avatarUIImageView.bottomAnchor, constant: 70),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            nameLabel.widthAnchor.constraint(equalToConstant: 149),
            nameLabel.topAnchor.constraint(equalTo: instaBtn.bottomAnchor, constant: 236),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageLabel.heightAnchor.constraint(equalToConstant: 20),
            ageLabel.widthAnchor.constraint(equalToConstant: 53),
            starImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            starImageView.topAnchor.constraint(equalTo: instaBtn.bottomAnchor, constant: 236),
            starImageView.heightAnchor.constraint(equalToConstant: 29),
            starImageView.widthAnchor.constraint(equalToConstant: 29),
            
        ])
        
    }
    
    private func configureWriteBtn() {
        writeBtn.addAction( writeBtnAction, for: .touchUpInside)
    }
    lazy var writeBtnAction: UIAction = UIAction { _ in
        let messageViewController = MessageViewController()
        messageViewController.delegate = self
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    func setMessage(message: String){
        self.msgLabel.text = message
    }


}

protocol MainViewControllerDelegate {
    func setMessage(message: String)
}


