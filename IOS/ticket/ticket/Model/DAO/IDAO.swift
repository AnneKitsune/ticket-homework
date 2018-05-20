//
//  IDAO.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation
public protocol IDAO {
    var tickets: [Ticket]{get}
    var openedTicket: [Ticket] {get}
    var closedTicket: [Ticket] {get}
    
    var users: [User] {get}
    var clients: [User] {get}
    var workers: [User] {get}
    
    func getTicketsForCustomer(customerId: Int) -> [Ticket]
    func getTicketsByEmployee(employeeId: Int) -> [Ticket]
    func getTicketUpdateByTicket(ticketId: Int) -> [TicketUpdate]
    func getTicketById(ticketId: Int) -> Ticket
    
}
