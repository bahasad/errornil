//
//  Response.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/22/24.
//

import Foundation

struct Response: Codable {
    let items: [Items]
}

struct Items: Codable {
    let nameRu: String?
    let nameOriginal: String?
    let posterUrl: String?
}
