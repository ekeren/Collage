//
//  AboutViewController.swift
//  Collages
//
//  Created by eyal keren on 28/05/2017.
//  Copyright © 2017 Ekaterina Belinskaya. All rights reserved.
//

import Foundation
import ROX
import ROXCore

@objc(AboutViewController)
class AboutViewController : AboutViewControllerBase{
    @IBAction func optOut(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "sendFeedback") //Bool
        self.sendEvent("hello");
    }
    @IBAction func optIn(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "sendFeedback") //Bool
        self.sendEvent("nice");
    }
    func sendEvent(_ eventName:String){
        if ROXFlags.container.eventWhiteList.value.components(separatedBy: ",").contains(eventName) {
            print("will send the event \(eventName)")
        }
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        ROXFlags.container.sendFeedbackForKiran.disabled {
            self.feedbackButton.isHidden = true
        }
        
        
        

        
        
        
        
        
        
        

        
        
        
        
        
            
    
        
        
        
        
        
        
        
        
        
        

       
    
        
    }
    
}
