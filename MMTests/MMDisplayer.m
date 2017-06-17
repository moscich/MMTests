//
//  MMDisplayer.m
//  MMTests
//
//  Created by Marek Mościchowski on 09.06.2017.
//  Copyright © 2017 Marek Mościchowski. All rights reserved.
//

#import "MMDisplayer.h"
#import "GCDAsyncSocket.h"

@interface MMDisplayer () <GCDAsyncSocketDelegate>
@property(nonatomic, strong) GCDAsyncSocket *sock;
@property (nonatomic, copy) void (^completion)();
@end

@implementation MMDisplayer

- (instancetype)init {
  self = [super init];
  if (self) {
    self.sock = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self.sock connectToHost:@"127.0.0.1" onPort:12345 error:nil];
  }
  return self;
}

- (void)send:(NSInteger)passed failed:(NSInteger)failed completion:(void (^)())completion {
  self.completion = completion;
  NSString *string = [NSString stringWithFormat:@"%d|%d", passed, failed];
  
  [self.sock writeData:[string dataUsingEncoding:kCFStringEncodingUTF8 ] withTimeout:-1 tag:0];

}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
  self.completion();
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
  
}

@end
