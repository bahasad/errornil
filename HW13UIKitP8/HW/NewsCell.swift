//
//  NewsCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/26/24.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    static var reuseId = "NewsCell"
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        return $0
    }(UIImageView())
    
    private lazy var headerTitle = CustomLabel(size: 20, weight: .bold, color: .white)
    
    private lazy var date = CustomLabel(size: 12, weight: .light, color: UIColor(red: 195/255.0, green: 195/255.0, blue: 195/255.0, alpha: 1.0))
    
    private lazy var descText = CustomLabel(size: 14, weight: .light, color: UIColor(red: 195/255.0, green: 195/255.0, blue: 195/255.0, alpha: 1.0))
    
    private lazy var btn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Читать", for: .normal)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [imageView, headerTitle, date, descText, btn].forEach {
            contentView.addSubview($0)
        }
        
        
        clipsToBounds = true
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            date.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: 2),
            date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            date.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            descText.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 9),
            descText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            descText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            btn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
            btn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
        ])
    }
    
    
    
    func setupCellData(item: CollectionItems) {
        imageView.image = UIImage(named: item.image)
        headerTitle.text = item.headerText
        if let date = item.data {
            let formatDate = formatDate( date)
            self.date.text = formatDate
        }
        descText.text = item.text
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        //dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
