
//
//  ROXExperiment.h
//  ROX
//
//  Created by Elad Cohen on 4/24/17.
//  Copyright © 2017 DeDoCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ROXExperiment : NSObject

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSString* identifier;
@property (nonatomic, readonly) BOOL isArchived;

-(instancetype)initWithName:(NSString*)name identifier:(NSString*)identifier isArchived:(BOOL) isArchived;

@end
