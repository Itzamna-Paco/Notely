//
//  ViewController.swift
//  Notely
//
//  Created by Francisco Nieto
//  MIT License
// This class is the home screen. You can sptring forth and see all the notelies you have made, or create a new one. I chose to load the New Notely programatically in a Popover, instead of using the storyboard.

import UIKit
import CoreData

class ViewController: UIViewController , UIPopoverControllerDelegate, DismissPopoverWithNote{
    var objects = NSMutableArray()
    
    @IBAction func enterNewNote(sender: AnyObject) {
        
        println("_____POP!")
        
        let vc = PopoverVC()
        
        //present the popover by setting style, setting the content viewcontroleler and setting the size
        vc.modalPresentationStyle = .Popover
        let aPopover = UIPopoverController(contentViewController: vc)
        
        vc.delegate = self
        
        let popRect = CGRectMake(20, 60, 100, 200)
        aPopover.setPopoverContentSize(CGSizeMake(100, 200), animated: true)
        aPopover.presentPopoverFromRect(popRect, inView: view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func didEnterNote(aNotely:Notely) {
        
        
        println("did Enter this notely : \(aNotely.description)")
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

