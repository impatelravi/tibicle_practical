//
//  UserDetailsViewController.swift
//  Tibicle Prac
//
//  Created by Ravi Patel on 05/03/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    //MARK:- Interface Builder
    //UILabel
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblWlcValue: UILabel!
    
    //UITextFeild
    @IBOutlet weak var tfName: UITextField!
    
    //UITableView
    @IBOutlet weak var tableView: UITableView!
    
    //Local
    var stringArr = [String]()
    private let arrSelection = ["India", "US"]
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //SetUp View
    func setUpView() {
        lblCountry.font = .systemFont(ofSize: 17)
        lblWlcValue.font = .systemFont(ofSize: 25)
    }

    //MARK:- UIButton
    //Select Country Button Code
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
    
    //Save Button Code
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        if (getString(anything: tfName.text).isStringEmpty) {
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
            
            //PopUp View
            if let popupViewController = UIStoryboard(name: "UserDetails", bundle: nil).instantiateViewController(withIdentifier: "PopupViewController") as? PopupViewController {
                popupViewController.modalPresentationStyle = .overCurrentContext
                popupViewController.modalTransitionStyle = .crossDissolve
                popupViewController.name = self.tfName.text ?? ""
                popupViewController.country = self.lblCountry.text ?? ""
                for i in stringArr {
                    popupViewController.edu = popupViewController.edu + " " + i + ","
                }
                self.present(popupViewController, animated: true)
            }
        }
    }
    
    //Add New Education Feild Button code
    @IBAction func btnAddTapped(_ sender: Any) {
            let txt = ""
            self.stringArr.insert(txt, at: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            tableView.endUpdates()
    }
    
    //Delete Education Feild Button Code
    @IBAction func btnDeleteTapped(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        stringArr.remove(at: indexpath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)
        tableView.endUpdates()
    }
}

//MARK:- Extension
//TableView Delegate & Datasource
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
