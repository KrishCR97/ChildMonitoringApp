//
//  ViewController.swift
//  SegueTest
//
//  Created by student on 3/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func demoBTN(_ sender: UIButton) {
        self.performSegue(withIdentifier: "seg", sender: self)    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

