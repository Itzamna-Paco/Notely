
//
//  PopoverVC.swift
//  SwiftLearn
//
//  Created byFrancisco Nieto on 9/15/14.
//  MIT LICENSE
//

import Foundation
import UIKit
import CoreData


protocol DismissPopoverWithNote{
    //func didEnterNote(aNote:String, aTitle:String, didMaster:Bool)
    func didEnterNote(aNotely:Notely)
}


class PopoverVC : UIViewController , UIPopoverControllerDelegate {
    var delegate: DismissPopoverWithNote?
    
    let dismissButton: UIButton  = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
    let textInputView = UITextView()
    
    let titleInputView = UITextField()
    
    
    //http://www.weheartswift.com/one-month-swift/
    
    
    
    
    func dismissMe(){
        
        
        var textToPass = textInputView.text
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //reference the mngd Obj. context
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Notely", inManagedObjectContext: contxt)
        
        //We'll need the date:
        var now: NSDate = NSDate()
        
        
        //save as  new Notely
        var newNotely = Notely(entity:ent!, insertIntoManagedObjectContext: contxt)
        
        //now let's map the notely properties:
        
        newNotely.content = textInputView.text
        newNotely.title = titleInputView.text
        newNotely.timeCreated = now
        newNotely.mastered = false
        
          println("New Notely : \(newNotely)")
        
        var error : NSError? = nil
        contxt.save(&error)
        
        //navigate back to the root vc
        
        
        
        
        
      //  println("passing Text from Popup : \(textToPass)")
        
        delegate?.didEnterNote(newNotely)
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   view.backgroundColor = UIColor(red: 0.2, green: 0.7, blue: 0.7, alpha: 0.2)
        
        
        
        textInputView.frame = CGRectMake(5,114, view.frame.size.width-20, 200)
        textInputView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
        
        //now build the title...
        titleInputView.frame = CGRectMake(5, 90, view.frame.size.width-20, 30)
        titleInputView.backgroundColor =  UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)

        
        view.addSubview(textInputView)
        view.addSubview(titleInputView)
        
        
        dismissButton.setTitle("Done", forState: .Normal)
        dismissButton.titleLabel?.textAlignment = .Left
        dismissButton.frame = CGRectMake(150, 45, 180, 30)
        dismissButton.addTarget(self, action: "dismissMe", forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        
    }
}
