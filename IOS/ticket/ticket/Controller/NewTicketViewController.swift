//
//  NewTicketViewController.swift
//  ticket
//
//  Created by admin on 5/9/18.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import UIKit

class NewTicketViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var userPicker: UIPickerView = UIPickerView()
    var priorityPicker: UIPickerView = UIPickerView()
    
    
    @IBOutlet weak var priority: UITextField!
    @IBOutlet weak var openedFor: UITextField!
    @IBOutlet weak var openedAt: UITextField!
    @IBOutlet weak var content: UITextView!
    
    @IBOutlet weak var titletf: UITextField!
    
    var users: [User] = [User]()
    var user: User = User.Nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        let result = formatter.string(from: date)
        openedAt.text = result
        
        priorityPicker.dataSource = self
        priorityPicker.delegate = self
        priorityPicker.tag = 1
        priority.inputView = priorityPicker
        
        userPicker.dataSource = self
        userPicker.delegate = self
        userPicker.tag = 2
        openedFor.inputView = userPicker
        
        users = Repository.shared().clients
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        // TODO: Update restriction
        let ticket = Ticket(id: 0, title: (titletf?.text)!, content: (content?.text)!, createdAt: openedAt.text!, closedBy: nil, openedBy: 2, closedAt: nil, priority: priority.text!, forUser: user.id)
        Repository.shared().tickets.append(ticket)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketNavController") as! UINavigationController
        present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        if pickerView == priorityPicker {
            return Ticket.priorities.count
            
        } else if pickerView == userPicker{
            return users.count
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView == priorityPicker {
            return Ticket.priorities[row]
            
        } else if pickerView == userPicker{
            return users[row].fullname
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == priorityPicker {
            priority.text = Ticket.priorities[row]
            self.view.endEditing(false)
        } else if pickerView == userPicker{
            openedFor.text = users[row].fullname
            user = users[row]
            self.view.endEditing(false)
        }
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
