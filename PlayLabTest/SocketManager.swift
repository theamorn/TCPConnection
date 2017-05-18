//
//  SocketManager.swift
//  PlayLabTest
//
//  Created by Amorn Apichattanakul on 5/17/17.
//  Copyright © 2017 Amorn Apichattanakul. All rights reserved.
//

import Foundation
import SwiftSocket

enum param: String {
    case getUser = "get_user"
}

class SocketManager {
    static let sharedInstance = SocketManager()
    private init() {}
    
    var client: TCPClient?
    
    func connect(callback: @escaping (Greeting) -> ()) {
        client = TCPClient(address: Key.Socket.path, port: Int32(Key.Socket.port))
        guard let client = client else { return }
        switch client.connect(timeout: 1) {
        case .success:
            guard let data = client.read(1024*10) else { return }
            if let response = String(bytes: data, encoding: .utf8) {
                if let greeting = Greeting(JSONString: response) {
                    callback(greeting)
                }
            }
            
        case .failure(let error):
            print(error)
        }
    }
    func get(_ params: param) {
        guard let client = client else { return }
        switch client.send(string: "get_user HTTP/1.0\n\n") {
        case .success:
            guard let data = client.read(1024*10) else { return }
            
            if let response = String(bytes: data, encoding: .utf8) {
                print(response)
            }
        case .failure(let error):
            print("Send Error : ", error)
        }
    }
}
