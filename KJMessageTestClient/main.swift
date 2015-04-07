//
//  main.swift
//  KJMessageTestClient
//
//  Created by Kristopher Johnson on 4/7/15.
//  Copyright (c) 2015 Kristopher Johnson. All rights reserved.
//

import Foundation

let messagePortName = "net.kristopherjohnson.KJMessageTestServer"

if let serverPort = CFMessagePortCreateRemote(nil, messagePortName) {
    let bytes: [UInt8] = [8, 7, 6, 5, 4, 3, 2, 1]
    let data = CFDataCreate(nil, bytes, bytes.count)
    let sendResult = CFMessagePortSendRequest(serverPort,
        1,
        data,
        1.0,
        1.0,
        nil,
        nil);
    if sendResult == Int32(kCFMessagePortSuccess) {
        NSLog("Client: success!")
    }
    else {
        NSLog("Client error: \(sendResult)")
    }
}
else {
    println("Client: Unable to open server port")
}