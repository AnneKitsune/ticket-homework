//
//  UserTableTableViewController.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-04-29.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import UIKit

class TicketsTableViewController : UITableViewController {
    
    var tickets:[Ticket] = [Ticket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tickets = Repository.shared().tickets
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tickets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath)
        let index = indexPath.row
        let ticket = tickets[index]
        let content = "\(ticket.content.prefix(20))..."
        cell.textLabel?.text = ticket.title
        cell.detailTextLabel?.text = String(content)

        let color = cellColor(prior: ticket.priority)
        
        cell.backgroundColor = color
        
        return cell
    }
    
    private func cellColor(prior: String) -> UIColor {
        switch(prior) {
        case "Important":
            return UIColor.green
            
        case "Critique":
            return UIColor.red
            
        case "Urgent":
            return UIColor.yellow
            
        default: return UIColor.green
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as? UITableViewCell
        let index = tableView.indexPath(for: cell!)?.row
        let destination = segue.destination as? TicketDetailViewController
        let data = tickets[index!]
        destination?.ticket = data
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
