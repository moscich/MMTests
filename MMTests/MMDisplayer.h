//
//  MMDisplayer.h
//  MMTests
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMDisplayer : NSObject

- (void)send:(NSString *)message completion:(void (^)())completion;
- (void)send:(NSInteger)passed failed:(NSInteger)failed completion:(void (^)())completion;

@end
