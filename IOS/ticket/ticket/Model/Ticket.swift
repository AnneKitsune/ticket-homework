//
//  Ticket.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class Ticket {
    var id: Int?
    var title: String?
    var content: String?
    var createdAt: String?
    var closedBy: Int?
    var openedBy: Int?
    var closedAt: String?
    var priority: String?
    var forUser: Int?
    var ticketUpdates: [Int]
    
    static let priorities: [String] =  ["Critique", "Urgent", "Important"]
    
    static var Nil: Ticket {
        get {
            let ticket = Ticket()
            
            return ticket
        }
    }
    
    public init() {
        
        self.ticketUpdates = [Int]()
    }
    
    public static func buildFromParam(id: Int?, title: String?, content: String?, createdAt: String?, closedBy: Int?, openedBy: Int?, closedAt: String?, priority: String?, forUser: Int?) -> Ticket {
        let ticket = Ticket()
        ticket.id = id
        ticket.title = title
        ticket.content = content
        ticket.createdAt = createdAt
        ticket.closedAt = closedAt
        ticket.openedBy = openedBy
        ticket.closedBy = closedBy
        ticket.priority = priority
        ticket.forUser = forUser
        
        return ticket
    }
    
    public static func buildFromJSON(json: AnyObject) -> Ticket {
        
        // Si le ticket n'a pas de id, de date de création, de client ou d'employé il y a un problème
        guard let id = json["id"] as? String, let createdAt = json["createdAt"] as? String, let userFor = json["userFor"] as? String, let openedBy = json["userOpenedBy"] as? String
            else{
            return Ticket.Nil
        }
        let ticket = Ticket()
        ticket.id = Int(id)
        ticket.createdAt = createdAt
        ticket.forUser = Int(userFor)
        ticket.openedBy = Int(openedBy)
        
        if let title = json["title"] as? String {
            ticket.title = title
        }
        
        if let content = json["content"] as? String {
            ticket.content = content
        }
        
        if let closedAt = json["closedAt"] as? String {
            ticket.closedAt = closedAt
        }
        
        if let closedBy = json["userClosedBy"] as? String {
            ticket.closedBy = Int(closedBy)
        }
        
        if let priority = json["priority"] as? String {
            ticket.priority = priority
        }
        
        if let ticketUpdates = json["ticketUpdates"] as? [String] {
            for ticketUpdate in ticketUpdates {
                ticket.ticketUpdates.append(Int(ticketUpdate)!)
            }
        }
        
        return ticket
    }
    
}
