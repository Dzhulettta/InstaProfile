//
//  ProfileViewController.swift
//  new
//
//  Created by Юлия Чужинова on 11.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var fotoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var user: User!
    var six: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoImage.image = user.image
        nameLabel.text = user.name
        cityLabel.text = "I live in \(user.city)"
        six = "\(user.six)"
        fotoImage.layer.borderWidth = 1.5
    
        if six == "male"{
            fotoImage.layer.borderColor = UIColor.gray.cgColor
        } else {
            fotoImage.layer.borderColor = UIColor.magenta.cgColor
        }
    }
}
