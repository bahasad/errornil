//
//  DetailCell.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 8/5/24.
//

import UIKit

final class DetailCell: UICollectionViewCell {
    
    
    static var reuseId = "CellID"
    
    private lazy var mainView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(hex: "#D9D9D9")
        $0.layer.cornerRadius = 30
        return $0
    }(UIView())
    
    private lazy var headerImageView: UIImageView = {
        $0.layer.cornerRadius = 30
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var imgInMainImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 31.5
        return $0
    }(UIImageView())
    
    private lazy var nameLabel: UILabel = {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var headerLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var texttLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var btn: UIButton = {
        $0.backgroundColor = UIColor(hex: "#25A952")
        $0.setTitle("next", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainView)
        mainView.addSubviews(view: headerImageView, headerLabel, texttLabel, btn, imgInMainImage, nameLabel)
        backgroundColor = .clear
    }

    
    func setupData(item: UserData) {
        headerImageView.image = UIImage(named: item.mainImage)
        imgInMainImage.image = UIImage(named: item.imgInImage)
        nameLabel.text = item.name
        headerLabel.text = item.header
        texttLabel.text = item.texttLabel
        
        
        
        setConstraints()
    }
    
   
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            headerImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            headerImageView.heightAnchor.constraint(equalToConstant: 239),
            headerImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            headerImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            imgInMainImage.heightAnchor.constraint(equalToConstant: 63),
            imgInMainImage.widthAnchor.constraint(equalToConstant: 63),
            imgInMainImage.topAnchor.constraint(equalTo: headerImageView.topAnchor, constant: 20),
            imgInMainImage.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -40),
            nameLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: -20),
            headerLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 21),
            headerLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 21),
            headerLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -21),
            texttLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            texttLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            texttLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 20),
            btn.topAnchor.constraint(equalTo: texttLabel.bottomAnchor, constant: 26),
            btn.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            btn.heightAnchor.constraint(equalToConstant: 50),
            mainView.bottomAnchor.constraint(equalTo: btn.bottomAnchor, constant: 40)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
