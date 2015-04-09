//
//  Server.swift
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/8/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Cocoa

class Server: NSObject {

    func addSourceForMessagePortWithName(name: String, toRunLoop runLoop: CFRunLoop!) {
        if let messagePort = createMessagePortWithName(name) {
            addSourceForMessagePort(messagePort, toRunLoop: runLoop)
        }
    }

    func createMessagePortWithName(name: String) -> CFMessagePort? {
        var messagePortContext = CFMessagePortContext(
            version: 0,
            info: GetServerCallbackInfo(server),
            retain: nil,
            release: nil,
            copyDescription: nil)
        var messagePortCallback = GetServerCallback()
        var shouldFreeInfo: Boolean = 0

        return CFMessagePortCreateLocal(
            nil,
            name,
            messagePortCallback,
            &messagePortContext,
            &shouldFreeInfo)
    }

    func addSourceForMessagePort(messagePort: CFMessagePort, toRunLoop runLoop: CFRunLoop) {
        let runLoopSource = CFMessagePortCreateRunLoopSource(nil, messagePort, 0)
        CFRunLoopAddSource(runLoop, runLoopSource, kCFRunLoopCommonModes)
    }

    func handleMessageWithID(msgid: Int32, data: NSData) -> NSData? {
        NSLog("Server: received message in Swift")
        return nil
    }
}
