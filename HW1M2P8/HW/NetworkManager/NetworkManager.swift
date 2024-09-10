//
//  NetworkManager.swift
//  HW
//
//  Created by Baha Sadyr on 9/10/24.
//

import Foundation

class NetworkManager {
    func sndRequest(host: String, path: String, query: String, limit: Int) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = host
        urlComponent.path = path
        
        urlComponent.queryItems = [
            URLQueryItem(name: "page", value: limit.description)
        ]
        
        guard let url = urlComponent.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, responseHeaders, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data else { return }
            do {
                let result = try JSONDecoder().decode(Response.self, from: data)
                
                result.results.forEach({ item in
                    print(item.name ?? "")
                    print(item.origin.name ?? "")
                    print(item.origin.url ?? "")
                    item.episode.forEach ({item in
                        print("item episode : \(item)")
                    })
                    
                })
                
            } catch {
                print(error)
            }
            
            
            
        }.resume()
        
    }
}

struct Response: Codable {
    let results: [Results]
}

struct Results: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin
    let location: Location
    let image: String?
    let episode: [Episode]
    let url: String?
    let created: String?
}

struct Origin: Codable {
    let name: String?
    let url: String?
}

struct Location: Codable {
    let name: String?
    let url: String?
}

struct Episode: Codable {
    
}
