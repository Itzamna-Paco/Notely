//
//  Notely.swift
//  Notely
//
//  Created byFrancisco Nieto on 9/15/14.
//  MIT LICENSE
//

import Foundation
import UIKit
import CoreData

@objc(Notely)

class Notely:NSManagedObject {
    
    
    
    
    @NSManaged var title : String
    @NSManaged var content : String
    @NSManaged var timeCreated: NSDate
    @NSManaged var mastered : Bool
    
    
    
}
