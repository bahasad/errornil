//
//  ViewModel.swift
//  P8M4HW3_SUI_MaketKino
//
//  Created by Baha Sadyr on 11/6/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var featuredMovies: [Movie] = [
           Movie(imageName: "61124-alive301"),
           Movie(imageName: "61124-Ice")
       ]
    @Published var categories: [Category] = [
        Category(icon: "61124-MovieIcon", name: "Фильмы"),
        Category(icon: "61124-TVShowIcon", name: "Сериалы"),
        Category(icon: "61124-CartoonIcon", name: "Мультфильмы")
    ]
    
    @Published var continueWatchingMovies: [Movie] = [
        Movie(imageName: "61124-FrechRouletteMovie"),
        Movie(imageName: "61124-SprinterMovie")
    ]
    
    @Published var footerMovies: [Movie] = [
        Movie(imageName: "61124-TheSonMovie"),
        Movie(imageName: "61124-MasterAndMargarita"), 
        Movie(imageName: "61124-ArturTheKing"),
        Movie(imageName: "61124-ChikatiloShadow")
    ]
}

struct Category: Hashable {
    let icon: String
    let name: String
}

struct Movie: Hashable {
    let imageName: String
}
