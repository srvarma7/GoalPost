//
//  FinishVC.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 25/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class FinishVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var pointsLbl: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    var goalDes: String!
    var type: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pointsLbl.keyboardType = .numberPad
        pointsLbl.inputAccessoryView = createBtn
    }
    
    func initialiseVariables(desc: String, type: GoalType) {
        self.goalDes = desc
        self.type = type
    }
    
    @IBAction func onCreateTapped(_ sender: Any) {
        if pointsLbl.text != "" {
            guard let context = appDelegate?.persistentContainer.viewContext else { return }
            let goal = Goal()
            goal.desc = goalDes
            goal.type = type.rawValue
            goal.completionValue = Int32(pointsLbl.text!)!
            goal.progress = Int32(0)
            do {
                try context.save()
            } catch {
                debugPrint(error.localizedDescription)
            }
            
        }
    }
    
    @IBAction func onBackBtnTapped(_ sender: Any) {
        guard let goalsVC = storyboard?.instantiateViewController(withIdentifier: "Create") else { return }
        dismissCreateGoalVC(goalsVC)
    }
    
    // MARK: - Navigation

}
