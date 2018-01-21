//
//  AppDelegate.swift
//  test 3
//
//  Created by Sabrina Rodriguez on 1/20/18.
//  Copyright © 2018 Sabrina Rodriguez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct test {
    static var d = Doctor(firstName: "Tarun", lastName: "Belani", username: "tbelani", password: "tbelani")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var ref: DatabaseReference!


    
    func syncWithDatabase(d: Doctor) {
        ref.child("doctors").child("doc1").setValue([
            "firstName": d.firstName,
            "lastName": d.lastName,
            "username": d.username,
            "password": d.password
        ])
        var i = 0
        while i < d.patients.count{
         ref.child("patients").child("p" + String(i)).setValue([
            "firstName": d.patients[i].firstName,
            "lastName": d.patients[i].lastName,
            "username": d.patients[i].username,
            "password": d.patients[i].password,
            "weight": d.patients[i].weight,
            "height": d.patients[i].height,
            "age": d.patients[i].age
        ])
            var j = 0
            while j < d.patients[i].symptoms.count {
                let date = String(describing: d.patients[i].symptoms[j].timeStamp.month!) + "/" + String(describing: d.patients[i].symptoms[j].timeStamp.day!) + "/" + String(describing: d.patients[i].symptoms[j].timeStamp.year!)
                print(i,j)
                ref.child("patients").child("p" + String(i)).child("symptoms").child("s" + String(j)).updateChildValues(["name":d.patients[i].symptoms[j].name, "desc": d.patients[i].symptoms[j].desc,"timeStamp": date])
                
                j+=1
            }
        
            i+=1
        }
    }

    func loginAuthenticate(u: String, p: String){
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        ref = Database.database().reference()
        
        
        // this next block sets up the "fake" database for users
        test.d.patients = [Patient(firstName: "Josh", lastName: "Freedman", weight: 180.0, height: 70.0, age: 18, username: "jfreed", password: "jfreed"),
                        Patient(firstName: "Azwad", lastName: "Rahman", weight: 180.0, height: 70.0, age: 29, username: "arahm", password: "arahm"),
                        Patient(firstName: "Sabrina", lastName: "Rodriguez", weight: 180.0, height: 65.5, age: 18, username: "srod", password: "srod")
        ]
        test.d.patients[2].addSymptoms(name: "Migraine", desc: "Throbbing migraine, constantly hurting all day")
        
        syncWithDatabase(d: test.d)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }



}

