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
    
    @IBOutlet weak var compView: UIView!
    @IBOutlet weak var compLbl: UILabel!
    
    func updateCell(goal: Goal) {
        self.goalLbl.text = goal.desc
        self.typeLbl.text = goal.type
        self.progress.text = String(goal.progress)
        
        if goal.progress == goal.completionValue {
            compView.isHidden = false
            bringSubviewToFront(compLbl)
        } else {
            compView.isHidden = true

        }
    }
    
}
