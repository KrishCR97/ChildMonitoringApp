//
//  RecoverPassViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/10/18.
//

import UIKit

class RecoverPassViewController: UIViewController {

    @IBOutlet weak var emailIDTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recoverPasswordBTN(_ sender: UIButton) {
        if emailIDTF.text! != "" {
            if AppDelegate.DBInstance.forgotPass(user: User(userName: nil, email: emailIDTF.text!, password: nil)) == nil {
                let alert = UIAlertController(title : "Alert", message: "Reset the password by cicking the link that is sent to your email.",preferredStyle : UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title : "Alert", message: AppDelegate.DBInstance.forgotPass(user: User(userName: nil, email: emailIDTF.text!, password: nil)),preferredStyle : UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            let alert = UIAlertController(title : "Alert", message: "Enter emaiID ",preferredStyle : UIAlertControllerStyle.alert)
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
