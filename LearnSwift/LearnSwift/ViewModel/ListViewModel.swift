//
//  ListViewModel.swift
//  LearnSwift
//
//  Created by Ankur on 12/17/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import Foundation
import Contacts

// PRAGMA MARK: - Fetch Contacts -

/// Result Enum
///
/// - Success: Returns Array of Contacts
/// - Error: Returns error
public enum ContactsFetchResult {
    case Success(response: [CNContact])
    case Error(error: Error)
}


class ListViewModel {
    
    public var contacts = [CNContact]()
    
    @available(iOS 10.0, *)
    public func fetchContacts(ContactsSortorder sortOrder: CNContactSortOrder, completionHandler: @escaping (_ result: ContactsFetchResult) -> ()) {
        
        let contactStore: CNContactStore = CNContactStore()
        var contacts: [CNContact] = [CNContact]()
        let fetchRequest: CNContactFetchRequest = CNContactFetchRequest(keysToFetch: [CNContactVCardSerialization.descriptorForRequiredKeys()])
        fetchRequest.unifyResults = true
        fetchRequest.sortOrder = sortOrder
        do {
            try contactStore.enumerateContacts(with: fetchRequest, usingBlock: {
                contact, _ in
                contacts.append(contact) })
            completionHandler(ContactsFetchResult.Success(response: contacts))
        } catch {
            completionHandler(ContactsFetchResult.Error(error: error))
        }
    }
    
    func requestAccessToContacts(_ completion: @escaping (_ success: Bool) -> Void) {
        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        var contactStore = CNContactStore()

        switch authorizationStatus {
        case .authorized: completion(true) // authorized previously
        case .denied, .notDetermined: // needs to ask for authorization
            contactStore.requestAccess(for: CNEntityType.contacts, completionHandler: { (accessGranted, error) -> Void in
                completion(accessGranted)
            })
        default: // not authorized.
            completion(false)
        }
    }
    
}
