//
//  MMTestRunner.h
//  CodeEuropeExample
//
//  Created by Marek Mościchowski on 07.10.2016.
//  Copyright © 2016 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMTestRunner : NSObject
@property(nonatomic, strong) NSMutableArray *bundles;
- (NSArray *)runTests:(NSString *)bundle;
+ (NSArray<NSString *> *)bundles;
@end
