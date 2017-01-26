//
//  ViewController.swift
//  Xcode83_Demo
//
//  Created by Shashikant Jagtap on 25/01/2017.
//  Copyright © 2017 Shashikant Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var LazyHello: UITextField!
    
    let randomNum:UInt32 = arc4random_uniform(5)
    
    @IBAction func lazyButton(_ sender: Any) {
        
        sleep(randomNum)
        LazyHello.text = "Hello"
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

