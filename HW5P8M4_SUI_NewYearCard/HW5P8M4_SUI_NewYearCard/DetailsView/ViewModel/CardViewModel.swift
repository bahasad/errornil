//
//  CardViewModel.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/19/24.
//

import Foundation

class CardViewModel: ObservableObject {
    
   // @Published var comments: [String] = []
    
    @Published var comments: [CommentsModel] = []
    
    @Published var imageItems = [
        CardModel(mainImage: "111924-1"),
        CardModel(mainImage: "111924-2"),
    ]
    @Published var headerDateItems = [
        DateItem(month: formattedDateForMonth(), year: formattedDateForYear())
    ]
    @Published var mainGridItem = [
        MainGridItem(listLabel: "Природа"),
        MainGridItem(listLabel: "Nature"),
        MainGridItem(listLabel: "Природа"),
        MainGridItem(listLabel: "Nature"),
    ]
    
    static func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let today = Date()
        return formatter.string(from: today)
    }
    static func formattedDateForMonth() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM"
        let today = Date()
        return formatter.string(from: today)
    }
    static func formattedDateForYear() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "yyyy"
        let currentYear = formatter.string(from: Date())
        return "\(currentYear) год"
    }
    
}

