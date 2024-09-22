//
//  Builder.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/21/24.
//

import UIKit

class Builder {
    static func createMainView() -> UIViewController {
        let view = ViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
//    static func createDetailView() -> UIViewController {
//        let view = DetailVC()
//        let presenter = DetailViewPresenter(view: view)
//        view.presenter = presenter
//        return view
//    }
}
