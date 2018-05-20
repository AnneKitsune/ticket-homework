//
//  InMemoryDAO.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation
public class InMemoryDAO: IDAO {
    public var tickets: [Ticket]{
        get{
            var local: [Ticket] = [Ticket]()
            
            local.append(Ticket.buildFromParam(id: 1, title: "Create a new language", content: "Create a new language for the only purpose to force programmers to change their coding habit. We will probably be able to force people to pay for this", createdAt: "2017-01-01", closedBy: nil, openedBy: users[1].id, closedAt: nil, priority: "Critique", forUser: users[0].id))
            local.append(Ticket.buildFromParam(id: 2, title: "Upgrade our last language with useful feature", content: "User are requesting better and more content for their new forced favorite language", createdAt: "2018-01-01", closedBy: nil, openedBy: users[1].id, closedAt: nil, priority: "Important", forUser: users[2].id))
            
            return local
        }
        
    }
    public var openedTicket: [Ticket] {
        get{
            return tickets.filter{
                return $0.closedAt == nil
            }
        }
    }
    
    public var closedTicket: [Ticket] {
        get {
            return tickets.filter {
                return $0.closedAt != nil
            }
        }
    }
    
    public var users: [User] {
        get{
            var local: [User] = [User]()
            
            local.append(User.buildFromParam(id: 1, fullname: "Steve Jobs", password: nil, email: "Stevejobs@apple.com", isAdmin: false, phone: "1234567891"))
            local.append(User.buildFromParam(id: 2, fullname: "Lotfi Derbali", password: "test", email: "lderbali@apple.com", isAdmin: true, phone:"5143714773"))
            local.append(User.buildFromParam(id: 3, fullname: "Steve wozniak", password: nil, email:"stevewozniak@apple.com", isAdmin: false, phone: "9876543219"))
            
            return local
        }
    }
    
    private var ticketUpdates: [TicketUpdate] {
        get {
            var local: [TicketUpdate] = [TicketUpdate]()
            
            local.append(TicketUpdate.buildFromParam(id: 1, ticket: 1, content: "It would be awesome", user: 1, createdAt: "18/05/2018"))
            local.append(TicketUpdate.buildFromParam(id: 2, ticket: 1, content: "It would be awesome", user: 2, createdAt: "18/05/2018"))
            local.append(TicketUpdate.buildFromParam(id: 3, ticket: 1, content: "It would be awesome", user: 3, createdAt: "18/05/2018"))
            local.append(TicketUpdate.buildFromParam(id: 4, ticket: 2, content: "It would be awesome", user: 2, createdAt: "18/05/2018"))
            local.append(TicketUpdate.buildFromParam(id: 5, ticket: 2, content: "It would be awesome", user: 3, createdAt: "18/05/2018"))
            
            return local
        }
    }
    
    public var clients: [User] {
        get {
            return users.filter {
                return $0.password == nil
            }
        }
    }
    public var workers: [User] {
        get{
            return users.filter {
                return $0.password != nil
            }
        }
    }
    
    public func getTicketsForCustomer(customerId: Int) -> [Ticket] {
        return tickets.filter{
            return $0.forUser == customerId
        }
    }
    
    public func getTicketsByEmployee(employeeId: Int) -> [Ticket] {
        return tickets.filter{
            return $0.openedBy == employeeId
        }
    }
    
    public func getTicketUpdateByTicket(ticketId: Int) -> [TicketUpdate] {
        return ticketUpdates.filter {
            return $0.ticket == ticketId
        }
    }
    
    public func getTicketById(ticketId: Int) -> Ticket {
        if let ticket =  tickets.first(where: { $0.id == ticketId }) {
            return ticket
        }
        return Ticket.Nil
    }
    
    public init() {}
}
