//
//  GoalCell.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 24/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    
    @IBOutlet weak var goalLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var progress: UILabel!
    
    func updateCell(desc: String, type: String, progress: Int) {
        self.goalLbl.text = desc
        self.typeLbl.text = type
        self.progress.text = String(progress)        
    }
    
}
