//
//  CarsCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/15/24.
//

import UIKit

final class CarsCell: UICollectionViewCell {
    
    static let reuseID = "CarsCell"
    
    private lazy var imageView: UIImageView = {
        $0.frame.origin = .zero
        $0.frame.size = CGSize(width: contentView.frame.width, height: 121)
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private var stackForPrice = SharedStack(distribution: .equalSpacing)
    
    private let nameLabel = SharedLabel(size: 9, weight: .bold)
    
    private let priceLabel = SharedLabel(size: 9, weight: .bold)
    
    private let footerDateLabel = SharedLabel(size: 6, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
    
    private let footerViewsLabel = SharedLabel(size: 6, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
    
    private let footerAddNumberLabel = SharedLabel(size: 6, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
    
    private var stackForDate = SharedStack(distribution: .fillProportionally, spacing: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    func configure(){
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.addSubview(imageView)
        contentView.addSubview(stackForPrice)
        contentView.addSubview(stackForDate)
        stackForPrice.frame.origin = CGPoint(x: 8, y: imageView.bounds.maxY + 7)
        stackForPrice.frame.size = CGSize(width: contentView.frame.width - 16, height: 12)
        stackForPrice.addArrangedSubview(nameLabel)
        stackForPrice.addArrangedSubview(priceLabel)
        stackForDate.frame.origin = CGPoint(x: 11, y: stackForPrice.frame.maxY + 7)
        stackForDate.frame.size = CGSize(width: contentView.frame.width - 27, height: 7)
        stackForDate.addArrangedSubview(footerDateLabel)
        stackForDate.addArrangedSubview(footerViewsLabel)
        stackForDate.addArrangedSubview(footerAddNumberLabel)
        
//        let userData: [UserData] = UserData.mockData()
//        
//        let count = userData.count
//        
        
//        for _ in 1...count {
//            let label = SharedLabel(size: 12, weight: .bold)
//            stackForPrice.addArrangedSubview(label)
//        }
//        for _ in 1...count {
//            let label = SharedLabel(size: 5, weight: .light)
//            // color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
//            stackForDate.addArrangedSubview(label)
//        }
        
        
    }
    
    
    
    
    
    
    
    func setCell(item: UserData) {
        imageView.image =  UIImage(named: item.image)
        
        //let nameLabel = SharedLabel(size: 5, weight: .light)
        nameLabel.text = item.carName
       // stackForPrice.addArrangedSubview(nameLabel)
        
       // let priceLabel = SharedLabel(size: 12, weight: .bold)
        priceLabel.text = item.carPrice
        //stackForPrice.addArrangedSubview(priceLabel)
        
        footerDateLabel.text = item.addData[0]
        
        footerViewsLabel.text = item.addData[1]
        
        footerAddNumberLabel.text = item.addData[2]
        
        
        
//        private let footerDateLabel = SharedLabel(size: 6, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
//        
//        private let footerViewsLabel = SharedLabel(size: 6, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
//        
//        private let footerAddNumberLabel = SharedLabel(size: 6, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
//        
        
        
//        for i in item.addData {
//            let label = SharedLabel(size: 6, weight: .light)
//            label.text = i
//            stackForDate.addArrangedSubview(label)
//        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
