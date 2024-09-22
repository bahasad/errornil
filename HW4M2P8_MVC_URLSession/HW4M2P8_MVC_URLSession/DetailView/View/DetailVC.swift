//
//  DetailVC.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/22/24.
//

import UIKit
import Kingfisher


protocol DetailVCProtocol: AnyObject {
    
}

class DetailVC: UIViewController, DetailVCProtocol {
    
    var presenter: DetailViewPresenterProtocol!
    var item: Items?
    
    
    private lazy var detailImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var detailDescLabel: UILabel = CustomLabel(size: 16)
    
    private lazy var detailTitleLabel: UILabel = CustomLabel(size: 14, weight: .light, textColor: UIColor(red: 137/255, green: 137/255, blue: 137/255, alpha: 1.0))
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [detailImageView, detailTitleLabel, detailDescLabel].forEach {
            view.addSubview($0)
        }
        setConstraints()
        setDetailVCData()

        
    }
    
    private func setDetailVCData() {
        if let posterUrl = item?.posterUrl, let posterUrl = URL(string: posterUrl) {
            detailImageView.kf.setImage(with: posterUrl, placeholder: UIImage(systemName: "heart"))
        }
        detailTitleLabel.text = item?.nameOriginal
        detailDescLabel.text = item?.nameRu
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: 430),
            detailTitleLabel.topAnchor.constraint(equalTo: detailDescLabel.bottomAnchor, constant: 7),
            detailTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            detailTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            detailDescLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 27),
            detailDescLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            detailDescLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
        
            
        ])
        
    }
    
    

    
}
