//
//  ViewController.swift
//  Practice07182024
//
//  Created by Baha Sadyr on 7/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewWidth = view.frame.size.width
    lazy var viewHeight = view.frame.size.height
    lazy var centerX = view.center.x
    
    
    lazy var circle: UIView = {
        $0.layer.cornerRadius = 50
        $0.frame = CGRect(x: 10, y: 60, width: viewWidth - 46, height: 150)
        $0.backgroundColor = .brown
        $0.center.x = centerX
        //$0.frame.origin.x = 200
        return $0
    }(UIView())
    
    lazy var myLabel: UILabel = {
        $0.text = "Press me"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.frame.size = CGSize(width: 70, height: 20)
        $0.center.x = self.view.center.x
        $0.center.y = self.view.center.y
        $0.textAlignment = .center
        $0.backgroundColor = .gray
        return $0
    }(UILabel())
    
    lazy var btn: UIButton = {
        $0.setTitle("Press", for: .normal)
        $0.backgroundColor = .red
        $0.setTitleColor(.white, for: .normal)
        $0.frame = CGRect(x: 23, y: view.frame.size.height - 100, width: view.frame.size.width - 46, height: 50)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton( primaryAction: btnAction))
    
    lazy var imageView: UIImageView = {
        $0.image = .shushi
        $0.frame.size = CGSize(width: 100, height: 100)
        $0.contentMode = .scaleAspectFill
        $0.frame = CGRect(x: view.frame.origin.x, y: view.frame.size.height - 200, width: view.frame.size.width - 46, height: 100)
        $0.backgroundColor = .red
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    
    lazy var textField: UITextField = {
        $0.placeholder = "Enter your name"
        $0.backgroundColor = .lightGray
        $0.frame.origin = CGPoint(x: 50, y: 20)
        return $0
    }(UITextField())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(circle)
        view.addSubview(btn)
        print(viewWidth)
        print(viewHeight)
        print(centerX)
        setTextField()
        view.addSubview(myLabel)
        view.addSubview(imageView)
    }
    func setTextField() {
        circle.addSubview(textField)
        textField.frame.size = CGSize(width: circle.frame.size.width - 39, height: 50)
        textField.isSecureTextEntry = false
    }
    lazy var btnAction: UIAction = UIAction { _ in
        self.myLabel.text = "Blablabla"
    }
    
    


}

