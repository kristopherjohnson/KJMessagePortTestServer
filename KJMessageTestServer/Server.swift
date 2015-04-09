//
//  Server.swift
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/8/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Foundation

/// Implementation of a server that uses a message port
///
/// This class is derived from NSObject so that the Objective-C-based
/// callback function can use it.
class Server: NSObject {

    /// Create the local message port then register an input source for it
    func addSourceForNewLocalMessagePortWithName(name: String, toRunLoop runLoop: CFRunLoop!) {
        if let messagePort = createMessagePortWithName(name) {
            addSourceForMessagePort(messagePort, toRunLoop: runLoop)
        }
    }

    /// Create a local message port with the specified name
    ///
    /// Incoming messages will be routed to this object's handleMessageWithID(,data:) method.
    func createMessagePortWithName(name: String) -> CFMessagePort? {
        let callback = GetServerCallback()
        var context = CFMessagePortContext(
            version: 0,
            info: GetServerCallbackInfo(self),
            retain: nil,
            release: nil,
            copyDescription: nil)
        var shouldFreeInfo: Boolean = 0

        return CFMessagePortCreateLocal(
            nil,
            name,
            callback,
            &context,
            &shouldFreeInfo)
    }

    /// Create an input source for the specified message port and add it to the specified run loop
    func addSourceForMessagePort(messagePort: CFMessagePort, toRunLoop runLoop: CFRunLoop) {
        let source = CFMessagePortCreateRunLoopSource(nil, messagePort, 0)
        CFRunLoopAddSource(runLoop, source, kCFRunLoopCommonModes)
    }

    /// Called by the message port callback function
    func handleMessageWithID(msgid: Int32, data: NSData) -> NSData? {
        NSLog("Server: received message with ID \(msgid), length \(data.length)")
        return nil
    }
}
