//
//  CardModel.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/23/24.
//

import Foundation

struct MainCardModel : Hashable, Identifiable {
    let id = UUID().uuidString
    let photo: String
    let photoCount: String
    let commentCount: String
    let tags: [String]
    let desc: String
}
