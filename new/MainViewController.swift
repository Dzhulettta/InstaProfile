//
//  MainViewController.swift
//  new
//
//  Created by Юлия Чужинова on 03.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var fotoImage: UIImageView!
    @IBOutlet weak var fotoCollection: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var fotosCount: UILabel!
    @IBOutlet weak var friendsCount: UILabel!
    
    let fotoGallary = Gallary()
    let identefireCell = "MainCollectionViewCell"
    let offset: CGFloat = 2.0
    let countCell = 3
    var imagePiker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fotoImage.layer.borderWidth = 2.0
        fotoImage.layer.borderColor = UIColor.lightGray.cgColor
        
        fotoCollection.delegate = self
        fotoCollection.dataSource = self
        
        fotoCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: identefireCell)
        
        imagePiker.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_sender:)))
        fotoImage.addGestureRecognizer(tapGesture)
        fotoImage.isUserInteractionEnabled = true
    }
    
    
    @objc func tapOnImage(_sender: UITapGestureRecognizer){
        let alert = UIAlertController(title: "Image", message: nil, preferredStyle: .actionSheet)
        let actionFoto = UIAlertAction(title: "Foto gallary", style: .default) { (alert) in
            self.imagePiker.sourceType = .photoLibrary
            self.imagePiker.allowsEditing = true
            self.present(self.imagePiker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (alert) in
            self.imagePiker.sourceType = .camera
            self.present(self.imagePiker, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionFoto)
        alert.addAction(actionCamera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = UserDefaults.standard.string(forKey: "nameKey") ?? "Julia Chuzhinova"
        locationLabel.text = UserDefaults.standard.string(forKey: "locationKey") ?? "I live in Russia"
        //MARK: - как сделать, чтобы эти данные подгружались до запуска FriendsViewController
        DispatchQueue.main.async {
            self.friendsCount.text = UserDefaults.standard.string(forKey: "friendsKey") ?? "..."
        }
       
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fotosCount.text = "\(fotoGallary.images.count)"
        return fotoGallary.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identefireCell, for: indexPath) as! MainCollectionViewCell
        cell.fotoImageCell.image = fotoGallary.images[indexPath.item]
       
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCell = collectionView.frame
        let widthCell = frameCell.width / CGFloat(countCell)
        let hightCell = widthCell
        let spasing = CGFloat(countCell + 1) * offset / CGFloat(countCell) 

        return CGSize(width: widthCell - spasing, height: hightCell - (offset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.fotoGallary = fotoGallary
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let picketImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            fotoImage.image = picketImage
        }
        dismiss(animated: true, completion: nil)
    }
}
