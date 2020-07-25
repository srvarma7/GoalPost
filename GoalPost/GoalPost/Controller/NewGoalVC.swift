//
//  NewGoalVC.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 25/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class NewGoalVC: UIViewController {

    @IBOutlet weak var goalDesc: UITextView!
    @IBOutlet weak var longBtn: UIButton!
    @IBOutlet weak var shortBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLongBtnTapped(_ sender: Any) {
    }
    
    @IBAction func onShortBtnTapped(_ sender: Any) {
    }
    
    @IBAction func onNextTapped(_ sender: Any) {
    }
    
    @IBAction func onBackBtnTapped(_ sender: Any) {
        guard let goalsVC = storyboard?.instantiateViewController(withIdentifier: "Goals") else { return }
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
