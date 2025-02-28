//
//  Navigation.swift
//  DhruvApp
//
//  Created by STTL on 11/04/24.
//

import UIKit

class Navigation{
    
    //Navigation Function : Use to navigate to Other StoryBoard
    //params : (storyboard , viewController , currentViewControlller)
    static func navigateToOtherController(_ storyBoard : String,_ viewController: String, from currentViewController: UIViewController) {
        let sb = UIStoryboard(name:storyBoard,bundle: nil)
        let vc = sb.instantiateViewController(identifier: viewController)
        currentViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    //Navigation Function : Use to navigate to Other StoryBoard
    //params : (storyboard , viewController , currentNavigationController)
    static func navigateToOtherControllerTableView(_ storyBoard : String,_ viewController: String, from currentNavigationController: UINavigationController) {
        let sb = UIStoryboard(name:storyBoard,bundle: nil)
        let vc = sb.instantiateViewController(identifier: viewController)
        currentNavigationController.pushViewController(vc, animated: true)
    }
    
    //Navigation Function : Use to navigate to Other StoryBoard
    //params : (storyboard , viewController , data , currentViewControlller)
//    static func navigateWithData(_ storyBoard : String,_ viewController: String,data: EmployeeModel, from currentViewController: UIViewController) {
//        let sb = UIStoryboard(name:storyBoard,bundle: nil)
//        if viewController == "FourteenScreenVC"{
//            let vc = sb.instantiateViewController(identifier: "FourteenScreenVC") as! FourteenScreenVC
//            vc.receivedData = data
//            currentViewController.navigationController?.pushViewController(vc, animated: true)
//        }else if viewController == "Task17VC"{
//            let vc = sb.instantiateViewController(identifier: "Task17VC") as! Task17VC
//            vc.receivedData = data
//            currentViewController.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}

