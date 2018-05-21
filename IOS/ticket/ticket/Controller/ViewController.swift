//
//  ViewController.swift
//  ticket
//
//  Created by Alexis Diamond on 2018-04-28.
//  Copyright © 2018 Alexis Diamond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let LOGIN_URL = "" // TODO: Supply a valid url
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectButton.backgroundColor = UIColor(red: 182/255, green: 236/255, blue: 249/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onConnect(_ sender: Any) {
        
        let alert = UIAlertController(title: "Error", message: "Either username or password are incorrect", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        guard let username = usernameInput.text else {
            alert.title = "Username must not be empty"
            present(alert, animated: true, completion: nil)
            return
        }
        guard let password = passwordInput.text else {
            alert.title = "Password must not be empty"
            present(alert, animated: true, completion: nil)
            return
        }
        
        let correctLogin = AuthService.login(username: username, password: password)
        
        if correctLogin {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as! UITabBarController
            present(vc, animated: true, completion: nil)
        }
        else {
            present(alert, animated: true, completion: nil)
        }
    }
}

