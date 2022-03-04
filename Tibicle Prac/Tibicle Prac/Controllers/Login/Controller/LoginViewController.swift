//
//  LoginViewController.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 04/03/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UIButton
    //Login Button
    @IBAction func btnLogin(_ sender: Any) {
        let VC: UserDetailsViewController = UserDetailsViewController.instantiate(appStoryboard: .userDetails)
        navigationController?.pushViewController(VC, animated: true)
    }
}
