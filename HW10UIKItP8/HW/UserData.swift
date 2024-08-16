//
//  UserData.swift
//  HW
//
//  Created by Baha Sadyr on 8/15/24.
//

import Foundation

struct UserData {
    let image: String
    let carName: String
    let carPrice: String
    let addData : [String]
    
    
    static func mockData() -> [UserData] {
        [
            UserData(image: "volvoCar.jpg", carName: "Volvo XC90, 2020", carPrice: "6 690 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "cherryTiggoCar.jpg", carName: "Chery Tiggo 8, 2022", carPrice: "2 085 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "GeelyMonjaro.jpg", carName: "Geely Monjaro, 2024", carPrice: "4 200 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "cherryTiggoCar", carName: "Chery Tiggo 8, 2022", carPrice: "2 085 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "LiXiangL9.jpg", carName: "LiXiang L9 52.3, 2024", carPrice: "7 800 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "cherryTiggoCar", carName: "Chery Tiggo 8, 2022", carPrice: "2 085 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "AudiQ5.jpg", carName: "Audi Q5 45 TFSI, 2022", carPrice: "4 900 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"]),
            UserData(image: "CherryTiggo7.jpg", carName: "Chery Tiggo 8, 2022", carPrice: "2 085 000 ₽", addData: ["19 апреля", "2823 просмотров", "№ 1122360845"])
        ]
    }
}
