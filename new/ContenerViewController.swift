//
//  ContenerViewController.swift
//  new
//
//  Created by Юлия Чужинова on 11.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

struct  KeyFriends {
    static let name = "name"
    static let city = "city"
    static let six = "six"
}

class ContenerViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var sixTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func addFriendButton(_ sender: Any) {
        let name = nameTextField.text!
        let city = cityTextField.text!
        let six = sixTextField.text!
        if !name.isEmpty && !city.isEmpty && !six.isEmpty {
            ContactList.shared.saveContact(name: name, city: city, six: six)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = defaults.string(forKey: KeyFriends.name)
        cityTextField.text = defaults.string(forKey: KeyFriends.city)
        sixTextField.text = defaults.string(forKey: KeyFriends.six)
    }
        
}
