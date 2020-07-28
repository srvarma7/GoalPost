//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 24/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchGoals { (status) in
            if status {
                if goals.count > 0 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
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
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GoalCell else {
            return GoalCell()
        }
        cell.updateCell(desc: goals[indexPath.row].desc!, type: goals[indexPath.row].type!, progress: String(goals[indexPath.row].progress))
        return cell
    }
}

extension GoalsVC {
    
    func fetchGoals(completion: (_ finish: Bool) -> ()) {
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        do {
            goals = try context.fetch(request)
            completion(true)
        } catch {
            debugPrint("Error \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
