//
//  ListViewController.swift
//  LearnSwift
//
//  Created by Ankur on 12/17/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import UIKit
import Contacts

class ListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    let contactViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        requestContact()
    }
    
    func testFunction() {
        print("this is for test")
    }
    
    //    func retrieveContacts(_ completion: (_ success: Bool, _ contacts: [ContactEntry]?) -> Void) {
    //        var contacts = [ContactEntry]()
//            do {
//                let contactsFetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor, CNContactImageDataKey as CNKeyDescriptor, CNContactImageDataAvailableKey as CNKeyDescriptor, CNContactPhoneNumbersKey as CNKeyDescriptor, CNContactEmailAddressesKey as CNKeyDescriptor])
//                try contactStore.enumerateContacts(with: contactsFetchRequest, usingBlock: { (cnContact, error) in
//                    if let contact = ContactEntry(cnContact: cnContact) { contacts.append(contact)}
//                })
    //            completion(true, contacts)
    //        } catch {
    //            completion(false, nil)
    //        }
    //    }
    
    func requestContact(){
        
    contactViewModel.requestAccessToContacts { (success) in
            if success {
                
                
                if #available(iOS 10.0, *) {
                    self.contactViewModel.fetchContacts(ContactsSortorder: .givenName, completionHandler: { (result) in
                        switch result{
                        case .Success(response: let contacts):
                            // Do your thing here with [CNContacts] array
                           
                                if let contact = contact(cnContact: contacts) { contacts.append(contact)}
                        

                            //var contacts = [contact]()
                            //contactViewModel.contacts = contacts;
//                            self.contacts1 = contacts
//                            self.tableView.reloadData()
//                            self.tableView.isHidden = false
//                            self.noContactsLabel.isHidden = true
                            break
                        case .Error(error: let error):
                            print(error)
                            break
                        }
                    })
                } else {
                    // Fallback on earlier versions
                }
                
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
