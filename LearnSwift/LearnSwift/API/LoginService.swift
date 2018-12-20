//
//  LoginService.swift
//  LearnSwift
//
//  Created by Ankur on 12/13/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import Foundation
struct Service {
    
    static func loginWithEmail(email: String, password: String, completion:(Bool,NSDictionary?) -> Void ){
        if email == "abc" && password == "123456"{
      
            let json = ["client_id": "AnkurID",
                        "client_secret":"879439784",
                        "product_identifier": "0trioeo",
                        "username" : "Ankur",
                        "password": "12345",
                        "grant_type": "password"]
          
            completion(true,json as NSDictionary?)
        }
        else{
            
            let emptyDictionary = [String: String]()
            completion(false,emptyDictionary as NSDictionary?)
        }
    }
}
