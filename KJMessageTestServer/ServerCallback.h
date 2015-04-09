//
//  ServerCallback.h
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/8/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Server;

extern void *GetServerCallbackInfo(Server *server);
extern CFMessagePortCallBack GetServerCallback();
