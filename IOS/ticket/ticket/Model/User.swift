//
//  User.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class User {
    var id: Int
    var fullname: String
    var password: String?
    var email: String
    var isAdmin: Bool
    var phone: String
    var tickets: [Int]
    
    static var Nil: User {
        return User(id: 0, fullname: "", password: nil, email: "", isAdmin: false, phone: "")
    }
    
    public init(id: Int, fullname: String, password: String?, email: String, isAdmin: Bool, phone: String) {
        self.id = id
        self.fullname = fullname
        self.password = password
        self.email = email
        self.isAdmin = isAdmin
        self.phone = phone
        self.tickets = [Int]()
    }
}
