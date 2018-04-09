//
//  ProfileViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/11/18.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailIDTF: UILabel!
    @IBOutlet weak var userNameTF: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailIDTF.text = AppDelegate.DBInstance.backendless.userService.currentUser.email as? String
        userNameTF.text = AppDelegate.DBInstance.backendless.userService.currentUser.name as? String
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

}
