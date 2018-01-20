//
//  DashboardViewController.swift
//  test 3
//
//  Created by Sabrina Rodriguez on 1/20/18.
//  Copyright © 2018 Sabrina Rodriguez. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
  
    @IBAction func statspressed(_ sender: Any) {self.performSegue(withIdentifier: "stats", sender: self)

    }
    
    
    
}
