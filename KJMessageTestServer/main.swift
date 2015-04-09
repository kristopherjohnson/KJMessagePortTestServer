//
//  main.swift
//  KJMessageTestServer
//
//  Created by Kristopher Johnson on 4/7/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Foundation

let messagePortName = "net.kristopherjohnson.KJMessageTestServer"

var server = Server()
server.addSourceForMessagePortWithName(messagePortName, toRunLoop: CFRunLoopGetCurrent())

CFRunLoopRun()
