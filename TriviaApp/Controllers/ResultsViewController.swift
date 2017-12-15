//
//  ResultsViewController.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 14-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import UIKit
import Firebase

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = Int()
    let ref: DatabaseReference! = Database.database().reference().child("userScores")
    let currentUser = Auth.auth().currentUser!

    func addScore() {
        let key = ref.childByAutoId().key
        let userData: [String: Any] = ["id": key,
                                       "email": currentUser.email!,
                                       "score": self.result]
        ref.child(key).setValue(userData)
    }
    
    override func viewDidLoad() {
        addScore()
        super.viewDidLoad()
        resultLabel.text = "You have scored \(result) points!"
        navigationItem.hidesBackButton = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
