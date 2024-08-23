//
//  Model.swift
//  HW
//
//  Created by Baha Sadyr on 8/22/24.
//

import Foundation

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let header: String
    let items: [CollectionItem]
    
    static func mockData() -> [CollectionSection] {
        let storyItems = [
            CollectionItem(image: "story1", name: "John"),
            CollectionItem(image: "story2", name: "Douglas"),
            CollectionItem(image: "story3", name: "Jerry"),
            CollectionItem(image: "story4", name: "Nick"),
        ]
        let messageItems = [
            CollectionItem(image: "story1", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "story2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "story3", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "story4", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            CollectionItem(image: "story2", text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
        ]
        let newsItems = [
            CollectionItem(image: "jernei", header: "AchTUnG!", text: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit"),
            CollectionItem(image: "sample1", header: "ATTenTiON!!", text: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit"),
            CollectionItem(image: "sample2", header: "HeADERR!!!", text: "Lorem ipsum dolor sit amet, consectetur\nadipisicing elit"),
        ]
        let bannerItems = [
            CollectionItem(image: "banner1"),
            CollectionItem(image: "banner2"),
            CollectionItem(image: "banner3"),
        ]
        let storySection = CollectionSection(header: "Stories", items: storyItems)
        let messageSection = CollectionSection(header: "Messages", items: messageItems)
        let newsSection = CollectionSection(header: "News", items: newsItems)
        let bannerSection = CollectionSection(header: "Banners", items: bannerItems)
        
        return [storySection, messageSection, newsSection, bannerSection]
        
        
    }
}

struct CollectionItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    var header: String? = nil
    var name: String? = nil
    var text: String? = nil
}
