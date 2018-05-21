//
//  AuthService.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation
class AuthService {
   
    private static var currentUser: User?
    
    public static func login(username: String, password: String) -> Bool {
        let repo = Repository.shared()
        if let user = repo.login(username: username, password: password) {
            currentUser = user
            return true
        }
        
        return false
    }
    
    public static func getUser() -> User? {
        return currentUser
    }
    
    public static func isAdmin() -> Bool {
        guard let isAdmin = currentUser?.isAdmin else {
            return false
        }
        return isAdmin
    }
    
    public static func logout() {
        currentUser = nil
    }
}
