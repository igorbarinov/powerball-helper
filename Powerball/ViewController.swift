//
//  ViewController.swift
//  Powerball
//
//  Created by Igor Barinov on 9/27/14.
//  Copyright (c) 2014 Igor Barinov. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    
    @IBOutlet var labelNumber1 : UILabel!
    @IBOutlet var labelNumber2 : UILabel!
    @IBOutlet var labelNumber3 : UILabel!
    @IBOutlet var labelNumber4 : UILabel!
    @IBOutlet var labelNumber5 : UILabel!
    @IBOutlet var labelPower: UILabel!
    
    @IBOutlet var prayView: UIImageView!
    
    @IBAction func drawTapped(sender: AnyObject){

            var array: [Int] = []
            for x in 1...6
            {
                var diceRoll = 1 + Int(arc4random_uniform(58))
                array.append(diceRoll)
            }
            
            var powerRoll = 1 + Int(arc4random_uniform(34))
            array.append(powerRoll)
            
        labelNumber1.text = String(array[0])
        labelNumber2.text = String(array[1])
        labelNumber3.text = String(array[2])
        labelNumber4.text = String(array[3])
        labelNumber5.text = String(array[4])
        labelPower.text = String(array[5])
        labelPower.textColor = UIColor.whiteColor()
        prayView.hidden = true
        
    }
    @IBAction func prayTapped(sender: AnyObject){
    
        var alert = UIAlertController(title: "EULA", message: "You press OK. \n We pray for your numbers.\nIf you win we get 1% of your prize.\n Press OK.", preferredStyle: UIAlertControllerStyle.Alert)

        self.presentViewController(alert, animated: true, completion: nil)
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { action in
            switch action.style{
            case .Default:
                
                self.showPray(enabled: true)
                
            case .Cancel:
                println("cancel")
                
            case .Destructive:
                println("destructive")
            }
        }))

 
        
    }
    
    func generateRandom() -> [Int]{
        var array: [Int] = []
        for x in 1...6
        {
            var diceRoll = 1 + Int(arc4random_uniform(59))
            array.append(diceRoll)
        }
        

        var powerRoll = 1 + Int(arc4random_uniform(35))
        array.append(powerRoll)
        return array
    }
    
    func initLabels() {
        labelNumber1.text = ""
        labelNumber2.text = ""
        labelNumber3.text = ""
        labelNumber4.text = ""
        labelNumber5.text = ""
        labelPower.text = ""
    }
    
    
   
    
    func showPray(enabled:Bool = true) {
        
        var imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("pray", withExtension: "gif")!)
        let pray = UIImage.animatedImageWithData(imageData)
        prayView.image = pray
        prayView.hidden = false

       // var imageView = UIImageView(image: pray)
       // imageView.frame = CGRect(x: 10.0, y: 350.0, width: 350.0, height: 202.0)
       // view.addSubview(imageView)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initLabels()

    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

