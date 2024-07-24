//
//  ViewController.swift
//  HomeTask1UIKitP8Part2
//
//  Created by Baha Sadyr on 7/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    //var build = ViewBuilder.shared
    
    var stackView: UIStackView = UIStackView()
    lazy var btn = UIButton()
    var aboutLabel = UILabel()
    var loremLabel = UILabel()
    var signOutBtn = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubscrPosts()
        setAddPostBtn()
        setAboutLabel()
        setLoremLabel()
        setSignOutBtn()
    
        
    }
    
    func setupSubscrPosts() {
            let subscriptionLabel = createLabel(text: "Подписок\n99")
            let subscribersLabel = createLabel(text: "Подписчиков\n120")
            let postsLabel = createLabel(text: "Постов\n300")
            
            stackView = UIStackView(arrangedSubviews: [subscriptionLabel, subscribersLabel, postsLabel])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ])
    }
    
    func setAddPostBtn() {
        btn.setTitle("Добавить пост", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btn)
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func setAboutLabel() {
        aboutLabel.text = "О себе"
        aboutLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        aboutLabel.textColor = .black
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aboutLabel)
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: btn.bottomAnchor, constant: 30),
            aboutLabel.leadingAnchor.constraint(equalTo: btn.leadingAnchor),
            aboutLabel.trailingAnchor.constraint(equalTo: btn.trailingAnchor),
        ])
    }
    
    func createLabel(text: String) -> UILabel {
            let label = UILabel()
            label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            label.textAlignment = .center
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }
    
    func setLoremLabel() {
        loremLabel.text = "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod tempor incididunt\n ut labore et dolore magna aliqua. Ut enim ad minim\n veniam, quis nostrud exercitation ullamco "
        loremLabel.numberOfLines = 0
        loremLabel.font = UIFont.systemFont(ofSize: 14)
        loremLabel.textColor = .black
        loremLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loremLabel)
        NSLayoutConstraint.activate([
            loremLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 2),
            loremLabel.leadingAnchor.constraint(equalTo: aboutLabel.leadingAnchor),
            loremLabel.trailingAnchor.constraint(equalTo: btn.trailingAnchor),
        ])
    }
    
    func setSignOutBtn() {
        signOutBtn.setTitle("Выйти", for: .normal)
        signOutBtn.setTitleColor(.blue, for: .normal)
        signOutBtn.titleLabel?.font = .systemFont(ofSize: 16)
        signOutBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(signOutBtn)
        NSLayoutConstraint.activate([
            signOutBtn.topAnchor.constraint(equalTo: loremLabel.bottomAnchor, constant: 380),
            signOutBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    
    
    
    


}

