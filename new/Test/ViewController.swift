//
//  ViewController.swift
//  new
//
//  Created by Юлия Чужинова on 03.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBAction func button(_ sender: UIButton) {
        if textField.text != "" {
            label.text = "Hello, \(String(describing: textField.text!))!"
        } else {
            label.text = "Hello, everyone!"
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func slider(_ sender: UISlider) {
        sender.maximumValue = 30
        sender.minimumValue = 10
        label.font = label.font.withSize(CGFloat((Int(sender.value))))
            //UIFont(name: "\(label.text)", size: CGFloat(Int(sender.value) * 10))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forVC4" {
            var text = textField.text!
            var textVC4 = segue.destination as! ViewController4
            textVC4.forVC = text
        }
    }

}

