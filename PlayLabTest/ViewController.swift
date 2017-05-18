//
//  ViewController.swift
//  PlayLabTest
//
//  Created by Amorn Apichattanakul on 5/16/17.
//  Copyright © 2017 Amorn Apichattanakul. All rights reserved.
//

import UIKit
import SwiftSocket
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var responseText: UILabel!

    var greetingText: Greeting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SocketManager.sharedInstance.connect { [weak self] greeting in
            self?.statusText.text = "Connected"
            self?.greetingText = greeting
            self?.responseText.text = greeting.welcomeText
        }
    }
    
    @IBAction func getData() {
        SocketManager.sharedInstance.get(.getUser)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

