//
//  LoginViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/10/18.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameOrEmailIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func loginBTN(_ sender: UIButton) {
        if userNameOrEmailIDTF.text! != ""  && passwordTF.text! != ""  {
            if AppDelegate.DBInstance.login(user: User(userName: userNameOrEmailIDTF.text, email: userNameOrEmailIDTF.text!, password: passwordTF.text)) == nil {
                
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BaseTabBarController") as! BaseTabBarController
                appDelegate.window?.rootViewController = viewController
                AppDelegate.password = passwordTF.text!
                
            }
            else {
                print("in here ")
                let alert = UIAlertController(title : "Alert", message: "Incorrect credentials",preferredStyle : UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Invalid username or password", preferredStyle: UIAlertControllerStyle.alert)
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
