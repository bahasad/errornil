//
//  MainViewController.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var avatarUIImageView = AvatarUIView(frame: CGRect(x: 30, y: 127, width: view.bounds.size.width - 60, height: 370))

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details Page"
        view.backgroundColor = .red
        view.addSubview(avatarUIImageView)
    }


}

