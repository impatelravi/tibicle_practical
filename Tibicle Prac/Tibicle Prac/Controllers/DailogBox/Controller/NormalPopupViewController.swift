//
//  NormalPopup.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var lblNameValue: UILabel!
    @IBOutlet weak var lblCountryValue: UILabel!
    @IBOutlet weak var lblEduValue: UILabel!
    
    var name: String = ""
    var country: String = ""
    var Edu: String = ""
    
    var userDetails: UserDetailsViewController = UserDetailsViewController()
    
    static let identifier = "PopupViewController"
    
    //MARK:- outlets for the viewController
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var okayButton: UIButton!
    
    //MARK:- lifecyle methods for the view controller
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //adding an overlay to the view to give focus to the dialog box
        lblNameValue.text = userDetails.tfName?.text ?? "Nil"
        print(lblNameValue.text!)
        print(name)
        setUpViews()
        
    }
    
    //MARK:- Functions
    //View Setup
    fileprivate func setUpViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)

        //customizing the dialog box view
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        dialogBoxView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        
        print(getString(anything: name))
        lblEduValue.text = getString(anything: Edu)
        //lblNameValue.text = getString(anything: name)
        lblCountryValue.text = getString(anything: country)
    }
    
    //Popup
    static func showPopup(parentVC: UIViewController){
        
        if let popupViewController = UIStoryboard(name: "UserDetails", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            parentVC.present(popupViewController, animated: true)
        }
    }
    
    //MARK:- UIButtons
    //Okay Button
    @IBAction func okayButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}



