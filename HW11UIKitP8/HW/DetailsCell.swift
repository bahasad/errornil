//
//  DetailsCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/20/24.
//

import UIKit


protocol CellProtocol: AnyObject {
    static var reuseId: String {get}
}



final class DetailsCell: UICollectionViewCell, CellProtocol {
    
    static var reuseId = "DetailsCell"
    
    private lazy var uiView: UIView = {
        $0.backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    private lazy var imgInImg = getuiImageView()
    private lazy var mainImage = getuiImageView()
    private lazy var nameLabel = SharedLabel(size: 20, weight: .bold)
    private lazy var dateLabel =  SharedLabel(size: 14, weight: .light, color: UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0))
    private lazy var mainTitleLabel = SharedLabel(size: 22, weight: .bold)
    private lazy var descLabel = SharedLabel(size: 16, weight: .light)
    lazy var cellWidth: CGFloat = UIScreen.main.bounds.width
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        [ mainImage, dateLabel, imgInImg, nameLabel, mainTitleLabel, descLabel ].forEach {
            contentView.addSubview($0)
        }
      contentView.backgroundColor =  UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0)
    }
    
    private func setConstraints() {
        
        let hAnchor = mainImage.heightAnchor.constraint(equalTo: mainImage.widthAnchor, multiplier: mainImage.image?.getRatio() ?? 1)
        hAnchor.priority = .defaultHigh
        NSLayoutConstraint.activate([

            imgInImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imgInImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imgInImg.heightAnchor.constraint(equalToConstant: 44),
            imgInImg.widthAnchor.constraint(equalToConstant: 44),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: imgInImg.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            mainImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainImage.widthAnchor.constraint(equalToConstant: cellWidth - 100),
            hAnchor,
            
            dateLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 9),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
          
            mainTitleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            mainTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 10),
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            
            
            
            
        ])
    }
    
    private func getuiImageView() -> UIImageView {
        {
            $0.contentMode = .scaleToFill
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UIImageView())
    }
    
    
    
    
    
    func setData(item: UserData) {
        self.mainTitleLabel.text = item.mainTitleLabel
        self.imgInImg.image =  UIImage(named: item.imgInImg)
        self.mainImage.image =  UIImage(named: item.mainImage)
        self.nameLabel.text = item.nameLabel
        self.dateLabel.text = item.dateLabel
        self.mainTitleLabel.text = item.mainTitleLabel
        self.descLabel.text = item.descLabel
        
        setConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIImage {
    func getRatio() -> CGFloat? {
        return self.size.height / self.size.width
    }
}
