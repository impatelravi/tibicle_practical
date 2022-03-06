//
//  UIView+Extension.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

extension UIView
{
    //MARK:- View With Border
    func viewWith(radius: CGFloat, borderColor color: UIColor = .clear, borderWidth: CGFloat = 0)
    {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    //MARK:- Add Shadow to View
    func addShadow(shadowColor: UIColor = .systemGray, shadowOpacity: Float = 0.3, shadowRadius: CGFloat? = 2, shadowOffset: CGSize = CGSize(width: 0, height : 0))
    {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        if let getShadowRadius = shadowRadius {
            self.layer.shadowRadius = getShadowRadius
        }
    }
}
