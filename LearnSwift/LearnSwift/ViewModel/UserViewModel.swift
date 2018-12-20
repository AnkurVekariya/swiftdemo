//
//  UserViewModel.swift
//  LearnSwift
//
//  Created by Ankur on 12/13/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import Foundation

enum UserValidationState{
    case Valid
    case Invalid(String)
}


class UserViewModel {
    
    private let minPasswordLength = 5
    private var user = User()
    
    var userEmail:String {
        return user.userName
    }
    
    var password: String {
        return user.passWord
    }

}

extension UserViewModel {
    
    func updateUserName (username: String){
        user.userName = username
    }
    func updatePassword (password:String){
        user.passWord = password
    }
    
    func validate() -> UserValidationState {
        
        if user.userName.isEmpty || user.passWord.isEmpty {
            return .Invalid("Username and Password are Required.")
        }
        if user.passWord.count < minPasswordLength{
            
            return .Invalid("Password needs to be at lease \(minPasswordLength) charecters long.")
        }
        return .Valid
    }
    
    func login(completion: (_ errorString: String?) -> Void){
        print("username = \(user.userName) and password = \(user.passWord)")
        Service.loginWithEmail(email: user.userName, password: user.passWord) { (success,dict) in
            if success {
                if let dict = dict {
                    print(dict)
                }
                completion(nil)
            }
            else{
                completion("Invalid credentials")
            }
        }
        
    }
    
}
