//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()
    let host = "rickandmortyapi.com"
    let pathParam = "/api/character"
    let query = "page"
    let limit = 19
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print("start")
        networkManager.sndRequest(host: host, path: pathParam, query: "page", limit: limit)
    }


}

