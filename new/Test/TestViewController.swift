//
//  TestViewController.swift
//  new
//
//  Created by Юлия Чужинова on 09.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testCollection: UICollectionView!
    var fotos = FotoTest()
    override func viewDidLoad() {
        super.viewDidLoad()
        testCollection.delegate = self
        testCollection.dataSource = self
        
        testCollection.register(UINib(nibName: "Test2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Test2CollectionViewCell")
     
    }
    

}
extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotos.fotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Test2CollectionViewCell", for: indexPath) as! Test2CollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: CGFloat(40), height: CGFloat(40))
    }
    
}
