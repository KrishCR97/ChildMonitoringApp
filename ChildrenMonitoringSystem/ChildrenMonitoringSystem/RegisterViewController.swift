//
//  RegisterViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/10/18.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailIDTF: UITextField!
    
    @IBOutlet weak var userNameTF: UITextField!
    
    @IBOutlet weak var rePasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerBTN(_ sender: UIButton) {
        if userNameTF.text != "" && emailIDTF.text != "" {
             if (passwordTF.text! == rePasswordTF.text!) && passwordTF.text != "" && rePasswordTF.text != "" {
                if AppDelegate.DBInstance.registerUser(user: User(userName: userNameTF.text!, email: emailIDTF.text!, password: passwordTF.text!)) == nil {
                    let alert = UIAlertController(title :"Alert" , message :  "Enter username and emailID correctly",preferredStyle : UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    let alert = UIAlertController(title : "Alert", message: "Account sucessfully created ",preferredStyle : UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    emailIDTF.text! = ""
                    userNameTF.text! = ""
                    passwordTF.text! = ""
                    rePasswordTF.text! = ""
                }
            
            }
             else {
                let alert = UIAlertController(title : "Alert", message: "Enter the passwords correctly ",preferredStyle : UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        else {
            let alert = UIAlertController(title : "Alert", message: "Fill the fields all the fields are mandatory ",preferredStyle : UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
