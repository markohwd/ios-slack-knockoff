//
//  ChatVC.swift
//  Shlack
//
//  Created by Marko R. on 7/1/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    
    
    @IBOutlet weak var menuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())

    }



}
