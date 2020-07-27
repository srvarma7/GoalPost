//
//  Goal+CoreDataProperties.swift
//  GoalPost
//
//  Created by Sai Raghu Varma Kallepalli on 26/7/20.
//  Copyright © 2020 Sai Raghu Varma Kallepalli. All rights reserved.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var desc: String?
    @NSManaged public var type: String?
    @NSManaged public var progress: Int32
    @NSManaged public var completionValue: Int32

}
