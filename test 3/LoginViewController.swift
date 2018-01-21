//
//  ViewController.swift
//  test 3
//
//  Created by Sabrina Rodriguez on 1/20/18.
//  Copyright © 2018 Sabrina Rodriguez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


//returns 0 if invalid login, 1 for doctor, and 2 for patient
func loginAuthenticate(u: String, p: String, d: Doctor) -> Int{
    // checks if it is a doctor
    if (u == d.username && p == d.password) {
        return 1
    }
    
    // checks if it is a patient
    var i = 0
    while i < d.patients.count {
        if (u == d.patients[i].username && p == d.patients[i].password) {
            return 2
        }
        i += 1
    }
    // default condition
    return 0
}

class LoginViewController: UIViewController{
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
   
    
    @IBAction func loginpressed(_ sender: Any) {
        
        if (loginAuthenticate(u: username.text!, p: password.text! , d: test.d ) == 2) {
            self.performSegue(withIdentifier: "dashboard", sender: self)}
        else if (loginAuthenticate(u: username.text!, p: password.text! , d: test.d ) == 1)
        {
            
                self.performSegue(withIdentifier: "Doctor", sender: self)
        }
    }
    
    @IBAction func Backbutton(_ sender: Any) {
        self.performSegue(withIdentifier: "login", sender: self)
    }

}





