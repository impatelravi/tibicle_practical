//
//  UserDetailsTableViewCell.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {
    //MARK:-Interface Builder
    //UITextFeild
    @IBOutlet weak var tfEdu: UITextField!
    
    //UIButton
    @IBOutlet weak var btnDelete: UIButton!
    
    //MARK:- Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
