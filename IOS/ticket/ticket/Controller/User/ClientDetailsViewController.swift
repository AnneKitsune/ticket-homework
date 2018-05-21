//
//  ClientDetailsViewController.swift
//  ticket
//
//  Created by Alexis on 2018-05-20.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import UIKit

class ClientDetailsViewController: UIViewController {

    @IBOutlet weak var clientFullName: UILabel!
    @IBOutlet weak var clientEmail: UILabel!
    @IBOutlet weak var clientPhone: UILabel!
    @IBOutlet weak var showTickets: UIButton!
    
    var client: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = client {
            if let fullname = user.fullname {
                clientFullName.text = fullname
            }
            
            if let email = user.email {
                clientEmail.text = email
            }
            
            if let phone = user.phone {
                clientPhone.text = phone
            }
            
            if user.tickets.count > 0 {
                showTickets.setTitle("See all \(user.tickets.count) opened tickets", for: .normal)
                showTickets.isEnabled = true
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showTickets(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
