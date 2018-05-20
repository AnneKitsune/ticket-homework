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
    @IBOutlet weak var ticketContent: UITextView!
    @IBOutlet weak var ticketOpenedAt: UILabel!
    @IBOutlet weak var ticketOpenedFor: UILabel!
    @IBOutlet weak var ticketOpenedBy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ticketTitle.text = ticket.title
        ticketContent.text = ticket.content
        ticketOpenedAt.text = "Ticket opened at \(ticket.createdAt)"
        ticketOpenedFor.text = "Ticket opened for: \(ticket.forUser)"
        ticketOpenedBy.text = "Ticket opened by: \(ticket.openedBy)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
