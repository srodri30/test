//
//  Symptoms view controller.swift
//  test 3Tests
//
//  Created by Sabrina Rodriguez on 1/20/18.
//  Copyright © 2018 Sabrina Rodriguez. All rights reserved.
//


import UIKit

class SymptomsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    @IBAction func loginpressed(_ sender: Any) {
        self.performSegue(withIdentifier: "Symptoms", sender: self)
    }
    
}
