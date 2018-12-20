//
//  contact.swift
//  LearnSwift
//
//  Created by Ankur on 12/17/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import Foundation
import Contacts

class contact{
    
    var name: String!
    var email: String?
    var phoneNumbar: String?
    
    init(name:String,email:String?,phoneNumbar:String?) {
        
        self.name = name
        self.email = email
        self.phoneNumbar = phoneNumbar
        
    }
    
    @available(iOS 9.0, *)
    init?(cnContact:CNContact) {
        
        if cnContact.isKeyAvailable(CNContactGivenNameKey) && cnContact.isKeyAvailable(CNContactFamilyNameKey){
            
            self.name = (cnContact.givenName + " " + cnContact.familyName).trimmingCharacters(in: CharacterSet.whitespaces)
        }
        else{
            
            return
        }
        
        if cnContact.isKeyAvailable(CNContactPhoneNumbersKey){
            if cnContact.phoneNumbers.count > 0{
                self.phoneNumbar = cnContact.phoneNumbers.first?.value.stringValue
            }
        }
        
        if cnContact.isKeyAvailable(CNContactEmailAddressesKey) {
            for possibleEmail in cnContact.emailAddresses {
                let properEmail = possibleEmail.value as String
               self.email = properEmail
            }
        }

    }
}
