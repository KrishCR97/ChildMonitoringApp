//
//  UserSettingsViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/24/18.
//

import UIKit

class UserSettingsViewController: UIViewController {

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
    @IBAction func logOutBTN(_ sender: UIButton) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "logInScreen") as! LoginViewController
        appDelegate.window?.rootViewController = viewController
    }
    @IBAction func unwindSegue(segue:UIStoryboardSegue) {
        
    }
}
