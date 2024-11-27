//
//  HomeViewModel.swift
//  HW6P8M4_GeometryReader
//
//  Created by Baha Sadyr on 11/27/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var items: [DataModel] = []
    
    @Published var userInput: String = ""
    
    func getItems() async {
        
        let networkManager = NetworkManager()
        do {
            items = try await networkManager.getAsyncItemsFromAPICall()
            print("Fetched it: \(items)")
        } catch CustomError.invalidURL {
            print("invalid URL")
        } catch CustomError.invalidResponse {
            print("invalid Response")
        } catch CustomError.invalidData {
            print("invalid Data")
        } catch {
            print("unexpected error")
        }
    }
}
