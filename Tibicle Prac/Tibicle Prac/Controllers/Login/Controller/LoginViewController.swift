//
//  LoginViewController.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var viewLogin: UIView!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblPassword: UILabel!
    
    
    //Validation
    fileprivate var isValidEmail: Bool {
        if (getString(anything: tfEmail.text).isStringEmpty) {
            lblEmail.text = "Please Enter Email ID"
            return false
        } else if !(getString(anything: tfEmail.text).isValidEmail) {
            lblEmail.text = "Please Enter Valid Email ID"
            return false
        }
        lblEmail.text = ""
        return true
    }
    
    fileprivate var isValidPassword: Bool {
        if (getString(anything: tfPassword.text).isStringEmpty) {
            lblPassword.text = "Please Enter Password"
            return false
        }
        lblPassword.text = ""
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setUpViews() {
        self.viewLogin.viewWith(radius: 20.0)
        self.viewLogin.addShadow()
    }
    
    //UIButton
    //Login Button
    @IBAction func btnLogin(_ sender: Any) {
        //if (isValidEmail && isValidPassword) {
            let VC: UserDetailsViewController = UserDetailsViewController.instantiate(appStoryboard: .userDetails)
            navigationController?.pushViewController(VC, animated: true)
        //}
        
    }
}
