//
//  DropDownModel.swift
//  MultiLanguageCode
//
//  Created by Ravi Patel on 14/04/21.
//  Copyright © 2021 Ravi Patel. All rights reserved.
//

import Foundation

class DropDownModel: NSObject {
    let title: String
    let id: String
    var isSelected: Bool
    
    enum Keys: String {
        case title = "value"
        case id = "id"
        case isSelected = "isSelected"
    }
    
    init(dict: [String : Any]) {
        title = Keys.title.rawValue
        id = Keys.id.rawValue
        isSelected = false
    }
}
