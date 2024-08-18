//
//  GroupCellCollectionViewCell.swift
//  CollectionviewPractice
//
//  Created by Baha Sadyr on 8/18/24.
//

import UIKit


final class GroupCellCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GroupCellCollectionViewCell"
    
    private lazy var imageView = sharedImageView()
    
    private lazy var mainLabel = sharedLabel(size: 11, weight: .light)
    
    private lazy var priceLabel = sharedLabel(size: 11, weight: .bold)
    
    private lazy var locationLabel = sharedLabel(size: 10, weight: .light, color: UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1))
    
    private lazy var likeBtn: UIButton = {
        $0.frame = CGRect(x: contentView.frame.width - 20, y: imageView.bounds.maxY + 8, width: 15, height: 12)
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.tintColor = .black
        return $0
    }(UIButton(primaryAction: btnAction))
    
    lazy var btnAction: UIAction = UIAction { [weak self] _ in
        print("some action")
        guard let self = self else { return }
        likeBtn.isSelected.toggle()
        self.updateIfSelectedLikeBtn()
    }
    private func updateIfSelectedLikeBtn(){
        if likeBtn.isSelected {
            likeBtn.tintColor = .red
        } else {
            likeBtn.tintColor = .black
        }
    }
    
    private lazy var threeDotsBtn: UIButton = {
        $0.frame = CGRect(x: contentView.frame.width - 20, y: likeBtn.frame.maxY + 8, width: 15, height: 15)
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
        return $0
    }(UIButton())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(likeBtn)
        contentView.addSubview(threeDotsBtn)
        mainLabel.frame = CGRect(x: 0, y: imageView.bounds.maxY + 10, width: contentView.frame.width - 15, height: 12)
        priceLabel.frame = CGRect(x: 0, y: mainLabel.frame.maxY + 10, width: contentView.frame.width - 15, height: 12)
        locationLabel.frame = CGRect(x: 0, y: priceLabel.frame.maxY + 10, width: contentView.frame.width - 15, height: 12)
        
        
    }
    
    
    func setCell(item: UserData){
        imageView.image = UIImage(named: item.image)
        mainLabel.text = item.itemName
        priceLabel.text = item.itemPrice
        locationLabel.text = item.itemLocation
    }
    
    private func sharedImageView() -> UIImageView {
        {
            $0.frame.origin = .zero
            $0.frame.size = CGSize(width: contentView.frame.width, height: 134)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            return $0
        }(UIImageView())
    }
    
    private func sharedLabel(size: CGFloat, weight: UIFont.Weight, color: UIColor = .black) -> UILabel {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textColor = color
        
        return label
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
