//
//  ChannelVC.swift
//  Shlack
//
//  Created by Marko R. on 7/1/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    // Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 50
        // showing rear view all but -50 points

        
    }
    
    //Actions

    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: GOLOGIN, sender: nil)
    }
    
    

}
