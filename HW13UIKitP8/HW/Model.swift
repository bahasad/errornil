//error nil

import Foundation

enum HeaderType{
    case news, event, users
}

struct CollectionSection{
    let header: String
    let items: [CollectionItems]
    let footer: String
    let type: HeaderType
    var headerBtntext: String? = nil
    
    static func mocData() -> [CollectionSection] {
        
        let newsItems: [CollectionItems] = [
            CollectionItems(headerText: "Жизнь на Марсе?", data: Date(), image: "mars.jpg", text: "Lorem ipsum dolor sit amet consectetur"),
            CollectionItems(headerText: "Жизнь на Марсе?", data: Date(), image: "mars.jpg", text: "Lorem ipsum dolor sit amet consectetur"),
            CollectionItems(headerText: "Жизнь на Марсе?", data: Date(), image: "mars.jpg", text: "Lorem ipsum dolor sit amet consectetur"),
            
        ]
        
        let newsSection: CollectionSection = CollectionSection(header: "Новости", items: newsItems, footer: "Lorem ipsum dolor sit amet consectetur. Enim suspendisse\naccumsan sed augue interdum velit aliquam lobortis donec.", type: .news)
        
        let eventsItems: [CollectionItems] = [
            CollectionItems(image: "shield", text: "Текст в одну строку, если ..."),
            CollectionItems(image: "shield", text: "Текст в одну строку, если ..."),
            CollectionItems(image: "shield", text: "Текст в одну строку, если ..."),
            CollectionItems(image: "shield", text: "Текст в одну строку, если ..."),
            CollectionItems(image: "shield", text: "Текст в одну строку, если ..."),
            CollectionItems(image: "shield", text: "Текст в одну строку, если ..."),
        ]
        
        let eventsSection: CollectionSection = CollectionSection(header: "События", items: eventsItems, footer: "", type: .event, headerBtntext: "Подробнее")
        
        let usersItems: [CollectionItems] = [
            CollectionItems(headerText: "Написать" , image: "parrot",  text: "Lorem ipsum dolor sit\namet consectetur.", name: "User Name"),
            CollectionItems(headerText: "Написать" , image: "parrot",  text: "Lorem ipsum dolor sit\namet consectetur.", name: "User Name"),
            CollectionItems(headerText: "Написать" , image: "parrot",  text: "Lorem ipsum dolor sit\namet consectetur.", name: "User Name"),
            CollectionItems(headerText: "Написать" , image: "parrot",  text: "Lorem ipsum dolor sit\namet consectetur.", name: "User Name"),
            CollectionItems(headerText: "Написать" , image: "parrot",  text: "Lorem ipsum dolor sit\namet consectetur.", name: "User Name"),
          
            
        ]
        
        let usersSection: CollectionSection = CollectionSection(header: "Пользователи", items: usersItems, footer: "", type: .event, headerBtntext: "Показать всех")
        
        return [newsSection, eventsSection, usersSection]
        
    }
}

struct CollectionItems{
    var headerText: String?
    var data: Date?
    let image: String
    let text: String
    var name: String? = nil
   
    
}
