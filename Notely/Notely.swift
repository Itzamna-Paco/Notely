//
//  Notely.swift
//  Notely
//
//  Created by L Mirella Rangel on 9/15/14.
//  Copyright (c) 2014 L Mirella Rangel. All rights reserved.
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
