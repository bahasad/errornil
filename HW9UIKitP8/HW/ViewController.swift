//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let images: [UIImage] = [.one, .two, .three]
    
    private lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .lightGray
        $0.addSubview(scrollContent)
        return $0
    }(UIScrollView(frame: view.frame))
    
    private lazy var scrollContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .green
        $0.addSubview(text)
        $0.addSubview(image)
        $0.addSubview(vStack)
        return $0
    }(UIView())
    
    private lazy var vStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 15
        $0.distribution = .fillEqually
        $0.axis = .vertical
        return $0
    }(UIStackView())
    
    private lazy var text: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Some Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .winter
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(scrollView)
        fillStack()
        setLayout()
    }
    
    private func fillStack() {
        images.forEach {
            let image = StackImage(image: $0)
            vStack.addArrangedSubview(image)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            text.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 30),
            text.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 30),
            text.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -30),
            vStack.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 30),
            vStack.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 30),
            vStack.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -30),
            vStack.heightAnchor.constraint(equalToConstant: 400),
            image.heightAnchor.constraint(equalToConstant: 150),
            image.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 50),
            image.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            image.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -50),
        ])
        
    }


}

class StackImage: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = 10
       // translatesAutoresizingMaskIntoConstraints = false
        //widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

