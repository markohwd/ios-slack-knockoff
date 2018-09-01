//
//  SignupVC.swift
//  Shlack
//
//  Created by Marko R. on 7/4/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    //IBOutlets
    @IBOutlet weak var emailTxt: LoginText!
    @IBOutlet weak var usernameTxt: LoginText!
    @IBOutlet weak var passwordTxt: LoginText!
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func generateBackgroundColor(_ sender: Any) {
    }
    
    
    @IBAction func signupAccountPressed(_ sender: Any) {
        
        //print ("Password")
        //print ("\(passwordTxt.text)")
        

        guard let email = emailTxt.text , emailTxt.text != "" else {
            return
        }
        
        guard let password = passwordTxt.text , passwordTxt.text != "" else {
            return
        }

        
        AuthenticateService.instance.registerUser(email: email, password: password)
        { (success) in
            if success {
                print("registered user!")
                AuthenticateService.instance.loginUser(email: email, password: password, completion: { (success ) in
                        if success {
                            print("User Logged in!", AuthenticateService.instance.authToken)
                        }
                    
                })
            }
        }
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

    
}
