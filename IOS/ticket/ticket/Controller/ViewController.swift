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
        let uname = usernameInput.text!
        let upassword = passwordInput.text!
        if !uname.isEmpty && !upassword.isEmpty {
            if uname == "admin" && upassword == "admin" {
                // TODO: Verify for valid credential
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabbarController") as! UITabBarController
                present(vc, animated: true, completion: nil)
                
            }
            else {
                let alert = UIAlertController(title: "Erreur", message: "Le nom d'utilisateur ou le mot de passe doivent être 'admin'", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "Erreur", message: "Le nom d'utilisateur ou le mot de passe doivent être remplis", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

