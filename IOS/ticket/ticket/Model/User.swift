//
//  User.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class User {
    var id: Int?
    var fullname: String?
    var password: String?
    var email: String?
    var isAdmin: Bool?
    var phone: String?
    var tickets: [Int]
    
    static var Nil: User {
        get {
            let user = User.buildFromParam(id: 0, fullname: "Not found", password: "", email: "", isAdmin: false, phone: "")
            return user
        }
    }
    
    public init() {
        tickets = []
    }
    
    public static func buildFromJSON(json: String) -> User {
        let user = User()
        
        return user
    }
    
    public static func buildFromParam(id: Int?, fullname: String?, password: String?, email: String?, isAdmin: Bool?, phone: String?) -> User {
        let user = User()
        user.id = id
        user.fullname = fullname
        user.isAdmin = isAdmin
        user.password = password
        user.phone = phone
        user.email = email
        return user
    }
    
    public static func buildFromParam(id: Int?, fullname: String?, password: String?, email: String?, isAdmin: Bool?, phone: String?, tickets: [Int]) -> User {
        let user = User()
        user.id = id
        user.fullname = fullname
        user.isAdmin = isAdmin
        user.password = password
        user.phone = phone
        user.email = email
        user.tickets = tickets
        return user
    }
}
