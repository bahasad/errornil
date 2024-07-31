//
//  MainViewController.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/28/24.
//

import UIKit

final class MainVC: UIViewController {
    
    private lazy var headerView = SharedView(color: UIColor(hex: "#007BFC"))
    private lazy var headerCompanyLogo = SharedImageView(image: .logoEmblem)
    private lazy var headerMainServiceLabel = SharedLabel(size: 22, textColor: .white, text: "Сервис квартирных решений от сделки до отделки")
    private lazy var headerFooterLeftView = HeaderFooterView(radius: 8, boldText: "Купить", lightText: "Подберем подходящий объект", includeBtn: true, lightLabelWidth: 74, lightLabelHeight: 44)
    private lazy var headerFooterRightView = HeaderFooterView(radius: 8, boldText: "Продать", lightText: "Сами найдем покупателя", includeBtn: true, lightLabelWidth: 74, lightLabelHeight: 44)
    private lazy var servicesLabel = SharedLabel(size: 24, text: "Услуги")
    private lazy var mainBlockInsuranceView = HeaderFooterView(radius: 8, boldText: "Страхование", boldLabelFontSize: 12, lightText: "Защитите имущество здоровье и жизнь", lightLabelWidth: 134, lightLabelHeight: 32, backgroundColor: UIColor(hex: "#E6EDFF"))
    private lazy var mainBlockEstateEstimateView = HeaderFooterView(radius: 8, boldText: "Оценка недвижимости", boldLabelFontSize: 13, lightText: "Узнайте стоимость объекта недвижимости", lightLabelWidth: 151, lightLabelHeight: 32, backgroundColor: UIColor(hex: "#D6FCC3"))
    private lazy var mainBlockInteriorDesignView = HeaderFooterView(radius: 8, boldText: "Дизайн интерьера", boldLabelFontSize: 13, lightText: "", lightLabelWidth: 0, lightLabelHeight: 0, backgroundColor: UIColor(hex: "#F9DEE0"), boldLabelWidth: 70)
    private lazy var footerHeaderLabel = SharedLabel(size: 24, text: "Жилые комплексы")
    private lazy var footerView = FooterView()



    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        headerView.addSubviews(view: headerCompanyLogo, headerMainServiceLabel, headerFooterLeftView, headerFooterRightView)
        view.addSubviews(view: headerView, servicesLabel, mainBlockInsuranceView, mainBlockEstateEstimateView, mainBlockInteriorDesignView, footerHeaderLabel, footerView)
        setLayout()
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 349),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerCompanyLogo.heightAnchor.constraint(equalToConstant: 34),
            headerCompanyLogo.widthAnchor.constraint(equalToConstant: 91),
            headerCompanyLogo.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 69),
            headerCompanyLogo.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            headerMainServiceLabel.heightAnchor.constraint(equalToConstant: 60),
            headerMainServiceLabel.topAnchor.constraint(equalTo: headerCompanyLogo.bottomAnchor, constant: 21),
            headerMainServiceLabel.leadingAnchor.constraint(equalTo: headerCompanyLogo.leadingAnchor),
            headerMainServiceLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -50),
            headerFooterLeftView.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier:1/2, constant: -25),
            headerFooterLeftView.heightAnchor.constraint(equalToConstant: 135),
            headerFooterLeftView.topAnchor.constraint(equalTo: headerMainServiceLabel.bottomAnchor, constant: 22),
            headerFooterLeftView.leadingAnchor.constraint(equalTo: headerMainServiceLabel.leadingAnchor),
            headerFooterRightView.topAnchor.constraint(equalTo: headerMainServiceLabel.bottomAnchor, constant: 22),
            headerFooterRightView.heightAnchor.constraint(equalTo: headerFooterLeftView.heightAnchor),
            headerFooterRightView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            headerFooterRightView.widthAnchor.constraint(equalTo: headerFooterLeftView.widthAnchor),
            servicesLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 35),
            servicesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            mainBlockInsuranceView.topAnchor.constraint(equalTo: servicesLabel.bottomAnchor, constant: 17),
            mainBlockInsuranceView.leadingAnchor.constraint(equalTo: servicesLabel.leadingAnchor),
            mainBlockInsuranceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            mainBlockInsuranceView.heightAnchor.constraint(equalToConstant: 95),
            mainBlockEstateEstimateView.topAnchor.constraint(equalTo: mainBlockInsuranceView.bottomAnchor, constant: 6),
            mainBlockEstateEstimateView.leadingAnchor.constraint(equalTo: mainBlockInsuranceView.leadingAnchor),
            mainBlockEstateEstimateView.heightAnchor.constraint(equalToConstant: 95),
            mainBlockEstateEstimateView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2, constant: -20),
            mainBlockInteriorDesignView.topAnchor.constraint(equalTo: mainBlockEstateEstimateView.topAnchor),
            mainBlockInteriorDesignView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            mainBlockInteriorDesignView.heightAnchor.constraint(equalTo: mainBlockEstateEstimateView.heightAnchor),
            mainBlockInteriorDesignView.widthAnchor.constraint(equalTo: mainBlockEstateEstimateView.widthAnchor),
            footerHeaderLabel.topAnchor.constraint(equalTo: mainBlockInteriorDesignView.bottomAnchor, constant: 27),
            footerHeaderLabel.leadingAnchor.constraint(equalTo: mainBlockInsuranceView.leadingAnchor),
            footerView.topAnchor.constraint(equalTo: footerHeaderLabel.bottomAnchor, constant: 20),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            footerView.heightAnchor.constraint(equalToConstant: 193),
        ])
    }
    

   

}
