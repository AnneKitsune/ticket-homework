//
//  TicketUpdate.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class TicketUpdate {
    var id: Int
    var ticket: Int
    var content: String
    var user: Int
    var createdAt: String
    
    public init(id: Int, ticket: Int, content: String, user: Int, createdAt: String) {
        self.id = id
        self.ticket = ticket
        self.content = content
        self.user = user
        self.createdAt = createdAt
    }
}
