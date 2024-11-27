//
//  Practice1Model.swift
//  SwiftUI_Practice_112524_API_Project34
//
//  Created by Baha Sadyr on 11/26/24.
//

import Foundation

struct Practice1Model: Decodable, Equatable {
    var data: [DataModel]
}

struct DataModel: Decodable, Equatable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
}
