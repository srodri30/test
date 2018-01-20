//
//  ViewController.swift
//  test 3
//
//  Created by Sabrina Rodriguez on 1/20/18.
//  Copyright © 2018 Sabrina Rodriguez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    @IBAction func loginpressed(_ sender: Any) {
        self.performSegue(withIdentifier: "dashboard", sender: self)
    }
    
}





