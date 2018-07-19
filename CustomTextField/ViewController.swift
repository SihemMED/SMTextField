//
//  ViewController.swift
//  CustomTextField
//
//  Created by Sihem MOHAMED on 18/07/2018.
//  Copyright © 2018 SIMO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
   @IBOutlet weak var emailTextField: SMTextField!
    @IBOutlet weak var passwordTextField: SMTextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.isRightViewHidden = true
        passwordTextField.isRightViewHidden = true
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if emailTextField.isValidEmail() {
            emailTextField.isRightViewHidden = false
            return true
        }else{
            return false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTextField {
            let minLength = 5
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            passwordTextField.isRightViewHidden = true
            if newString.length > minLength {
                passwordTextField.isRightViewHidden = false
            }
        }else if textField == emailTextField {
            emailTextField.isRightViewHidden = true
            if emailTextField.isValidEmail() {
                emailTextField.isRightViewHidden = false
            }
        }
        return true
    }
}

