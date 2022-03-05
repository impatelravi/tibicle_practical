//
//  UserDetailsTableViewCell.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tfEdu: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
