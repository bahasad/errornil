//
//  Service.swift
//  HW5M3P8_Persistent
//
//  Created by Baha Sadyr on 10/2/24.
//

import UIKit
import FirebaseAuth


class Service {
    
    func createUser(for user: UserData) {
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, err in
            guard err == nil else {
                print(err!)
                return
            }
            
            result?.user.sendEmailVerification()
            
            print(result?.user.uid)
            
        }
        
    }

}

struct UserData {
    let email: String
    let password: String
}
