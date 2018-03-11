//
//  AddChildViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/10/18.
//

import UIKit

class AddChildViewController: UIViewController {

    @IBOutlet weak var childNameTF: UITextField!
    
    @IBOutlet weak var childIDTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addChildBTN(_ sender: UIButton) {
    
        
        if childNameTF.text! != "" && childIDTF.text! != "" {
            let childRef : AddChild = AddChild()
            childRef.childID = childIDTF.text!
            childRef.childName = childNameTF.text!
            childRef.emailID = AppDelegate.DBInstance.backendless.userService.currentUser.email! as String
        AppDelegate.DBInstance.backendless.data.of(AddChild.self).save(childRef , response: { (result : (Any?)) -> Void  in
            let child = result as! AddChild;
            print("\(String(describing: child.childID))")
            print("\(String(describing: result))")
            },
            error: { ( fault : Fault?) -> () in
            print("Server reported an error: \(String(describing: fault))")
            })
            let alert = UIAlertController(title : "Alert", message: "Sucessfully added child.",preferredStyle : UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    self.performSegue(withIdentifier: "unwindSegue", sender: self)
            }
        else{
            let alert = UIAlertController(title : "Alert", message: "Please enter all the fields.",preferredStyle : UIAlertControllerStyle.alert)
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
    @IBAction func cancelBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
}
