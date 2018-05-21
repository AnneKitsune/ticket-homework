//
//  TicketDetailViewController.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import UIKit

class TicketDetailViewController: UIViewController {

    var ticket: Ticket!
    
    @IBOutlet weak var ticketTitle: UILabel!
    @IBOutlet weak var ticketContent: UILabel!
    @IBOutlet weak var ticketOpenedAt: UILabel!
    @IBOutlet weak var ticketOpenedFor: UIButton!
    @IBOutlet weak var ticketOpenedBy: UILabel!
    @IBOutlet weak var ticketClosedAt: UILabel!
    @IBOutlet weak var ticketClosedBy: UILabel!
    @IBOutlet weak var ticketPriority: UILabel!
    @IBOutlet weak var closeTicketButton: UIButton!
    @IBOutlet weak var showTicketUpdatesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ticketContent.numberOfLines = 0
        
        if let title = ticket.title {
            ticketTitle.text = title
        }
        
        if let content = ticket.content {
            ticketContent.text = content
        }
        
        if let createdAt = ticket.createdAt {
            ticketOpenedAt.text = "Ticket opened at \(createdAt)"
        }
 
        if let forUser = ticket.forUser {
            ticketOpenedFor.setTitle("Ticket opened for: \(forUser)", for: .normal)
        }
        
        if let openedBy = ticket.openedBy {
            ticketOpenedBy.text = "Ticket opened by: \(openedBy)"
        }
        
        if let priority = ticket.priority {
            ticketPriority!.text = priority
        }
        
        if AuthService.isAdmin() {
            closeTicketButton.isEnabled = true
        }
        
        if let closedAt = ticket.closedAt, let closedBy = ticket.closedBy {
            ticketClosedAt.text = "Closed at \(closedAt)"
            ticketClosedBy.text = "Closed by \(closedBy)"
            
            ticketClosedAt.isHidden = false
            ticketClosedBy.isHidden = false
            closeTicketButton.isHidden = true
            closeTicketButton.isEnabled = false
        }
        else {
            ticketClosedAt.isHidden = true
            ticketClosedBy.isHidden = true
            closeTicketButton.isHidden = false
        }
        
        showTicketUpdatesButton.setTitle("See all \(ticket.ticketUpdates.count) updates", for: .normal)
        
        if ticket.ticketUpdates.count > 0 {
            showTicketUpdatesButton.isEnabled = true
        }
        else {
            showTicketUpdatesButton.isEnabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeTicket(_ sender: Any) {
        Repository.shared().closeTicket(ticketId: ticket.id!)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showTicketUpdates(_ sender: Any) {
    }
    
    @IBAction func showClient(_ sender: Any) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if(identifier == "showClientSegue") {
            let destination = segue.destination as? ClientDetailsViewController
            let data = Repository.shared().getUser(userId: ticket.forUser!)
            destination?.client = data
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Unknown error", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
