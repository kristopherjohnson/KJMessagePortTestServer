//
//  ServerCallback.h
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/8/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

/// CFMessagePortCreateLocal requires a C function pointer for the
/// callback parameter.  These functions, implemented in Objective-C,
/// provide that callback function pointer and related context info
/// in a way that can be consumed by the Swift `Server` class.

@class Server;

/// Return the callback function to be passed to CFMessagePortCreateLocal()
extern CFMessagePortCallBack GetServerCallback();

/// Return the value to be used as the `info` field in CFMessagePortContext
extern void *GetServerCallbackInfo(Server *server);
