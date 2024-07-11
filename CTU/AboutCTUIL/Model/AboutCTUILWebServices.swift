//
//  MainWebServices.swift
//  DhruvApp
//
//  Created by STTL on 19/04/24.
//

import Foundation

class AboutCTUILWebServices: NSObject {
    
    //Getting Practical List in Dictionary Type
    func getAboutCtuilList(block : ([AboutCTUILModel]) -> Swift.Void){
        var responsemodel =  [AboutCTUILModel]()
        let dict = readJsonFile(ofName: "aboutCtuilList")
        if let arr = dict["AboutCTUILItems"] as? [[String : Any]]{
            responsemodel =  arr.map({ AboutCTUILModel(fromDictionary: $0)})
        }
        block(responsemodel)
    }
    
    //Read Json File
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
