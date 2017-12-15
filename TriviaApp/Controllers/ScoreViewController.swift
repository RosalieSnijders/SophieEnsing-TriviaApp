//
//  ScoreViewController.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 15-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import UIKit
import Firebase

class ScoreViewController: UITableViewController {
    var scoreList = [Score]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference().child("userScores")
        
        ref.observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.scoreList = []
                for scores in snapshot.children.allObjects as! [DataSnapshot] {
                    let scoreObject = scores.value as? [String: AnyObject]
                    let email = scoreObject?["email"]
                    let id = scoreObject?["id"]
                    let score = scoreObject!["score"]
                    
                    let scoreToBeAdded = Score(id: id as! String?, email: email as! String?, score: score as! Int?)
                    
                    self.scoreList.append(scoreToBeAdded)
                }
                self.scoreList.sort { $0.score! > $1.score! }
                self.tableView.reloadData()
            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return scoreList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! CellTableViewCell
        let score: Score
        score = scoreList[indexPath.row]
    
        cell.userName.text = score.email
        cell.userScore.text = String(describing: score.score!)
        
        return cell
    }
}

