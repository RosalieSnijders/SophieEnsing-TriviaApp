//
//  CellTableViewCell.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 15-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
