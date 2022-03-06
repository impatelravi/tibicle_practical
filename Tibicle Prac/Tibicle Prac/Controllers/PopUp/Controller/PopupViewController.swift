//
//  PopupViewController.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

class PopupViewController: UIViewController {
    //MARK:- Interface Builder
    //UILabel
    @IBOutlet weak var lblNameValue: UILabel!
    @IBOutlet weak var lblCountryValue: UILabel!
    @IBOutlet weak var lblEduValue: UILabel!
    
    //Local
    var name: String = ""
    var country: String = ""
    var edu: String = ""
    
    //MARK:- outlets for the viewController
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var okayButton: UIButton!
    
    //MARK:- lifecyle methods
    override func viewDidLoad(){
        super.viewDidLoad()
        setUpViews()
    }
    
    //MARK:- Functions
    //View Setup
    fileprivate func setUpViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        dialogBoxView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        
        lblNameValue.text = name
        lblEduValue.text = edu
        lblCountryValue.text = country
    }
    
    //MARK:- UIButtons
    //Close Button code
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}



