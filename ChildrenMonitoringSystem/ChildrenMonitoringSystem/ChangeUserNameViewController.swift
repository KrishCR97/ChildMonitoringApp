//
//  ChangeUserNameViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/24/18.
//

import UIKit

class ChangeUserNameViewController: UIViewController {

    @IBOutlet weak var currentUserName: UITextField!
    @IBOutlet weak var newUserNameTF: UITextField!
    @IBOutlet weak var reUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelBTN(_ sender: UIButton) {
        
    }
    @IBAction func changeUserNameBTN(_ sender: UIButton) {
        if let cUserName = currentUserName.text , let nUserName = newUserNameTF.text , let rUserName = reUserName.text{
            if(cUserName == AppDelegate.userName && nUserName == nUserName){
                //Types.tryblock({ () -> Void in
                let registeredUser = AppDelegate.DBInstance.backendless.userService.currentUser
                print("User has been registered (SYNC): \(String(describing: registeredUser))")
                
                let properties = [
                    "name" : nUserName
                ]
                
                registeredUser?.updateProperties(properties)
 AppDelegate.DBInstance.backendless.userService.update(registeredUser)
                let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
                let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "userSettings") as! UserSettingsViewController
                appDelegate.window?.rootViewController = viewController
                
            }
            
        }
        let alert = UIAlertController(title : "Alert", message: "Enter valid User Name ",preferredStyle : UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
