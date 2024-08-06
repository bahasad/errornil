//
//  DetailCell.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 8/5/24.
//

import UIKit

final class DetailCell: UITableViewCell {
    
    static var reuseId = "CellID"
    
    lazy var mainView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return $0
    }(UIView())
    
    lazy var headerImageView: UIView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainView)
        backgroundColor = .clear
        setConstraints()
    }
    
   
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
