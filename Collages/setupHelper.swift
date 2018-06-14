//
//  setupHelper.swift
//  Collages
//
//  Created by eyal keren on 20/07/2017.
//  Copyright © 2017 Ekaterina Belinskaya. All rights reserved.
//

import Foundation
import ROX
import ROXCore

class Account {
    public static func originCountry() -> String { return "DE" }
    public static func company() -> String { return "SAP" }
    public static func id() -> String { return "59ec7b65fc543f7a6517b581" }
}

@objc
class SetupHelper : NSObject{
    static func redirectSTDERR(to: String){
        let allPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory:String = allPaths.first!
        let pathForLog = documentsDirectory.appending("/\(to)")
        print("stderr is redirected to \(pathForLog)")
        freopen(pathForLog.cString(using: String.Encoding.ascii)!, "a+", stderr)
    }

    static func rolloutNetworkLoadFirstTime (){
        print("rolloutNetworkLoadFirstTime")
    }
    
    static func rolloutNetworkLoad (){
        print("rolloutNetworkLoad")
    }
    @objc static func setupROX(options options2: ROXOptions){

        ROX.register("", container: CollagesFlags.container)
       
        
        
        ROX.setCustomProperty(key: "user.reimbursement_country", value: { Account.originCountry() })
        ROX.setCustomProperty(key: "user.company", value: { Account.company() })
        ROX.setCustomProperty(key: "user.id", value: { Account.id() })
        

        
        
        ROX.setCustomProperty(key: "UserOptIn", value: {(flagName: String?) -> Bool in
            return UserDefaults.standard.bool(forKey: flagName!)
        })
        
        
        
        let options = RoxOptions()
        // options.defaultFreezeLevel = .none
        // options.defaultFreezeLevel = .untilLaunch
        options.defaultFreezeLevel = .untilForeground
        options.verbose = .debug
        options.impressionHandler = {flag, experiment in
            if (experiment != nil){
                print("flag \(flag.name!) value is \(flag.value!), it is part of '\(experiment!.name!)' experiment")
            } else {
                print("no experiment configured for flag \(flag.name!). default value \(flag.value!) was used")
            }
        }
        options.onConfigurationFetched = { result in
            print("result is \(result.fetcherStatus)")
        }
       
//        setenv("ROX_MODE", "localhost", 1);
//        setenv("ROX_DEV_MODE_SECRET", "a218d4227123487d2a65108c", 1);
        ROX.setup(withKey:"592a6ea410b09711e5956239", options: options );
        
        
        
    }
    
   
}

