//
//  UserData.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import Foundation

struct UserData {
    var nameLabel: String
    var descLabel: String
    var headerImage: String
    var leftFooterImage: String
    var centerFooterImage: String
    var rightFooterImage: String
    
    static func mockData() -> [UserData] {
        [
            UserData(nameLabel: "John Doe", descLabel: "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod tempor\n incididunt", headerImage: "eagle1.jpg", leftFooterImage: "leftFooterImage1cell.jpg", centerFooterImage: "centerFooterImage1cell.jpg",rightFooterImage: "rightFooterImage1cell.jpg"),
            UserData(nameLabel: "Elon Mask", descLabel: "Elon Reeve Musk FRS is a businessman\n and investor known for his key\n roles in space company SpaceX", headerImage: "winter.jpg", leftFooterImage: "leftFooterImage2cell.jpg", centerFooterImage: "centerFooterImage2cell.jpg",rightFooterImage: "rightFooterImage2cell.jpg"),
            UserData(nameLabel: "Robert Downey", descLabel: "Robert John Downey Jr. is an American actor.", headerImage: "manInRedWall.jpg", leftFooterImage: "leftFooterImage3cell.jpg", centerFooterImage: "centerFooterImage3cell.jpg",rightFooterImage: "rightFooterImage3cell.jpg")
        ]
    }
}
