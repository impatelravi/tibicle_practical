//
//  PickerConstants.swift
//  DemoPickerView
//
//  Created by Ravi Patel on 03/07/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit

//MARK:- Enum
enum PickerType: Int
{
    case single = 0
    //case date
    case multiple
}

//MARK:- TypeAlias
typealias StringPickerDoneAction = (([Int], Any?) -> ())
typealias DatePickerDoneAction = (Date) -> ()

//MARK:- Constants
let IS_iPad = UIDevice.current.userInterfaceIdiom == .pad
let screenWidth = UIScreen.main.bounds.size.width

//MARK:- Protocols
protocol StringPickerViewDelegate
{
    func didSelect(didSelectRow row: Int, inComponent component: Int, value: Any)
    
}

//MARK:- SharedInstances
let sharedStringPickerViewControllerInstance = StringPickerViewController()
//let sharedDatePickerViewControllerInstance = DatePickerViewController()

@available(iOS 13.0, *)
let sceneDelegatePicker = (UIApplication.shared.connectedScenes.first)?.delegate as? SceneDelegate
let appDelegatePicker = UIApplication.shared.delegate as! AppDelegate

var delegateRootVCPicker: UIViewController? {
    if #available(iOS 13, *) {
        if let sceneDelegatePickerUnwrapped = sceneDelegatePicker {
            return sceneDelegatePickerUnwrapped.window?.rootViewController
        } else {
            return appDelegatePicker.window?.rootViewController
        }
    } else {
        return appDelegatePicker.window?.rootViewController
    }
}
