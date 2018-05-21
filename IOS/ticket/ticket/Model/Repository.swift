//
//  Repository.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-05-05.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation

public class Repository {
    
    var currentDAO: IDAO
    
    public var tickets: [Ticket] {
        get{
            return currentDAO.tickets
        }
    }
    public var openedTickets: [Ticket] {
        get {
            return currentDAO.openedTicket
        }
    }
    public var closedTickets: [Ticket] {
        get{
            return tickets.filter {
                return $0.closedAt != nil
            }
        }
    }
    
    
    public var users: [User] {
        get {
            return currentDAO.users
        }
    }
    public var clients: [User] {
        get{
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
    
    func getTicketsForCustomer(customerId: Int) -> [Ticket] {
        return currentDAO.getTicketsForCustomer(customerId: customerId)
    }
    func getTicketsByEmployee(employeeId: Int) -> [Ticket] {
        return currentDAO.getTicketsByEmployee(employeeId: employeeId)
    }
    func getTicketUpdateByTicket(ticketId: Int) -> [TicketUpdate] {
        return currentDAO.getTicketUpdateByTicket(ticketId: ticketId)
    }
    func getTicketById(ticketId: Int) -> Ticket {
        return currentDAO.getTicketById(ticketId: ticketId)
    }
    
    func login(username: String, password: String) -> User? {
        return currentDAO.login(username: username, password: password)
    }
    
    func createTicket(ticket: Ticket) {
        currentDAO.createTicket(ticket: ticket)
    }
    
    func closeTicket(ticketId: Int) {
        currentDAO.closeTicket(ticketId: ticketId)
    }
    
    func getUser(userId: Int) -> User {
        return currentDAO.getUser(userId: userId)
    }
    
    private static var sharedRepository: Repository = {
        let repository = Repository()
        
        return repository
    }()
    
    private init() {
        currentDAO = InMemoryDAO()
    }
    
    class func shared() -> Repository {
        return sharedRepository
    }
}
