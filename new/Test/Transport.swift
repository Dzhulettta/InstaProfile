//
//  Transport.swift
//  new
//
//  Created by Юлия Чужинова on 03.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation

class Transport {
    var marka: String
    var wheel: Int
    
    init(marka: String, wheel: Int) {
        self.marka = marka
        self.wheel = wheel
    }
    func go() {
        print ("Едет")
    }
    func sing() {
        print ("Сигналит")
    }
}

class Auto: Transport {
    var color: String
    
    init(marka: String, wheel: Int, color: String) {
        self.color = color
        super.init(marka: marka, wheel: wheel)
        
    }
    override func go() {
        print ("Едет мотоцикл")
    }
}
