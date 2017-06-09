//
//  MyLookupCommand.m
//  MacTestPresenter
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

#import "MyLookupCommand.h"


@implementation MyLookupCommand

-(id)performDefaultImplementation {
  
  // get the arguments
  NSDictionary *args = [self evaluatedArguments];
  NSString *stringToSearch = @"";
  if(args.count) {
    stringToSearch = [args valueForKey:@""];    // get the direct argument
  } else {
    // raise error
    [self setScriptErrorNumber:-50];
    [self setScriptErrorString:@"Parameter Error: A Parameter is expected for the verb 'lookup' (You have to specify _what_ you want to lookup!)."];
  }
  // Implement your code logic (in this example, I'm just posting an internal notification)
//  [NSApplication sharedApplication].
//  AppDele NSApp.delegate;
//  AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
//  
//  
  [[NSNotificationCenter defaultCenter] postNotificationName:@"updateBar" object:stringToSearch];
  return nil;
}

@end
