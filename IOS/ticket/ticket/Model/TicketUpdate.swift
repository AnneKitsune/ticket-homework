//
//  TicketUpdate.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class TicketUpdate {
    var id: Int?
    var ticket: Int?
    var content: String?
    var user: Int?
    var createdAt: String?
    
    static var Nil: TicketUpdate {
        get {
            let ticketUpdate = TicketUpdate.buildFromParam(id: 0, ticket: 0, content: "NotFound", user: 0, createdAt: "")
            
            return ticketUpdate
        }
    }
    
    public init() {
    }
    
    public static func buildFromJSON() -> TicketUpdate {
        let ticketUpdate = TicketUpdate()
        return ticketUpdate
    }
    
    public static func buildFromParam(id: Int?, ticket: Int?, content: String?, user: Int?, createdAt: String?) -> TicketUpdate {
        
        let ticketUpdate = TicketUpdate()
        
        ticketUpdate.id = id
        ticketUpdate.ticket = ticket
        ticketUpdate.content = content
        ticketUpdate.user = user
        ticketUpdate.createdAt = createdAt
        
        return ticketUpdate
    }
}
