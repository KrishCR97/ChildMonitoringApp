//
//  ChangeUserNameViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/24/18.
//

import UIKit

class ChangeUserNameViewController: UIViewController {

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
        
        self.performSegue(withIdentifier: "unwindCUNSegue", sender: self)
    }
}
