//
//  ViewController.swift
//  HW5M3P8_Persistent
//
//  Created by Baha Sadyr on 10/1/24.
//

import UIKit

class ViewController: UIViewController {

    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        service.createUser(for: UserData(email: "baha12@gmail.com", password: "123456"))
    }


}

