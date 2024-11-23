//
//  HomeViewViewModel.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/22/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var mainCardItems: [MainCardModel] = [
        MainCardModel(photo: "112224-Leave2", photoCount: "4 фотографии", commentCount: "2 комментария",tags: [ "Nature", "Природа", "Закат"],
                      desc: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit, sed do eiusmod tempor\nincididunt ut ..."),
        MainCardModel(photo: "112224-Leave2", photoCount: "2 фотографии", commentCount: "5 комментария", tags: ["Природа", "Природа", "Природа"], desc: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit, sed do eiusmod tempor\nincididunt ut ..."),
    ]
    
    @Published var HomeModelDateItems: [HomeModel] = [
        HomeModel(date: "Сегодня")
    ]
    
}
