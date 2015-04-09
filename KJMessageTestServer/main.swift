//
//  main.swift
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/7/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Foundation

let messagePortName = "net.kristopherjohnson.KJMessageTestServer"

let server = Server()
server.addSourceForNewLocalMessagePortWithName(messagePortName, toRunLoop: CFRunLoopGetCurrent())

CFRunLoopRun()
