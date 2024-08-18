//
//  UserData.swift
//  CollectionviewPractice
//
//  Created by Baha Sadyr on 8/18/24.
//

import Foundation

struct UserData {
    var image: String
    var itemName: String
    var itemPrice: String
    var itemLocation: String
    
    
    static func mockData() -> [UserData] {
        [
            UserData(image: "girl1", itemName: "Looking for a job", itemPrice: "100$", itemLocation: "New Orleans, LA"),
            UserData(image: "man1", itemName: "Selling a car", itemPrice: "2000$", itemLocation: "Atlanta, GA"),
            UserData(image: "man2", itemName: "Chilling out", itemPrice: "0$", itemLocation: "Chicago, IL"),
            UserData(image: "nature1", itemName: "Adventure tours", itemPrice: "3000$", itemLocation: "Buffalo Grove, IL"),
            UserData(image: "rain", itemName: "New York Tours", itemPrice: "1599$", itemLocation: "New York, NY"),
            UserData(image: "wall", itemName: "Selling Art", itemPrice: "220$", itemLocation: "Omaha, NE"),
            UserData(image: "girl2", itemName: "Offering a job", itemPrice: "500$", itemLocation: "Sunnyvale, CA"),
            UserData(image: "girl2", itemName: "Offering a job", itemPrice: "500$", itemLocation: "Sunnyvale, CA"),
            UserData(image: "girl2", itemName: "Offering a job", itemPrice: "500$", itemLocation: "Sunnyvale, CA"),
            UserData(image: "girl2", itemName: "Offering a job", itemPrice: "500$", itemLocation: "Sunnyvale, CA"),
            
        ]
    }
}
