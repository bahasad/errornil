//
//  Untitled.swift
//  HW6M3P8_FBWithAutorization
//
//  Created by Baha Sadyr on 10/10/24.
//

import Foundation

struct Note {
    var id: String = UUID().uuidString
    let header: String
    let note: String
    let image: String?
    
    static func example() -> [Note]{
        [
            Note(header: "Hello", note: "World", image: ""),
            Note(header: "Hello", note: "World", image: "")
        ]
    }
}
