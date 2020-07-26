//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 24/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    // MARK: - Goal button tapped
    @IBAction func onAddingGoalTapped(_ sender: Any) {
        guard let newGoalVC = storyboard?.instantiateViewController(withIdentifier: "Create") else { return }
        presentVC(newGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GoalCell else {
            return GoalCell()
        }
        cell.updateCell(desc: "sa", type: .Longterm, progress: 3)
        return cell
    }
}
