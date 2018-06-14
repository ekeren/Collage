//
//  CollagesRemotes.swift
//  Collages
//
//  Created by eyal keren on 20/07/2017.
//  Copyright © 2017 Ekaterina Belinskaya. All rights reserved.
//

import Foundation
import ROX
import ROXCore

public enum Paying : Int {
    case Free, Low, Med, High
}

@objc
public class Container: NSObject, RoxContainer{


    public let eventWhiteList = RoxConfigurationString(defaultValue: "")


    public let borderEditor = RoxFlag(withDefault: true)
    public let templateShortList = RoxFlag(withDefault: false, freeze: .none)
    public let instagramSupport = RoxFlag()
    public let sendFeedbackForKiran = RoxFlag()
    public let pricingPlan12 = RoxEnumVariant(Paying.Free)
    public let someTexts = RoxConfigurationString(defaultValue: "Hi")
    public let borderWidth = RoxConfigurationString(defaultValue: "Border width")
    
    
}



@objc
public class ROXFlags: NSObject{
    
  

    @objc public static let container = Container()
}

