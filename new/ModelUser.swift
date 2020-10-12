//
//  ModelUser.swift
//  new
//
//  Created by Юлия Чужинова on 10.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import UIKit

class ModelUser{
    var users = [User]()
    init() {
         setup()
    }
    func setup(){
    let name1 = User(name: "Nataly", city: "Moscow", six: .female, image: UIImage(named: "w")!)
    let name2 = User(name: "Ivan", city: "Voronezh", six: .male, image: UIImage(named: "m")!)
    let name3 = User(name: "Irina", city: "Ufa", six: .female, image: UIImage(named: "w")!)
    let name4 = User(name: "Nikolay", city: "Orel", six: .male, image: UIImage(named: "m")!)
        users.append(name1)
        users.append(name2)
        users.append(name3)
        users.append(name4)
    }
   
}
