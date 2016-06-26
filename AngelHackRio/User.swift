//
//  User.swift
//  AngelHackRio
//
//  Created by Jean Paul Marinho on 25/06/16.
//  Copyright © 2016 Jean Paul Marinho. All rights reserved.
//

import Foundation

class User: NSObject {
    
    static let sharedInstance = User()
    let name: String = "Kristina Romanova"
    let age: Int = 20
    let place: String = "Sao Paulo/SP"
    let languages: [String]  = ["Portuguese", "English", "Spanish"]
    let about: String = "Sobre mim"
}
