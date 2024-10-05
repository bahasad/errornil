//
//  Service.swift
//  HW5M3P8_Persistent
//
//  Created by Baha Sadyr on 10/3/24.
//

import Foundation
import FirebaseAuth

class Service {
    
    func createUser(for user: UserData) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, err in
            guard err == nil else {
                print(err!)
                return
                
            }
            
            print(result?.user.uid)
        }
        
        
        
    }
    
    func signIn(for user: UserData) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, err in
            <#code#>
        }
    }
}

struct UserData {
    let email: String
    let password: String
}
