//
//  Server.m
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/7/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

#import "Server.h"

@interface Server ()
- (NSData *)handleMessageWithId:(SInt32)msgid data:(NSData *)data;
@end

CFDataRef ServerCallback(CFMessagePortRef local, SInt32 msgid, CFDataRef data, void *info) {
    Server *server = (__bridge Server *)info;
    NSData *resultData = [server handleMessageWithId:msgid data:(__bridge NSData *)(data)];
    CFDataRef cfdata = CFDataCreate(nil, resultData.bytes, resultData.length);
    return cfdata;
}

@implementation Server

- (void *)info {
    return (__bridge void *)self;
}

+ (CFMessagePortCallBack)callback {
    return ServerCallback;
}

- (NSData *)handleMessageWithId:(SInt32)msgid data:(NSData *)data {
    NSLog(@"Server: received message");
    return NULL;
}

@end
