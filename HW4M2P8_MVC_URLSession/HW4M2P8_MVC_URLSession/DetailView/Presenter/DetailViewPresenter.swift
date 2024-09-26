//
//  DetailViewPresenter.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/22/24.
//

import UIKit

protocol DetailViewPresenterProtocol: AnyObject {
    var item: Items { get set }
}

class DetailViewPresenter: DetailViewPresenterProtocol {
    var item: Items
    
    
    weak var view: DetailVCProtocol?
    
   
    
    init(view: DetailVCProtocol?, item: Items) {
        self.view = view
        self.item = item
        
        view?.item = item
    }
    
   
    
    
}
