//
//  HttpDAO.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import Foundation
public class HttpDAO: IDAO {
    
    private let baseUrl: String = "http://raidable.ddns.net:8888/TicketBackend/api"
    private enum HTTP_METHOD: String {
        case POST = "POST"
        case GET = "GET"
    }
    
    public var tickets: [Ticket] {
        get {
            let request = createRequest(route: "/tickets/opened", method: .GET, parameter: nil)
            let session = URLSession.shared
            var tickets: [Ticket] = []
            var found: Bool = false
            let group = DispatchGroup()
            group.enter()
            session.dataTask(with: request) { (data, response, error) in
                if let result = data {
                    found = true
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: result, options: []) as? [AnyObject]
                        for ticket in json! {
                            let currentTicket = Ticket.buildFromJSON(json: ticket)
                            
                            tickets.append(currentTicket)
                        }
                    }catch {
                        found = false
                        group.leave()
                    }
                    
                }
            }.resume()
            group.wait()
            
            if found {
                return tickets
            }
            
            return []
        }
    }
    
    public var openedTicket: [Ticket] {
        get {
            return []
        }
    }
    
    public var closedTicket: [Ticket] {
        get {
            return []
        }
    }
    
    public var users: [User] {
        get {
            return []
        }
    }
    
    public var clients: [User] {
        get {
            return []
        }
    }
    
    public var workers: [User] {
        get {
            return []
        }
    }
    
    public func getTicketsForCustomer(customerId: Int) -> [Ticket] {
        return []
    }
    
    public func getTicketsByEmployee(employeeId: Int) -> [Ticket] {
        return []
    }
    
    public func getTicketUpdateByTicket(ticketId: Int) -> [TicketUpdate] {
        return []
    }
    
    public func getTicketById(ticketId: Int) -> Ticket {
        return Ticket.Nil
    }
    
    public func login(username: String, password: String) -> User? {
        return nil
    }
    
    public func createTicket(ticket: Ticket) {
        
    }
    
    public init() {}
    
    private func createRequest(route: String, method: HTTP_METHOD, parameter: [String:String]?) -> URLRequest {
        let urlString = "\(baseUrl)\(route)"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        if let params = parameter {
            do {
                let dataReq = try JSONSerialization.data(withJSONObject: params, options: [])
                request.httpBody = dataReq
            }
            catch{}
        }
        
        return request
    }
    
    public func closeTicket(ticketId: Int){
        
    }
    
    public func getUser(userId: Int) -> User {
        return User.Nil
    }
}
