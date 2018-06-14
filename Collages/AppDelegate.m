//
//  AppDelegate.m
//  Collages
//
//  Created by Ekaterina Belinskaya on 12/03/15.
//  Copyright (c) 2015 Ekaterina Belinskaya. All rights reserved.
//

#import "AppDelegate.h"
#import <ROXCore/ROXCore.h>
#import "Collages-Swift.h"

#import "Collages-Swift.h"





@interface Account : NSObject
@end
@implementation Account

+(BOOL) isPaying{
    return NO;
}
+(NSString*) email{
    return @"a@rollout.io";
}
+(NSString*) userId{
    return @"592a6ea410b09711e595623a";
}

@end
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // Option 1: (for loading the state of flags on startup)
    // This method is called after all data is loaded from ROX (rollout backend)
    // --> only load your intial view contoller after this has happended
//    options.syncCompletionHandler = ^(ROXMetadata * _Nonnull metadata) {
//        NSMutableDictionary *tmp = @{}.mutableCopy;
//        for (ROXTargetGroup *t in metadata.targetGroups){
//            NSLog(@"%@:%@", t.name, t.isEnabled ? @"in" : @"out");
//        }
//        for (ROXFlag* f in metadata.flags) {
//            NSLog(@"%@:%@", f.name, f.isEnabled ? @"in" : @"out");
//        }
//        for (ROXExperiment* e in metadata.experiments){
//            [e ]
//            NSLog(@"%@:%@", e.name, e.isEnabled ? @"enabled" : @"out");
//            tmp[[NSString stringWithFormat:@"ROX.%@" , e.name]] = e.isEnabled ? @"in" : @"out";
//
//        }
//        Mixpanel *mixpanel = [Mixpanel sharedInstance];
//        [mixpanel track:@"Game Started"
//             properties:tmp];
//    };
    
    // Option 2: (for loading the state of flags on startup)
    // while building the app the xcode will fetch the latest expriments configuration, so it will be shipped with your app
    // --> Have default behavior shipped inside the IPA (or APK for android)
    
    
    [ROX setCustomComputedStringProperty:^NSString*(NSString* flagName){
        return [Account email];
    } forKey:@"email"];
    
    
    
    [ROX setCustomComputedStringProperty:^NSString*(NSString* flagName){
        return [Account userId];
    } forKey:@"user_id"];
    
    
    [ROX setCustomComputedStringProperty:^NSString*(NSString* flagName){
        return @"123344";
    } forKey:@"zipcode"];

    
    
    [ROX setCustomComputedStringProperty:^NSString*(NSString* flagName){
        return @"something";
    } forKey:@"groups"];
    // the Data will not get out for Rollout, it is inside the device
    // The device calculate the data to determine if it is part of Target Group
    
    [ROX setCustomStringProperty:@"devleopement" forKey:@"env"];
    
    [ROX setCustomComputedBooleanProperty:^BOOL(NSString* flagName){
        return [Account isPaying];
    } forKey:@"paying"];
//    options.proxy = ^NSString * _Nonnull(ROXProxyInfo * _Nonnull proxyInfo) {
//        NSString *s = [NSString stringWithFormat:@"%@%@?anticache=%d", proxyInfo.staticPrefix, proxyInfo.dynamicPart, rand()];
//        return s;
//    };

    id f  = [ROX flagsViewController];
    NSLog(@"%@", f);
    ROXOptions* options = [[ROXOptions alloc] init];
    options.impressionHandler =^(ROXReportingValue * _Nonnull reporting, ROXExperiment * _Nullable experiment) {
        if (experiment){
            NSLog(@"flag %@ value is %@, it is part of '%@' experiment",reporting.name, reporting.value, experiment.name);
        } else {
            NSLog(@"no experiment configured for flag %@. default value %@ was used", reporting.name, reporting.value);
        }
    };
    
    [SetupHelper setupROXWithOptions:options];
    
    
    
    
    
//    [ROX sync]; // usually called after your customer does a login - so the email and other details get updated
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
