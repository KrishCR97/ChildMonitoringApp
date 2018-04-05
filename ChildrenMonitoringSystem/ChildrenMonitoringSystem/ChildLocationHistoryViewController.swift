//
//  ChildLocationHistoryViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by Mucherla,Veera Kishon Kumar on 4/4/18.
//

import UIKit

class ChildLocationHistoryViewController: UIViewController,UITableViewDataSource{
    var names : [String] = ["One" , "Two" , "Three"]
    var numbers : [Int] = [1,2,3]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_loc")
        let nameLBL = cell?.viewWithTag(101) as! UILabel
        let numberLBL = cell?.viewWithTag(102) as! UILabel
        nameLBL.text = names[indexPath.row]
        numberLBL.text = "\(numbers[indexPath.row])"
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

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

}
