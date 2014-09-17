//
//  CollectionCell.swift
//  Notely
//
//  Created byFrancisco Nieto on 9/15/14.
//  MIT LICENSE
//


import Foundation
import UIKit


class CollectionCell: UICollectionViewCell {
    
    
    @IBOutlet var didMasterSwitch: UISwitch!
    
    @IBOutlet var cellTitle: UILabel!
    
    @IBOutlet var cellContent: UITextView!
    
    @IBOutlet var cellDate: UILabel!
}
