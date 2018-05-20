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
    
    public var openedTicket: [Ticket]
    
    public var closedTicket: [Ticket]
    
    public var users: [User]
    
    public var clients: [User]
    
    public var workers: [User]
    
    public func getTicketsForCustomer(customerId: Int) -> [Ticket] {
        <#code#>
    }
    
    public func getTicketsByEmployee(employeeId: Int) -> [Ticket] {
        <#code#>
    }
    
    public func getTicketUpdateByTicket(ticketId: Int) -> [TicketUpdate] {
        <#code#>
    }
    
    public func getTicketById(ticketId: Int) -> Ticket {
        <#code#>
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
}
