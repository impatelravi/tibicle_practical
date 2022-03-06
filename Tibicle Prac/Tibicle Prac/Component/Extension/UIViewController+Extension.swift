//
//  UIViewController+Extension.swift
//  HelperClass_Struct_Functions
//
//  Created by Ravi Patel on 26/04/21.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit

enum AppStoryboard: String {
    
    case userDetails = "UserDetails"
    case loginViewController = "Login"
    //case add = "Add"
    
}

extension UIViewController {
    class func instantiate(appStoryboard: AppStoryboard) -> Self {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: Self.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
