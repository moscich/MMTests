//
//  MMTestResult.h
//  MMTests
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMTestResult : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) BOOL passed;

@end
