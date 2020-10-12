//
//  File.swift
//  new
//
//  Created by Юлия Чужинова on 09.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import UIKit

class FotoTest{
    var fotos = [UIImage]()
    init() {
        funcInit()
    }
    func funcInit(){
        for i in 0...8{
            let foto = UIImage(named: "(\(i)")!
            fotos.append(foto)
        }
    }
}
