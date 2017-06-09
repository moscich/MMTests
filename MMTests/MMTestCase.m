//
//  MMTestCase.m
//  CodeEuropeExample
//
//  Created by Marek Mościchowski on 09.10.2016.
//  Copyright © 2016 Marek Mościchowski. All rights reserved.
//

#import "MMTestCase.h"
#import "MMTestResult.h"

@interface MMTestCase ()

@end

@implementation MMTestCase
__strong static NSMutableArray *testReport = nil;

+ (NSArray *)report {
  return testReport;
}

+(void) initialize
{
  if (! testReport)
    testReport = [[NSMutableArray alloc] init];
}

+ (void)reset {
  testReport = [NSMutableArray new];
}

+ (void)AssertEqual:(NSObject *)obj1 object:(NSObject *)obj2 context:(NSString *)context {
  if (!testReport) {
    testReport = [NSMutableArray new];
  }
  
  MMTestResult *testResult = [MMTestResult new];
  testResult.name = context;
  testResult.passed = [obj1 isEqual:obj2];
  
  [testReport addObject:testResult];
  
}

@end
