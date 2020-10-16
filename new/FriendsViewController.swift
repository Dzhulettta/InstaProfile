//
//  FriendsViewController.swift
//  new
//
//  Created by Юлия Чужинова on 10.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var modelUser = ModelUser()
    
    @IBOutlet weak var editFriendOutlet: UIBarButtonItem!
    @IBOutlet weak var addFriendOutlet: UIBarButtonItem!
    
    @IBAction func addFriend(_ sender: Any) {
        contenerView.isHidden = false
        editFriendOutlet.isEnabled = true
        editFriendOutlet.tintColor = .systemBlue
        addFriendOutlet.isEnabled = false
        addFriendOutlet.tintColor = .white
        
        tableView.reloadData()
        
    }
    
    @IBAction func editAddFriend(_ sender: Any) {
        contenerView.isHidden = true
        addFriendOutlet.isEnabled = true
        addFriendOutlet.tintColor = .systemBlue
        editFriendOutlet.isEnabled = false
        editFriendOutlet.tintColor = .white
        tableView.reloadData()
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var contenerView: UIView!
    
    let friendsKey = "friendsKey"
    var friendsCount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        contenerView.isHidden = true
        loadSetting()
        
        friendsCount = "\(modelUser.users.count)"
        
        editFriendOutlet.isEnabled = false
        editFriendOutlet.tintColor = .white
    }
    func loadSetting(){
           if let friendsCount = UserDefaults.standard.string(forKey: friendsKey){
            self.friendsCount = friendsCount
           }
    }
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactList.shared.contacts.count ?? modelUser.users.count
//        UserDefaults.standard.set("\(modelUser.users.count)", forKey: friendsKey)
//        return modelUser.users.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Friends (\(ContactList.shared.contacts.count))" ?? "Friends (\(modelUser.users.count))"
//        return "Friends (\(modelUser.users.count))"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UserTableViewCell!
        if let dCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell"){
            cell = dCell as! UserTableViewCell
        } else {
            cell = UserTableViewCell()
        }
        
//        let user = modelUser.users[indexPath.row]
        cell.nameLalel!.text = ContactList.shared.contacts[indexPath.row].name
        /////////////////////
         // cell.imageUser!.text = ContactList.shared.contacts[indexPath.row].name
        ////////////////////
//        cell.imageUser.image = user.image
//        cell.nameLalel.text = user.name
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = modelUser.users[indexPath.row]
        
        let alert = UIAlertController(title: "\(user.name)", message: "\(user.city)", preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "Profile", style: .default) { (alert) in
            self.performSegue(withIdentifier: "goToProfile", sender: indexPath)
        }
        let deliteAction = UIAlertAction(title: "Remove from friends", style: .destructive) { (alert) in
            self.modelUser.users.remove(at: indexPath.row)
            tableView.reloadData()
        }
        alert.addAction(profileAction)
        alert.addAction(deliteAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfile"{
        let vc = segue.destination as! ProfileViewController
        let indexPath = sender as! IndexPath
            
        let user = modelUser.users[indexPath.row]
            vc.user = user
        }
    }
    
}
