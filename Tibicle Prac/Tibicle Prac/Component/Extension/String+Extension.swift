//
//  String+Extension.swift
//  HelperClass_Struct_Functions
//
//  Created by Ravi Patel on 26/04/21.
//  Copyright © 2020 Ravi Patel. All rights reserved.
//

import UIKit

//Static EmailRegex
let kEmailRegex = "(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*)@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)"

extension String {
    var firstUppercased: String
    {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}

extension String
{
    //MARK:- Validation Functions
    //Length validation
    var isEmptyString: Bool {
        return trimming_WS_NL.count == 0
    }
    
    var isValidEmail: Bool {
        let emailRegEx = kEmailRegex
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}


extension String {
    var isStringEmpty : Bool {
        return !(trimming_WS_NL.count > 0)
    }
    
    var trimming_WS_NL : String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var trimming_WS : String {
        return trimmingCharacters(in: .whitespaces)
    }

}
