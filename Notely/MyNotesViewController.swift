//
//  MyNotesViewController.swift
//  Notely
//
//  Created byFrancisco Nieto on 9/15/14.
//  MIT LICENSE
//

import Foundation
import UIKit
import CoreData



let reuseIdentifier = "Cell"

// our data sourceto hold each note
 

class MyNotesViewController: UICollectionViewController {
    
    //this array will hold our notelies
    
     var notelyArr : Array<AnyObject> = []
    
     var existingNotely:NSManagedObject! //this is used to check items in teh database to update
    
    
     override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notelyArr.count
        
        
    }
    
    override func viewDidAppear(animated: Bool){
        
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let fetchreq = NSFetchRequest(entityName: "Notely")
        
         notelyArr = context.executeFetchRequest(fetchreq, error: nil)!
        
        
      
        
        collectionView?.reloadData()
        
    }
    
    
    
 override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    let cell:CollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CollectionCell
    
    
    //let's get the data out of the array and into the cell
    
    var data: NSManagedObject = notelyArr[indexPath.row] as NSManagedObject
    
     cell.cellContent.text = data.valueForKeyPath("content") as? String
     cell.cellTitle.text = data.valueForKeyPath("title") as? String
    
    //get and format the date it was created...
    var dateToFormat = data.valueForKeyPath("timeCreated") as? NSDate
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    let dateToDisplay = dateFormatter.stringFromDate(dateToFormat!)
    
    cell.cellDate.text = dateToDisplay
    
    //if it's been previously mastered, then set switch to ON 
    if data.valueForKeyPath("mastered") as? Bool == true{
        
        cell.didMasterSwitch.setOn(true , animated: true )
        
    } else {
        
        cell.didMasterSwitch.setOn(false , animated: true )
        
    }
    
    //lets hide the switch until we implement the mastered feature...
    cell.didMasterSwitch.hidden = true
    
    
  
   
    return cell
    
    }
}
