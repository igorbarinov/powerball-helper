//
//  TodayViewController.swift
//  PowerballWidget
//
//  Created by Igor Barinov on 9/27/14.
//  Copyright (c) 2014 Igor Barinov. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        println("ok")
        // Do any additional setup after loading the view from its nib.
       // getLastDraw()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLastDraw() -> String {
        var ref = Firebase(url:"https://swift-hackathon.firebaseio.com/powerball")
        println("test")
        
        var alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
        var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
        
        var usersRef = ref.childByAppendingPath("users")
        
        var users = ["alanisawesome": alanisawesome, "gracehop": gracehop]
        usersRef.setValue(users)
        
        var result = ""
        return result

    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
