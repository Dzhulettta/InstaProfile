//
//  SettingTableViewController.swift
//  new
//
//  Created by Юлия Чужинова on 10.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet var settingTable: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var volSlider: UISlider!
    
    
    let nameKey = "nameKey"
    let locationKey = "locationKey"
    let soundKey = "soundKey"
    let volKey = "volKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTable.delegate = self
        loadSetting()
        
        settingTable.tableFooterView = UIView()
    }
    func loadSetting(){
        if let name = UserDefaults.standard.string(forKey: nameKey){
            nameTextField.text = name
        } else {
            nameTextField.text = "Julia Chuzhinova"
        }
        if let location = UserDefaults.standard.string(forKey: locationKey){
            locationTextField.text = location
        } else {
            locationTextField.text = "I live in Russia"
        }
        soundSwitch.isOn = UserDefaults.standard.bool(forKey: soundKey)
        volSlider.value = UserDefaults.standard.float(forKey: volKey)
    }
    
    @IBAction func changeName(_ sender: UITextField) {
        if sender.text != nil {
            UserDefaults.standard.set(sender.text!, forKey: nameKey)
        }
    }
    
    @IBAction func changeLocation(_ sender: UITextField) {
    if sender.text != nil {
            UserDefaults.standard.set(sender.text!, forKey: locationKey)
        }
    }
    
    @IBAction func changeSound(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
    }
    
    @IBAction func changeVol(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volKey)
    }
}
