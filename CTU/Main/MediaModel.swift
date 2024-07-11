//
//  MediaModel.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import Foundation

class MediaModel: NSObject {
    
    var name: String!
    var img:String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        img = dictionary["img"] as? String
    }
}
