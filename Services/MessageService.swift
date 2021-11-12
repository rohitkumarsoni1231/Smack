//
//  MessageService.swift
//  Smack
//
//  Created by MacBook on 11/11/2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import SocketIO

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler)
    {
        AF.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.error == nil {
                guard let data = response.data else { return }
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        
                        NotificationCenter.default.post(name: NOTIf_CHANNELS_LOADED, object: nil)
                        completion(true, "")
                    }
                } catch {
                    print(error)
                }
            } else {
                completion(false, "")
                debugPrint(response.error as Any)
            }
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
}
