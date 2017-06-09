//
//  MMDisplayer.m
//  MMTests
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

#import "MMDisplayer.h"

@implementation MMDisplayer

- (void)send:(NSInteger)passed failed:(NSInteger)failed completion:(void (^)())completion {
  
  NSString *post = [NSString stringWithFormat:@"passed=%d&failed=%d", passed, failed];
  NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
  NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  [request setURL:[NSURL URLWithString:@"http://127.0.0.1:3000"]];
  [request setHTTPMethod:@"POST"];
  [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
  [request setHTTPBody:postData];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
  [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"requestReply Wowoowow: %@", requestReply);
    completion();
    
  }] resume];
}

@end
