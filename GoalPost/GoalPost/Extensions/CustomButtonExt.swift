//
//  CustomButtonExt.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 25/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//

import UIKit

extension UIButton {
    
    func makeSelection() {
        layer.backgroundColor = #colorLiteral(red: 0.7085897021, green: 0.1491638322, blue: 0.261334277, alpha: 1)
    }
    
    func makeDeselection() {
        layer.backgroundColor = #colorLiteral(red: 0.7085897021, green: 0.1491638322, blue: 0.261334277, alpha: 0.5)
    }
}
