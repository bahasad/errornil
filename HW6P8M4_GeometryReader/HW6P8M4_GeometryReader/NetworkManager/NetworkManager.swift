//
//  NetworkManager.swift

//
//  Created by Baha Sadyr on 11/25/24.
//

import Foundation

class NetworkManager {
    
    func getAsyncItemsFromAPICall() async throws ->  [DataModel] {
        
        //https://reqres.in/api/users?page=1
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "reqres.in"
        urlComponents.path = "/api/users"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "2")
        ]
        
        guard let url = urlComponents.url else {
            throw CustomError.invalidURL
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CustomError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        let result: Practice1Model
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            result = try decoder.decode(Practice1Model.self, from: data)
        } catch {
            throw CustomError.invalidData
        }
        
        
        
        return result.data
        
    }
}

enum CustomError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

