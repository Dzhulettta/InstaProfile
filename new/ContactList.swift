//
//  ContactList.swift
//  new
//
//  Created by Юлия Чужинова on 12.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation
import UIKit

class ContactList{

    let defaults = UserDefaults.standard
    static let shared = ContactList()
    
    struct UserContacts: Codable {
        var name: String
        var city: String
        var six: String
        var contact: String{
            return "\(name), \(city), \(six)"
        }
    }
    var contacts: [UserContacts]{

        get {
            if let data = defaults.value(forKey: "contactListKey") as? Data{
               return try! PropertyListDecoder().decode([UserContacts].self, from: data)
            } else {
                return [UserContacts]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) as? Data{
                defaults.set(data, forKey: "contactListKey")
            }
        }
    }
    
    func  saveContact(name: String, city: String, six: String) {
        let contact = UserContacts(name: name, city: city, six: six)
        contacts.append(contact)
    }

}
