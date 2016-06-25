//
//  LoginViewController.swift
//  AngelHackRio
//
//  Created by Jean Paul Marinho on 25/06/16.
//  Copyright © 2016 Jean Paul Marinho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        APIClient.sharedInstance.login()
    }
}
