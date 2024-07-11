//
//  UserModel.swift
//  DhruvApp
//
//  Created by STTL on 17/04/24.
//

import Foundation

class GridItemModel: NSObject {
    
    var name: String!
    var img:String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        img = dictionary["img"] as? String
    }
}
