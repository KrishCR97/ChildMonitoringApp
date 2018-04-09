//
//  ChildLoginViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 4/8/18.
//

import UIKit

class ChildLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var childIDTF: UITextField!
    
    
    let queryBuilder = DataQueryBuilder()
    @IBAction func loginBTN(_ sender: UIButton) {
        
        var correctData : [AddChild]?
        let whereClause = "emailID = '\(emailTF.text!)' and childID = '\(childIDTF.text!)'"
        // and childID = \(childIDTF.text!)
        queryBuilder!.setWhereClause(whereClause)
        correctData = AppDelegate.DBInstance.backendless.data.of(AddChild.self).find(queryBuilder) as? [AddChild]
        if correctData != nil {
            for data in correctData! {
                AppDelegate.childID = data.childID!
            }
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "childLoc") as! ChildLocationViewController
            appDelegate.window?.rootViewController = viewController
        }
        else {
            let alert = UIAlertController(title: "Alert", message: "Invalid Credentials", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)        }
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
