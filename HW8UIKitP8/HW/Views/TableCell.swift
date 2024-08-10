//
//  TableCell.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

final class TableCell: UITableViewCell {

    static let reuseId = "TableCell"

    private lazy var mainView: UIView = {
        $0.layer.cornerRadius = 30
        $0.backgroundColor = UIColor(hex: "#F4F4F4")
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UIView())
    
    private var headerImageView = ImageView(cornerRadius: 33)
    
    private var footerNameLabel = SharedLabel(size: 20)
    
    private var footerDescLabel = SharedLabel(size: 14, weight: .light)
    
    private lazy var stackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 12
        $0.alignment = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private var footerLeftImageView = ImageView(cornerRadius: 23)
    
    private var footerCenterImageView = ImageView(cornerRadius: 23)
    
    private var footerRightImageView = ImageView(cornerRadius: 23)
    
    private var footerBtn = FooterBtn()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainView)
        setUpStackView()
        mainView.addSubviews(view: headerImageView, footerNameLabel, footerDescLabel, stackView, footerBtn)
        setFalseMask()
        setUpLayout()
        
    }
    
    private func setUpStackView() {
        stackView.addArrangedSubview(footerLeftImageView)
        stackView.addArrangedSubview(footerCenterImageView)
        stackView.addArrangedSubview(footerRightImageView)

    }
    
    func setupData(item: UserData) {
        headerImageView.image = UIImage(named: item.headerImage)
        footerNameLabel.text = item.nameLabel
        footerDescLabel.text = item.descLabel
        footerLeftImageView.image = UIImage(named: item.leftFooterImage)
        footerCenterImageView.image = UIImage(named: item.centerFooterImage)
        footerRightImageView.image = UIImage(named: item.rightFooterImage)
        
    }
    
    private func setFalseMask() {
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        footerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        footerDescLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            headerImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            headerImageView.heightAnchor.constraint(equalToConstant: 163),
            headerImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            headerImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25),
            
            footerNameLabel.centerYAnchor.constraint(equalTo: headerImageView.centerYAnchor),
            footerNameLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: 20),
            footerNameLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: -20),
            
            footerDescLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor, constant: 20),
            footerDescLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: -20),
            footerDescLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -14),
            
            stackView.heightAnchor.constraint(equalToConstant: 99),
            stackView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor),
            footerBtn.heightAnchor.constraint(equalToConstant: 49),
            footerBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 17),
            footerBtn.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            footerBtn.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: footerBtn.bottomAnchor, constant: 15)
            
        ])
    }
    
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
