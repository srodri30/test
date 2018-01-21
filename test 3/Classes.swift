//
//  classes.swift
//  test1
//
//  Created by T on 1/20/18.
//  Copyright © 2018 T. All rights reserved.
//

import Foundation

class Symptom {
    var name: String
    var desc: String
    var timeStamp: DateComponents
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
        // this next block of code sets the date and then makes it easier to access
        let current = Date()
        let cal = Calendar.current
        let requested: Set<Calendar.Component> = [ .year, .month, .day]
        self.timeStamp = cal.dateComponents(requested, from: current)
    }
}

class Patient {
    var firstName: String
    var lastName: String
    var weight: Double
    var height: Double
    var age: Int
    var username: String
    var password: String
    var symptoms: Array<Symptom>
    
    // constructor
    init(firstName: String, lastName: String, weight: Double, height: Double, age: Int, username: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.weight = weight
        self.height = height
        self.age = age
        self.username = username
        self.password = password
        self.symptoms = [Symptom]()
        
    }
    
    func addSymptoms(name: String, desc: String) {self.symptoms.append(Symptom(name:name,desc:desc))}
}

class Doctor {
    var firstName: String
    var lastName: String
    var username: String
    var password: String
    var patients: Array<Patient>
    
    init(firstName: String, lastName: String, username: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
        self.patients = [Patient]()
    }
    func addPatients(p: Patient) {self.patients.append(p)}
}
