//
//  DetailViewPresenter.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/22/24.
//

import UIKit

protocol DetailViewPresenterProtocol: AnyObject {
    
}

class DetailViewPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailVCProtocol?
    
   
    
    init(view: DetailVCProtocol?) {
        self.view = view
    }
    
   
    
    
}
