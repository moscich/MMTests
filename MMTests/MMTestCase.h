//
//  MMTestCase.h
//  CodeEuropeExample
//
//  Created by Marek Mościchowski on 09.10.2016.
//  Copyright © 2016 Marek Mościchowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MMAssertEqual(obj1, obj2) [MMTestCase AssertEqual:obj1 object:obj2 context:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]];

@interface MMTestCase : NSObject

+ (void)reset;
+ (NSArray *)report;

+ (void)AssertEqual:(NSObject *)obj1 object:(NSObject *)obj2 context:(NSString *)context;

@end
