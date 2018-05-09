//
//  Ticket.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class Ticket {
    var id: Int
    var title: String
    var content: String
    var createdAt: String
    var closedBy: Int?
    var openedBy: Int
    var closedAt: String?
    var priority: String
    var forUser: Int
    var ticketUpdates: [TicketUpdate]
    
    static let priorities: [String] =  ["Critique", "Urgent", "Important"]
    
    
    public init(id: Int, title: String, content: String, createdAt: String, closedBy: Int?, openedBy: Int, closedAt: String?, priority: String, forUser: Int) {
        self.id = id
        self.title = title
        self.content = content
        self.createdAt = createdAt
        self.closedAt = closedAt
        self.openedBy = openedBy
        self.closedBy = closedBy
        self.priority = priority
        self.forUser = forUser
        self.ticketUpdates = [TicketUpdate]()
    }
    
}
