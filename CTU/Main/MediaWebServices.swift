//
//  MediaWebServices.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import Foundation
class MediaWebServices: NSObject {
    
    //Get userList in Dictionary Datatype
    func getMediaItemList(block : ([MediaModel]) -> Swift.Void){
        var responsemodel =  [MediaModel]()
        let dict = readJsonFile(ofName: "mediaList")
        if let arr = dict["MediaItems"] as? [[String : Any]]{
            responsemodel =  arr.map({ MediaModel(fromDictionary: $0)})
        }
        block(responsemodel)
    }
    
    //Read Data from Json FIle
    func readJsonFile(ofName: String) -> [String : Any] {
        guard let strPath = Bundle.main.path(forResource: ofName, ofType: ".json") else {
            return [:]
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: strPath), options: .alwaysMapped)
            
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let dictJson = jsonResult as? [String : Any] {
                return dictJson
            }
        } catch {
            print("Error!! Unable to parse ")
        }
        return [:]
    }
}
