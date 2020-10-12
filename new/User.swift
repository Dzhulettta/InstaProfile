//
//  User.swift
//  new
//
//  Created by Юлия Чужинова on 10.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import UIKit

enum Gender {
    case male
    case female
}
class User: NSObject {
    let name: String
    let city: String
    let six: Gender
    let image: UIImage
    init(name: String, city: String, six: Gender, image: UIImage) {
        self.name = name
        self.city = city
        self.six = six
        self.image = image
    }
}
