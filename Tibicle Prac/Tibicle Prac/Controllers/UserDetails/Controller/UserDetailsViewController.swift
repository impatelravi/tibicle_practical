//
//  UserDetailsViewController.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

class UserDetailsViewController: UIViewController {

    //UILabel
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblWlcValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var count = 0
    var stringArr = [String]()
    
    //Local
    private let arrSelection = ["India", "US"]
    
    //var popUp: PopupViewController = PopupViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //UIButton
    //Select Country Button
    @IBAction func btnSelectCountryTapped(_ sender: UIButton) {
        StringPickerViewController.show(pickerType: .single, initialSelection: lblCountry.text, arrSource: [arrSelection], doneAction: { (rows, value) in
            self.lblCountry.text = value as? String
            if (self.lblCountry.text == "India") {
                self.lblWlcValue.text = "Namaste!"
            }
            else if (self.lblCountry.text == "US") {
                self.lblWlcValue.text = "Welcome!"
            }
        }, animated: true, origin: sender)
    }
    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        if (getString(anything: tfName.text).isStringEmpty) {
            
            //PopupViewController.showPopup(parentVC: self)
            let uialert = UIAlertController(title: "Alert", message: "Please Enter Your Name", preferredStyle: UIAlertController.Style.alert)
                  uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
               self.present(uialert, animated: true, completion: nil)
        } else {
            var arrInserted = [String]()
            for i in 0..<stringArr.count {
                let indexPath = IndexPath(row: i, section: 0)
                if let cell = self.tableView.cellForRow(at: indexPath) as? UserDetailsTableViewCell {
                    arrInserted.insert(cell.tfEdu.text ?? "", at: i)
                }
            }
            stringArr = arrInserted
            print(stringArr)
            
            
            let name = getString(anything: self.tfName.text)
            PopupViewController().name = name
            /*for i in stringArr {
                popUp.Edu = "\(popUp.Edu), \(i)"
            }
            print(popUp.Edu)
            //popUp.lblEduValue.text = stringArr
            popUp.lblNameValue?.text = getString(anything: tfName.text).trimming_WS
            print(tfName.text!)
            print(popUp.name)
            //print(popUp.lblNameValue.text)
            popUp.country = lblCountry.text ?? "Nil"*/
            
            PopupViewController.showPopup(parentVC: self)
            /*let uialert = UIAlertController(title: "User Details", message: "Name: \(tfName.text!) \n Country: \(lblCountry.text!) \n Education: \n _________________ \(stringArr)", preferredStyle: UIAlertController.Style.alert)
              uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(uialert, animated: true, completion: nil)*/
        }
    }
    
    @IBAction func onClickAddButton(_ sender: Any) {
            let txt = ""
            self.stringArr.insert(txt, at: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableView.endUpdates()
    }
    
    @IBAction func onClickDeleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        stringArr.remove(at: indexpath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tableView.endUpdates()
    }
}

extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTableViewCell", for: indexPath) as? UserDetailsTableViewCell else {return UITableViewCell()}
        cell.tfEdu.text = stringArr[indexPath.row]
        stringArr[indexPath.row] = cell.tfEdu.text!
        print(stringArr)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
}
