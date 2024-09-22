//
//  NetworkManager.swift
//  HW4M2P8_MVC_URLSession
//
//  Created by Baha Sadyr on 9/22/24.
//

import Foundation

class NetworkManager {
    
//    curl -X 'GET' \
//      'https://kinopoiskapiunofficial.tech/api/v2.2/films?order=RATING&type=ALL&ratingFrom=0&ratingTo=10&yearFrom=1000&yearTo=3000&page=1' \
//      -H 'accept: application/json' \
//      -H 'X-API-KEY: 8771355d-40dd-4db8-8b02-f73a2e2e53e2'

    
    func sendRequest(completion: @escaping([Items]) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "kinopoiskapiunofficial.tech"
        urlComponents.path = "/api/v2.2/films"
        urlComponents.queryItems = [
            URLQueryItem(name: "order", value: "RATING"),
            URLQueryItem(name: "type", value: "ALL"),
            URLQueryItem(name: "ratingFrom", value: "0"),
            URLQueryItem(name: "ratingTo", value: "10"),
            URLQueryItem(name: "yearFrom", value: "1000"),
            URLQueryItem(name: "yearTo", value: "3000"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        guard let url = urlComponents.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue( "8771355d-40dd-4db8-8b02-f73a2e2e53e2" , forHTTPHeaderField:"X-API-KEY")
        urlRequest.setValue("application/json", forHTTPHeaderField:"accept" )
        
        URLSession.shared.dataTask(with: urlRequest) { data, _ , error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data else { return }
            
            
            do {
                
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                            print(json)
                        }
                
                let result = try JSONDecoder().decode(Response.self, from: data)
                completion(result.items)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
