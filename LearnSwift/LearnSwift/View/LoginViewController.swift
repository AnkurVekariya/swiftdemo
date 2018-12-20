//
//  LoginViewController.swift
//  LearnSwift
//
//  Created by Ankur on 12/13/18.
//  Copyright © 2018 ankur. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    private var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPress(_ sender: Any) {
        view.endEditing(true)
        switch viewModel.validate() {
        case .Valid:
             print("validate....")
             viewModel.login(){ strLN in
                if let strLN = strLN {
                    print(strLN)
                }
                else{
                    print("Login Successs")
                    self.performSegue(withIdentifier: "listSegue", sender: nil)
                }
                
            }
            
        case .Invalid(let error):
            print(error)
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
}
extension LoginViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtUser{
            textField.text = viewModel.userEmail
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == txtUser {
            viewModel.updateUserName(username: textField.text!)
        }
        if textField == txtPassword {
            viewModel.updatePassword(password: textField.text!)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtUser {
           txtPassword.becomeFirstResponder()
        }
        else{
            
            view.endEditing(true)
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtUser{
            viewModel.updateUserName(username: textField.text!)
        }
        else if textField == txtPassword{
            viewModel.updatePassword(password: textField.text!)
        }
        return true
    }
    
}
