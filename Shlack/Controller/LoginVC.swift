//
//  LoginVC.swift
//  Shlack
//
//  Created by Marko R. on 7/4/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: GOSIGNUP, sender: nil)
    }
    
    

}
