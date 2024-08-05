//
//  DetailsVC.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 8/1/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    var userData: UserData?
    var imageData: UIImage?
    

    private lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 69
        $0.clipsToBounds = true
        //$0.backgroundColor = .red
        return $0
    }(UIImageView())
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = UIColor(hex: "#000000")
        return $0
    }(UILabel())
    
    private lazy var textView: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 30
        return $0
    }(UITextView())
    
    private lazy var btn: UIButton = {
        //$0.setBackgroundImage(.black, for: .normal)
        $0.backgroundColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Написать", for: .normal)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton())


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F1F1F1")
        view.addSubviews(view: imageView, label, textView, btn)
        setLayout()
        setDataFromTable()
        
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 136),
            imageView.widthAnchor.constraint(equalToConstant: 136),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 114),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 147),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -147),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 27),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 43),
            textView.heightAnchor.constraint(equalToConstant: 187),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -37),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            btn.heightAnchor.constraint(equalToConstant: 65),
            
            
        ])
        
    }
    
    private func setDataFromTable() {
        if let userData = userData {
            imageView.image = userData.image
            label.text = userData.name
            
        }
    }
    

    

}
