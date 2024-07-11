//
//  UIViewControllerExtensions.swift
//  CTU
//
//  Created by STTL on 09/07/24.
//

import UIKit

extension UIViewController {
    func setTabBarHidden(_ hidden:Bool,animated:Bool = true,duration:TimeInterval = 0.3	){
//        if animated {
//            if let frame = self.tabBarController?.tabBar.frame{
//                let factor: CGFloat = hidden ? 1 : -1
//                let yPos = frame.origin.y - (frame.size.height * factor)
//                UIView.animate(withDuration: duration){
//                    self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: yPos, width: frame.width, height: frame.height)
//                }
//                return
//            }
//        }
        self.tabBarController?.tabBar.isHidden = hidden
//        self.tabBarController?.tabBar.isHidden.toggle()
    }
}
