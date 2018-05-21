//
//  InMemoryDAO.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation
public class InMemoryDAO: IDAO {
    private var _tickets: [Ticket] = []
    public var tickets: [Ticket]{
        get{
            
            if _tickets.count == 0 {
                _tickets.append(Ticket.buildFromParam(id: 1, title: "Create a new language", content: "Create a new language for the only purpose to force programmers to change their coding habit. We will probably be able to force people to pay for this", createdAt: "2017-01-01", closedBy: nil, openedBy: users[1].id, closedAt: nil, priority: "Critique", forUser: users[0].id, ticketUpdates: [1,2,3]))
                _tickets.append(Ticket.buildFromParam(id: 2, title: "Upgrade our last language with useful feature", content: "User are requesting better and more content for their new forced favorite language", createdAt: "2018-01-01", closedBy: nil, openedBy: users[1].id, closedAt: nil, priority: "Important", forUser: users[2].id, ticketUpdates: [4,5]))
            }
            return _tickets
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
    
    private var _users: [User] = []
    public var users: [User] {
        get{
            if _users.count == 0 {
                _users.append(User.buildFromParam(id: 1, fullname: "Steve Jobs", password: nil, email: "Stevejobs@apple.com", isAdmin: false, phone: "1234567891", tickets: [1]))
                _users.append(User.buildFromParam(id: 2, fullname: "Lotfi Derbali", password: "test", email: "lderbali@apple.com", isAdmin: true, phone:"5143714773", tickets: []))
                _users.append(User.buildFromParam(id: 3, fullname: "Steve wozniak", password: nil, email:"stevewozniak@apple.com", isAdmin: false, phone: "9876543219", tickets: [2]))
            }
            return _users
        }
    }
    
    private var _ticketUpdates: [TicketUpdate] = []
    private var ticketUpdates: [TicketUpdate] {
        get {
            if _ticketUpdates.count == 0 {
            
                _ticketUpdates.append(TicketUpdate.buildFromParam(id: 1, ticket: 1, content: "It would be awesome", user: 1, createdAt: "18/05/2018"))
                _ticketUpdates.append(TicketUpdate.buildFromParam(id: 2, ticket: 1, content: "It would be awesome", user: 2, createdAt: "18/05/2018"))
                _ticketUpdates.append(TicketUpdate.buildFromParam(id: 3, ticket: 1, content: "It would be awesome", user: 3, createdAt: "18/05/2018"))
                _ticketUpdates.append(TicketUpdate.buildFromParam(id: 4, ticket: 2, content: "It would be awesome", user: 2, createdAt: "18/05/2018"))
                _ticketUpdates.append(TicketUpdate.buildFromParam(id: 5, ticket: 2, content: "It would be awesome", user: 3, createdAt: "18/05/2018"))
            }
            
            return _ticketUpdates
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
    
    public func login(username: String, password: String) -> User? {
        if username == "admin" && password == "admin" {
            return User.buildFromParam(id: 0, fullname: "Test user", password: "none", email: "testuser@test.com", isAdmin: true, phone: "555555555")
        }
        
        return nil
    }
    
    public func createTicket(ticket: Ticket) {
        _tickets.append(ticket)
    }
    
    public func closeTicket(ticketId: Int) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        let result = formatter.string(from: date)
        
        if let ticket = _tickets.first(where: { $0.id == ticketId }) {
            ticket.closedAt = result
            ticket.closedBy = AuthService.getUser()?.id
        }
    }
    
    public func getUser(userId: Int) -> User {
        if let user = _users.first(where: {$0.id == userId}) {
            return user
        }
        else {
            return User.Nil
        }
    }
    
    public init() {}
}
