//
//  FullGallaryCollectionViewCell.swift
//  new
//
//  Created by Юлия Чужинова on 10.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

class FullGallaryCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {

    @IBOutlet weak var bigImage: UIImageView!
    
    @IBOutlet weak var scrollBigImage: UIScrollView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollBigImage.delegate = self
        
        self.scrollBigImage.minimumZoomScale = 1.0
        self.scrollBigImage.maximumZoomScale = 4.0
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
     
        return bigImage
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat){
        scrollBigImage.zoomScale = 1.0
    }
    }

