//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        print("🔥 BUNDLE ID:", Bundle.main.bundleIdentifier ?? "no bundle")
        
        if let email = emailTextfield.text,
           let password = passwordTextfield.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                
                if let error = error {
                    print(error)
                } else {
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
