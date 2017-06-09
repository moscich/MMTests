//
//  MMTestResult.m
//  MMTests
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

#import "MMTestResult.h"

@implementation MMTestResult

- (NSString *)description {
  NSString *passedString = self.passed ? @"Passed" : @"Failed";
  return [NSString stringWithFormat:@"%@ %@",self.name, passedString];
}

- (NSString *)debugDescription {
  NSString *passedString = self.passed ? @"Passed" : @"Failed";
  return [NSString stringWithFormat:@"%@ %@",self.name, passedString];
}

@end
