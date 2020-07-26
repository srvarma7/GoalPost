//
//  FinishVC.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 25/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

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
        
    }
    
    @IBAction func onBackBtnTapped(_ sender: Any) {
        guard let goalsVC = storyboard?.instantiateViewController(withIdentifier: "Create") else { return }
        dismissCreateGoalVC(goalsVC)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
