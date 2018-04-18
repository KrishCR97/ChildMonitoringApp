//
//  UpdateIntervalViewController.swift
//  ChildrenMonitoringSystem
//
//  Created by Mucherla,Veera Kishon Kumar on 4/4/18.
//

import UIKit

@available(iOS 10.0, *)
class UpdateIntervalViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var intervals : [String] = ["Bar","Pub","Club"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return intervals.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(intervals[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(intervals[row])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge], completionHandler: {didAllow,error in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @available(iOS 10.0, *)
    @IBAction func setLocationBTN(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "Alert From CMS APP"
        content.body = "Your Child is at restricted premises"
        content.subtitle = "Keep an eye on the child"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
     UNUserNotificationCenter.current().add(request,withCompletionHandler : nil)
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
