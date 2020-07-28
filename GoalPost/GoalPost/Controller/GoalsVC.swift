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
        fetchData()
    }
    
    func fetchData() {
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
    
    // MARK: - Create Goal tapped
    @IBAction func onAddingGoalTapped(_ sender: Any) {
        guard let newGoalVC = storyboard?.instantiateViewController(withIdentifier: "Create") else { return }
        presentVC(newGoalVC)
    }
    
}

// MARK:- Extension Table View
extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK:- Showing Goals
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
        cell.updateCell(goal: goals[indexPath.row])
        return cell
    }
    
    // MARK:- Editing (Delete and Prog)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            self.deleteGoal(atIndex: indexPath)
            self.goals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.fetchData()
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (row, index) in
            tableView.reloadRows(at: [index], with: .automatic)
            self.updateGoalProgress(atIndex: index)
            self.fetchData()
        }
        deleteAction.backgroundColor = .red
        addAction.backgroundColor = .orange
        
        return [deleteAction, addAction]
    }
}

// MARK:- Extension Core Data (CRD)
extension GoalsVC {
    
    func updateGoalProgress(atIndex: IndexPath) {
        guard let context = appDelegate?.persistentContainer.viewContext else { return }

        let chosenGoal = goals[atIndex.row]
        if chosenGoal.progress < chosenGoal.completionValue {
            chosenGoal.progress += 1
        } else {
            return
        }
        
        do {
            try context.save()
        } catch {
            debugPrint("Error updating \(error.localizedDescription)")
        }
    }
    
    func deleteGoal(atIndex: IndexPath) {
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        context.delete(goals[atIndex.row])
        
        do {
            try context.save()
        } catch {
            debugPrint("Error deleting \(error.localizedDescription)")
        }
    }
    
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
