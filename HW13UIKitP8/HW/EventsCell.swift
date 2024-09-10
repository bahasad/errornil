//
//  EventsCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/27/24.
//

import UIKit

class EventsCell: UICollectionViewCell {
    
    static let reuseId = "EventsCell"
    
    private lazy var imageMain = CustomImage()
    
    private lazy var labelText = CustomLabel(size: 12, weight: .light)
    
    private lazy var btn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
        [imageMain, labelText, btn].forEach {
            contentView.addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageMain.widthAnchor.constraint(equalToConstant: 25),
            imageMain.heightAnchor.constraint(equalToConstant: 25),
            imageMain.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            labelText.leadingAnchor.constraint(equalTo: imageMain.trailingAnchor, constant: 10),
            labelText.centerYAnchor.constraint(equalTo: centerYAnchor),
            btn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            btn.topAnchor.constraint(equalTo:  imageMain.topAnchor)
        ])
    }
    
    
    
    func setCellData(item: CollectionItems) {
        imageMain.image  = UIImage(named: item.image)
        labelText.text = item.text
        btn.setImage(UIImage(named: "blackArrowBtn"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
