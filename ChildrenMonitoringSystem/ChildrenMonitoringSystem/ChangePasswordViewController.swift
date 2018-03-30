//
//  ChangePasswordViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/24/18.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var currentPassTF: UITextField!
    
    @IBOutlet weak var newPassTF: UITextField!
    @IBOutlet weak var rePassTF: UITextField!
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
    @IBAction func changePasswodBTN(_ sender: UIButton) {
        
        if let cPass = currentPassTF.text , let nPass = newPassTF.text , let rPass = rePassTF.text{
            if(cPass == AppDelegate.password && nPass == rPass){
                Types.tryblock({ () -> Void in
                    let registeredUser = AppDelegate.DBInstance.backendless.userService.currentUser
                    print("User has been registered (SYNC): \(String(describing: registeredUser))")

                    let properties = [
                        "password" : nPass
                    ]

                    registeredUser?.updateProperties(properties)
Types.tryblock({ () -> Void in
    _ = AppDelegate.DBInstance.backendless.userService.update(registeredUser)
    
}, catchblock: {(exception) ->Void in
    
    print("In the exception")
})
                    
//                    print("User updated (SYNC): \(String(describing: updatedUser))")
//
                },catchblock: { (exception) -> Void in
                    print("Server reported an error: \(String(describing: exception))" )
                })
            }

        }
//        print("out of if")
     self.performSegue(withIdentifier: "unwindSegue", sender: self)
        
    }
    
}
