//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

final class ViewController: UIViewController {
    
    var images: [UIImage] = [.nature1HW9, .nature2HW9, .nature3HW9]
    
    private lazy var scrollView: UIScrollView = {
        $0.addSubview(viewScrollContent)
        return $0
    }(UIScrollView(frame: view.frame))
    
    private lazy var viewScrollContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var mainLabel = SharedLabel(size: 19, weight: .light, texxt: "ELIE SAAB LE PARFUM BRIDAL EAU DE\nPARFUM")
    
    private lazy var headerImage = SharedImageView(image: UIImage(named: "parfum"))
    
    private lazy var starMainImage = SharedImageView(image: UIImage(named: "starNoColor"))
    
    private lazy var mainStarImageView: UIImageView = {
        return $0
    }(UIImageView())
    
    private lazy var mainLabelStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .top
        return $0
    }(UIStackView())
    
    private lazy var stackForReview = SharedStack(stackDistribution: .equalSpacing, stackSpacing: 16)
    
    private lazy var reviewLabel = SharedLabel(size: 15, weight: .light, color: .appGray, texxt: "249 отзывов")
    
    private lazy var stackForPrice = SharedStack(stackDistribution: .equalSpacing)

    private lazy var priceLabel = SharedLabel(size: 21, weight: .bold, color: .black, texxt: "4 299 ₽")
    
    private lazy var basketBtn: UIButton = {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("В корзину", for: .normal)
        $0.layer.cornerRadius = 7
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    private lazy var descLabel = SharedLabel(size: 16, weight: .bold, color: .black, texxt: "Описание")
    
    let text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed\ndo eiusmod tempor incididunt ut labore et dolore magna\naliqua. Ut enim ad minim veniam, quis nostrud exercitation\nullamco laboris nisi ut aliquip ex ea commodo"
    
    private lazy var descTextLabel = SharedLabel(size: 14, weight: .light, color: .black, texxt: text)
    
    private lazy var stackForFooterImgView = SharedStack(stackDistribution: .equalSpacing, stackAlignment: .fill, stackSpacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        setupLayout()
        
        
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            viewScrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            viewScrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            viewScrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            viewScrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewScrollContent.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
        
        
        viewScrollContent.addSubview(headerImage)
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: viewScrollContent.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: viewScrollContent.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: viewScrollContent.trailingAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: 430),
        ])
        
        viewScrollContent.addSubview(mainLabelStack)
        viewScrollContent.addSubview(stackForReview)
        viewScrollContent.addSubview(stackForPrice)
        viewScrollContent.addSubview(descLabel)
        viewScrollContent.addSubview(descTextLabel)
        viewScrollContent.addSubview(stackForFooterImgView)
        
        mainLabelStack.addArrangedSubview(mainLabel)
        mainLabelStack.addArrangedSubview(starMainImage)
        
        images.forEach{ image in
            let imageView = SharedImage(image: image)
            stackForFooterImgView.addArrangedSubview(imageView)
        }
        
        NSLayoutConstraint.activate([
            mainLabelStack.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 41),
            mainLabelStack.leadingAnchor.constraint(equalTo: headerImage.leadingAnchor, constant: 16),
            mainLabelStack.trailingAnchor.constraint(equalTo: headerImage.trailingAnchor, constant: -16),
            

        ])
        

        for _ in 1...3 {
            let imageview = SharedImage(image: UIImage(named: "StarColorFiiled"))
            
            
            stackForReview.addArrangedSubview(imageview)
        }
        let imageviewstar = SharedImage(image: UIImage(named: "StarColorNotFilled"))
        
        stackForReview.addArrangedSubview(imageviewstar)
        stackForReview.addArrangedSubview(reviewLabel)
        
        NSLayoutConstraint.activate([
            stackForReview.topAnchor.constraint(equalTo: mainLabelStack.bottomAnchor, constant: 21),
            stackForReview.leadingAnchor.constraint(equalTo: viewScrollContent.leadingAnchor, constant: 15),
            stackForReview.trailingAnchor.constraint(equalTo: viewScrollContent.trailingAnchor, constant: -15),
//            stackForReview.widthAnchor.constraint(equalToConstant: 88),


    
        ])
        
        stackForPrice.addArrangedSubview(priceLabel)
        stackForPrice.addArrangedSubview(basketBtn)
        
        NSLayoutConstraint.activate([
            basketBtn.widthAnchor.constraint(equalToConstant: 139),
            basketBtn.heightAnchor.constraint(equalToConstant: 49),
            stackForPrice.topAnchor.constraint(equalTo: stackForReview.bottomAnchor, constant: 14),
            stackForPrice.leadingAnchor.constraint(equalTo: viewScrollContent.leadingAnchor, constant: 15),
            stackForPrice.trailingAnchor.constraint(equalTo: viewScrollContent.trailingAnchor, constant: -15),
            descLabel.topAnchor.constraint(equalTo: stackForPrice.bottomAnchor, constant: 45),
            descLabel.leadingAnchor.constraint(equalTo: viewScrollContent.leadingAnchor, constant: 15),
            descTextLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 6),
            descTextLabel.leadingAnchor.constraint(equalTo: viewScrollContent.leadingAnchor, constant: 15),
            descTextLabel.trailingAnchor.constraint(equalTo: viewScrollContent.trailingAnchor, constant: -15),
            stackForFooterImgView.topAnchor.constraint(equalTo: descTextLabel.bottomAnchor, constant: 48),
            stackForFooterImgView.leadingAnchor.constraint(equalTo: descTextLabel.leadingAnchor),
//            stackForFooterImgView.centerXAnchor.constraint(equalTo: viewScrollContent.centerXAnchor),
            //stackForFooterImgView.trailingAnchor.constraint(equalTo: viewScrollContent.trailingAnchor, constant: -15),
            stackForFooterImgView.heightAnchor.constraint(equalToConstant: 120),
            stackForFooterImgView.widthAnchor.constraint(equalToConstant: 400)
            
        ])
        
        
        
        
        
        
        
        
        
    }
    
    
    
    


}

