//
//  InstallationViewController.swift
//  new
//
//  Created by Юлия Чужинова on 04.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class InstallationViewController: UIViewController {

    @IBOutlet weak var settingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingTable.delegate = self
        
    }

}

extension InstallationViewController: UITableViewDelegate {
    
}
