//
//  MainModel.swift
//  DhruvApp
//
//  Created by STTL on 19/04/24.
//

import Foundation

class AboutCTUILModel: NSObject {
    
    var name: String!
    var img:String!
    var storyboard: String!
    var vc: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        img = dictionary["img"] as? String
        storyboard = dictionary["storyboard"] as? String
        vc = dictionary["vc"] as? String
    }
}
