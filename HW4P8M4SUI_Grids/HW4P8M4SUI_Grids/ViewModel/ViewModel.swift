//
//  File.swift
//  HW4P8M4SUI_Grids
//
//  Created by Baha Sadyr on 11/9/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    
    @Published var items: [ItemCard] = [
        
        ItemCard(image: "81124-Iphone144", isBookmarked: true, price: "107990", description: "Apple iPhone 11 Pro\n512Gb Серебристый"),
        ItemCard(image: "81124-iphone14Blue", isBookmarked: true, price: "127990", description: "Apple iPhone 12 Pro\n128Gb Серебристый"),
        ItemCard(image: "81124-Iphone144", isBookmarked: true, price: "157990", description: "Apple iPhone 12 Pro\n256Gb Серебристый"),
        ItemCard(image: "81124-iphone14Blue", isBookmarked: true, price: "207990", description: "Apple iPhone 14 Pro\n128Gb Серебристый"),
        ItemCard(image: "81124-Iphone144", isBookmarked: true, price: "215400", description: "Apple iPhone 15 Pro\n256Gb Серебристый"),
        ItemCard(image: "81124-iphone14Blue", isBookmarked: true, price: "230111", description: "Apple iPhone 16 Pro\n512Gb Серебристый"),
    ]
}
