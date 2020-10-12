//
//  DetailViewController.swift
//  new
//
//  Created by Юлия Чужинова on 10.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var fullGallaryCollection: UICollectionView!
    var fotoGallary: Gallary!
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullGallaryCollection.delegate = self
        fullGallaryCollection.dataSource = self
        
        fullGallaryCollection.register(UINib(nibName: "FullGallaryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bigCell")
        
        fullGallaryCollection.performBatchUpdates(nil) {(result) in
            self.fullGallaryCollection.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
    }
}
extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotoGallary.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bigCell", for: indexPath) as! FullGallaryCollectionViewCell
        cell.bigImage.image = fotoGallary.images[indexPath.item]
       
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCell = collectionView.frame
        let widthCell = frameCell.width
        let hightCell = widthCell

        return CGSize(width: widthCell, height: hightCell)

    }

    
    
}
