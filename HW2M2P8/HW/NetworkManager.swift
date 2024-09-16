//
//  NetworkManager.swift
//  HW
//
//  Created by Baha Sadyr on 9/15/24.
//

import Foundation

class NetworkManager {
    //https://rickandmortyapi.com/api/character
    
    func sendRequest(completion: @escaping ([Results]) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rickandmortyapi.com"
        urlComponents.path = "/api/character"
        
        guard let url = urlComponents.url else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data else { return }
            do {
                let result = try JSONDecoder().decode(Response.self, from: data)
                completion(result.results)
            }catch{
                print(error)
            }
        }.resume()
        
        
        
        
    }
}

struct Response: Codable {
    var results: [Results]
}

struct Results: Codable {
    let name: String?
    let gender: String?
    let image: String?
}
