//
//  NetworkManager.swift
//  HW3M2P8
//
//  Created by Baha Sadyr on 9/17/24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func sendReq(completion: @escaping ([Response]?) -> Void) {
        let url: String = "https://api.thecatapi.com/v1/images/search?limit=10"
        
        let headers: HTTPHeaders = [
            "api_key" : "live_uP9lI1qBgJthYlgf0g2NpO64LoY2zf29lpHsdGlvs3GMjH4PHuhQy429D93jANjy"
        ]
        
        AF.request(url, headers: headers).response { response in
            guard response.error == nil, let data = response.data else {
                completion(nil)
                return }
            
            do {
                let result = try  JSONDecoder().decode([Response].self, from: data)
                completion(result)
            } catch {
                print("failed")
                completion(nil)
            }
        }
    }
}
