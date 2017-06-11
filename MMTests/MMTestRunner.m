//
//  MMTestRunner.m
//  CodeEuropeExample
//
//  Created by Marek Mościchowski on 07.10.2016.
//  Copyright © 2016 Marek Mościchowski. All rights reserved.
//

#import "MMTestRunner.h"
#import "MMTestCase.h"
#import <objc/runtime.h>

@implementation MMTestRunner

- (NSArray *)runTests {
  self.bundles = [NSMutableArray new];
  int numClasses;
  Class * classes = NULL;
  
  classes = NULL;
  numClasses = objc_getClassList(NULL, 0);
  
  if (numClasses > 0 )
  {
    classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    for (int i = 0; i < numClasses; i++) {
      Class c = classes[i];
      NSBundle *b = [NSBundle bundleForClass:c];
      
      if(![self.bundles containsObject:b]) {
        [self.bundles addObject:b];
      }
      if ([b.bundleURL.lastPathComponent isEqualToString:@"UI_Framework.framework"]) {
        if ([c isSubclassOfClass:MMTestCase.class]) {
            NSLog(@"I'm in");
          MMTestCase *testCase = [c new];
          unsigned int methodCount = 0;
          Method *methods = class_copyMethodList(testCase.class, &methodCount);
          for (unsigned int i = 0; i < methodCount; i++) {
            Method method = methods[i];
            
            NSString *methodName =[NSString stringWithFormat:@"%s", sel_getName(method_getName(method))];
            if ([[methodName substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"test" ]){
              [testCase performSelector:method_getName(method)];
            }
          }
        }
        
      }
      
    }
    free(classes);
    
  }
  return [MMTestCase report];
  
}

+ (NSArray<NSString *> *)bundles {
  NSMutableArray *bundles = [NSMutableArray new];
  int numClasses;
  Class * classes = NULL;
  
  classes = NULL;
  numClasses = objc_getClassList(NULL, 0);
  
  if (numClasses > 0 )
  {
    classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    for (int i = 0; i < numClasses; i++) {
      Class c = classes[i];
      NSBundle *b = [NSBundle bundleForClass:c];
      
      if(![bundles containsObject:b.bundleURL.lastPathComponent]) {
        [bundles addObject:b.bundleURL.lastPathComponent];
      }
    }
    
    
  }
  return bundles;
}


@end
