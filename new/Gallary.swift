//
//  Gallary.swift
//  new
//
//  Created by Юлия Чужинова on 08.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import UIKit

class Gallary {
    var images = [UIImage]()
    
    init() {
        setupGallary()
    }
    func setupGallary() {
        for item in 1...15 {
            let image = UIImage(named: "\(item)")!
            images.append(image)
        }
    }
}
