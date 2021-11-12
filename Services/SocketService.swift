//
//  SockectService.swift
//  Smack
//
//  Created by MacBook on 12/11/2021.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    let manager = SocketManager(socketURL: URL(string: LOCAL_BASR_URL)!, config: [.log(true), .compress])
    var socket: SocketIOClient? = nil
    
    override init() {
        super.init()
        socket = self.manager.defaultSocket
        
        self.socket?.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
    }
    
//    var socket : SocketManager = SocketManager(socketURL: URL(string: LOCAL_BASR_URL)!)
 
    func establishConnection() {
        self.socket?.connect()
    }
    
    func closeConnection() {
        self.socket?.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        
        self.socket?.emit("newChannel", channelName, channelDescription, completion: {
            print("Done")
        })
        if self.socket?.status == .connected {
            self.socket?.emit("newChannel", channelName, channelDescription)
            completion(true, "")
        } else {
            completion(false, "Socket not connected")
        }
    }
    
    
    func getChannel(completion: @escaping CompletionHandler) {
        self.socket?.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId  = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true, "")
        }
    }

    
}
