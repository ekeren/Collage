//
//  CollageViewController.swift
//  Collages
//
//  Created by eyal keren on 28/05/2017.
//  Copyright © 2017 Ekaterina Belinskaya. All rights reserved.
//

import Foundation
import ROX


@objc(CollageViewController)
open class CollageViewController: CollageViewControllerBase{
    
    override open func addRightButtonItems() {
        ROXFlags.container.borderEditor.enabled({
            self.navigationItem.rightBarButtonItems = [self.addButton, self.moreButton];
        }) {
            self.navigationItem.rightBarButtonItems = [self.addButton];
        }
        
        
        
        
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
    }
    override open func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            // only open for QA and Developers (and product  ;) )
            self.navigationController!.pushViewController(ROX.flagsViewController(), animated: true)

        }
    }
    override open var canBecomeFirstResponder   : Bool{
        return true;
    }
    
    func followUp() {
        
        
        if self.checkTheLastResult() {
            // TODO: alert delegate we won
            let alertView = UIAlertView()
            alertView.title = "Victory"
            alertView.message = "You won!"
            alertView.addButton(withTitle: "Cancel")
            alertView.show()
            // TODO: At this point we should stall the game until the user taps 'New Game' (which hasn't been implemented yet)
            return
        }
        
        // Now, insert more tiles
        let randomVal = Int(arc4random_uniform(10))
        //m.insertTileAtRandomLocation(randomVal == 1 ? 4 : 2)
        
        // At this point, the user may lose
        if self.checkTheLastResult() {
            // TODO: alert delegate we lost
            print("You lost...")
            let alertView = UIAlertView()
            alertView.title = "Defeat"
            alertView.message = "You lost..."
            alertView.addButton(withTitle: "Cancel")
            alertView.show()
        }
    }
    func checkTheLastResult() -> Bool {
        return true
    }
    
}


