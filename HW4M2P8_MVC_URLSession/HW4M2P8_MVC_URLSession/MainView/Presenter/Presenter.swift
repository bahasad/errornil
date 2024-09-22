//
//  Presenter.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/21/24.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func fetchData()
    func getItemCount() -> Int
    func getItem(at index: Int) -> Items
}


class MainViewPresenter: MainViewPresenterProtocol {
    
    weak var view: ViewControllerProtocol?
    private var items: [Items] = []
    private let networkManager: NetworkManager
    
    init(view: ViewControllerProtocol?, networkManager: NetworkManager = NetworkManager()) {
        self.view = view
        self.networkManager = networkManager
    }
    
    
    func fetchData() {
        networkManager.sendRequest { [weak self] data in
            self?.items = data
            //print(self?.items ?? "")
            self?.view?.reloadData()
        }
    }
    
    func getItemCount() -> Int {
        items.count
    }
    
    func getItem(at index: Int) -> Items {
        items[index]
    }
    
    
}
