//
//  Repository.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class Repository {
    
    var tickets: [Ticket]
    var users: [User]
    
    var clients: [User] {
        get{
            return users.filter {
                return $0.password == nil
            }
        }
    }
    
    private static var sharedRepository: Repository = {
        let repository = Repository()
        
        repository.users.append(User(id: 1, fullname: "Steve Jobs", password: nil, email: "Stevejobs@apple.com", isAdmin: false, phone: "1234567891"))
        repository.users.append(User(id: 2, fullname: "Lotfi Derbali", password: "test", email: "lderbali@apple.com", isAdmin: true, phone:"5143714773"))
        repository.users.append(User(id: 3, fullname: "Steve wozniak", password: nil, email:"stevewozniak@apple.com", isAdmin: false, phone: "9876543219"))
        
        repository.tickets.append(Ticket(id: 1, title: "Create a new language", content: "Create a new language for the only purpose to force programmers to change their coding habit. We will probably be able to force people to pay for this", createdAt: "2017-01-01", closedBy: nil, openedBy: repository.users[1].id, closedAt: nil, priority: "Critique", forUser: repository.users[0].id))
        repository.tickets.append(Ticket(id: 2, title: "Upgrade our last language with useful feature", content: "User are requesting better and more content for their new forced favorite language", createdAt: "2018-01-01", closedBy: nil, openedBy: repository.users[1].id, closedAt: nil, priority: "Important", forUser: repository.users[2].id))
        
        return repository
    }()
    
    private init() {
        tickets = [Ticket]()
        users = [User]()
    }
    
    class func shared() -> Repository {
        return sharedRepository
    }
}
