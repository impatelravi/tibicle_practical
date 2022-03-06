//
//  StringPickerViewDelegateDataSource.swift
//  DemoPickerView
//
//  Created by Ravi Patel on 03/07/20.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit

class StringPickerViewDelegateDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource
{
    //MARK:- Variables
    //Local
    private let arrSource: [[Any]]
    
    //Public
    var delegate: StringPickerViewDelegate!
    
    //MARK:- Initializers
    init(arrSource: [[Any]])
    {
        self.arrSource = arrSource
        super.init()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return arrSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        let rowArr = self.arrSource[component]
        return rowArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        let rowArr = self.arrSource[component]
        if let str = rowArr[row] as? String
        {
            return str
        }
        else
        {
            return String(describing: rowArr[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let value = String(describing: self.arrSource[component][row])
        if (delegate != nil)
        {
            self.delegate?.didSelect(didSelectRow: row, inComponent: component, value: value)
        }
    }
}
