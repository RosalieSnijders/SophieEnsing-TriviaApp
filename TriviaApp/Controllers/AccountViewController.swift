//
//  AccountViewController.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 11-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AccountViewController: UIViewController {
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBAction func logOutAction(sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogIn")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Auth.auth().currentUser!
        accountLabel.text = currentUser.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
