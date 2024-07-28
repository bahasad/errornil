//
//  MainViewController.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerDelegate {
    
    lazy var avatarUIImageView = AvatarUIView(frame: CGRect(x: 30, y: self.view.safeAreaInsets.top +  157, width: view.bounds.size.width - 60, height: 370))
    
    lazy var roundCancelBtn = RoundBtn(frame: CGRect(x: 30, y: avatarUIImageView.frame.maxY + 28, width: 65, height: 65), radius: 32, image: UIImage(named: "cancelBtn"), backgroundColor: UIColor(hex: "#F4F4F4"))
    lazy var roundHeartBtn = RoundBtn(frame: CGRect(x: writeBtn.frame.maxX + 17, y:  avatarUIImageView.frame.maxY + 28, width: 65, height: 65), radius: 32, image: UIImage(named: "heartBtn"),backgroundColor: UIColor(hex: "#F4F4F4"))
    
    lazy var msgUIView: UIView = {
        $0.backgroundColor = UIColor(hex: "#F0F0F0")
        $0.layer.cornerRadius = 30
        $0.frame = CGRect(x: 30, y: writeBtn.frame.maxY + 43, width: view.bounds.size.width - 60, height: 84)
        return $0
    }(UIView())
    
    lazy var msgLabel: UILabel = {
        $0.frame.size = msgUIView.frame.size
        return $0
    }(UILabel())
    
    lazy var instaBtn = RoundBtn(frame: CGRect(x: 31, y: 28, width: 34, height: 34), radius: 30, image: .insta, backgroundColor: .clear)
    lazy var tikBtn = RoundBtn(frame: CGRect(x: instaBtn.frame.maxX + 12, y: 28, width: 34, height: 34), radius: 30, image: .tik, backgroundColor: .clear)
    lazy var vkBtn = RoundBtn(frame: CGRect(x: tikBtn.frame.maxX + 12, y: 28, width: 34, height: 34), radius: 30, image: .vk, backgroundColor: .clear)
    
    lazy var ageLabel =  SharedLabel(frame: CGRect(x: 31, y: avatarUIImageView.frame.size.height - 51, width: 52, height: 19), size: 16, weight: .light, text: "25 лет", textColor: .white)
    lazy var nameLabel = SharedLabel(frame: CGRect(x: 31, y: ageLabel.frame.minY - 22, width: 140, height: 24), size: 20, weight: .bold, text: "Имя Фамилия", textColor: .white)
    lazy var starImageView: UIImageView = {
        $0.image = .star
        $0.frame = CGRect(x: nameLabel.frame.maxX, y: ageLabel.frame.minY - 22, width: 29, height: 29)
        return $0
    }(UIImageView())
    lazy var threeDotsBtn = RoundBtn(frame: CGRect(x: avatarUIImageView.frame.size.width - 78, y: 21, width: 49, height: 49), radius: 0, image: UIImage(named: "threedots"), backgroundColor: .clear)
        
    lazy var writeBtn = WriteBtn(frame: CGRect(x: 111, y: avatarUIImageView.frame.maxY + 36, width: view.bounds.size.width - 222, height: 50), radius: 20)
    
    
//    lazy var writeBtn: UIButton = {
//        $0.frame = CGRect(x: 111, y: avatarUIImageView.frame.maxY + 36, width: view.bounds.size.width - 222, height: 50)
//        $0.setTitle("Написать", for: .normal)
//        $0.layer.cornerRadius = 20
//        $0.titleLabel?.font = .systemFont(ofSize: 16)
//        $0.setTitleColor(.white, for: .normal)
//        $0.backgroundColor = UIColor(hex: "#25A952")
//        return $0
//    }(UIButton(primaryAction: writeBtnAction))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "AppName"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        
        msgUIView.addSubview(msgLabel)
        avatarUIImageView.addSubviews(view: instaBtn, tikBtn, vkBtn, ageLabel, nameLabel, starImageView, threeDotsBtn)
        view.addSubviews(view: avatarUIImageView, roundCancelBtn, roundHeartBtn, msgUIView, writeBtn)
        
        configureWriteBtn()
        
        
        
     
        
    }
    
    private func configureWriteBtn() {
        writeBtn.addAction( writeBtnAction, for: .touchUpInside)
    }
    lazy var writeBtnAction: UIAction = UIAction { _ in
        let messageViewController = MessageViewController()
        messageViewController.completion = {
            self.msgLabel.text = $0
            
        }
        self.navigationController?.pushViewController(messageViewController, animated: true)
    }
    
    func setMessage(message: String){
        self.msgLabel.text = message
    }


}

protocol MainViewControllerDelegate {
    func setMessage(message: String)
}


