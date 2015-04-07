//
//  Server.h
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/7/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Server : NSObject

// Return pointer to C function that will invoke appropriate callback
// methods of a Server instance
+ (CFMessagePortCallBack)callback;

// Return value to be passed as "info" member of message port context
- (void *)info;

@end
