//
//  CustomUIViewControllerTransition.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 25/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentCreateGoalVC(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: false, completion: nil)
    }
    
    func dismissCreateGoalVC(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
