//
//  ServerCallback.m
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/8/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

#import "ServerCallback.h"
#import "KJMessageTestServer-Swift.h"

/// Calls Server.handleMessageWithID(,data:)
static CFDataRef ServerCallback(CFMessagePortRef local, SInt32 msgid, CFDataRef data, void *info) {
    Server *server = (__bridge Server *)info;
    NSData *responseData = [server handleMessageWithID:msgid data:(__bridge NSData *)(data)];
    if (responseData != NULL) {
        CFDataRef cfdata = CFDataCreate(nil, responseData.bytes, responseData.length);
        return cfdata;
    }
    else {
        return NULL;
    }
}

CFMessagePortCallBack GetServerCallback() {
    return ServerCallback;
}

void *GetServerCallbackInfo(Server *server) {
    return (__bridge void *)server;
}
