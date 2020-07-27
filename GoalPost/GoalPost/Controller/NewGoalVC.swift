//
//  NewGoalVC.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 25/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class NewGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalDesc: UITextView!
    @IBOutlet weak var longBtn: UIButton!
    @IBOutlet weak var shortBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .Longterm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goalDesc.delegate = self
        goalDesc.inputAccessoryView = nextBtn
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLongBtnTapped(_ sender: Any) {
        goalType = .Longterm
        longBtn.makeSelection()
        shortBtn.makeDeselection()
    }
    
    @IBAction func onShortBtnTapped(_ sender: Any) {
        goalType = .Shortterm
        shortBtn.makeSelection()
        longBtn.makeDeselection()
    }
    
    @IBAction func onNextTapped(_ sender: Any) {
        if goalDesc.text != "" && goalDesc.text != "What's your goal?" {
            guard let finishVC = storyboard?.instantiateViewController(withIdentifier: "finish") as? FinishVC else { return }
            finishVC.initialiseVariables(desc: goalDesc.text!, type: goalType)
            presentingViewController?.dismissAndPresentVC(finishVC)
        }
    }
    
    @IBAction func onBackBtnTapped(_ sender: Any) {
        dismissVC()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalDesc.text = ""
        goalDesc.textColor = .black
    }

}
