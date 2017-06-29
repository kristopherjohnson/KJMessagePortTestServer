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
    func addSourceForNewLocalMessagePort(name: String, toRunLoop runLoop: CFRunLoop!) {
        if let messagePort = createMessagePort(name: name) {
            addSource(messagePort: messagePort, toRunLoop: runLoop)
        }
    }

    /// Create a local message port with the specified name
    ///
    /// Incoming messages will be routed to this object's handleMessageWithID(,data:) method.
    func createMessagePort(name: String) -> CFMessagePort? {
        let callback = GetServerCallback()
        var context = CFMessagePortContext(
            version: 0,
            info: GetServerCallbackInfo(self),
            retain: nil,
            release: nil,
            copyDescription: nil)
        var shouldFreeInfo: DarwinBoolean = false

        return CFMessagePortCreateLocal(
            nil,
            name as CFString,
            callback,
            &context,
            &shouldFreeInfo)
    }

    /// Create an input source for the specified message port and add it to the specified run loop
    func addSource(messagePort: CFMessagePort, toRunLoop runLoop: CFRunLoop) {
        let source = CFMessagePortCreateRunLoopSource(nil, messagePort, 0)
        CFRunLoopAddSource(runLoop, source, CFRunLoopMode.commonModes)
    }

    /// Called by the message port callback function
    func handleMessageWithID(_ msgid: Int32, data: Data) -> Data? {
        NSLog("Server: received message with ID \(msgid), length \(data.count)")
        return nil
    }
}
