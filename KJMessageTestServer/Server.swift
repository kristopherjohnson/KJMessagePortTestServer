//
//  Server.swift
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/8/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Cocoa

class Server: NSObject {

    func handleMessageWithId(msgid: Int32, data: NSData) -> NSData? {
        NSLog("Server: received message in Swift")
        return nil
    }
}
