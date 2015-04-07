//
//  main.swift
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/7/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Foundation

let messagePortName = "net.kristopherjohnson.KJMessageTestServer"

// Initialize server and context
var server = Server()
var messagePortContext = CFMessagePortContext(
    version: 0,
    info: server.info(),
    retain: nil,
    release: nil,
    copyDescription: nil)
var messagePortCallback = Server.callback()
var shouldFreeInfo: Boolean = 0

// Create message port
let messagePort = CFMessagePortCreateLocal(
    nil,
    messagePortName,
    messagePortCallback,
    &messagePortContext,
    &shouldFreeInfo)

// Create and add run loop source
let runLoopSource = CFMessagePortCreateRunLoopSource(nil, messagePort, 0)
CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, kCFRunLoopCommonModes)

CFRunLoopRun()
