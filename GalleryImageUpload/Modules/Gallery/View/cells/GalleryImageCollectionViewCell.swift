//
//  GalleryImageCollectionViewCell.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import UIKit
import MEDataLoader

class GalleryImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mainImageView: UIImageView!
    var imageFetcher: ImageFetchable!
    var image: GalleryImage!
    
    func configure(image: GalleryImage, imageFetcher: ImageFetchable = MEDataLoader.shared) {
        self.image = image
        self.imageFetcher = imageFetcher
        
        setGalleryImage(image: image)
    }
    
    func setGalleryImage(image: GalleryImage) {
        mainImageView.image = UIImage(asset: .imagePlaceholder)
        
        imageFetcher?.getImage(with: image.url!, completion: {[weak self, url = image.url] (galleryImage) in
            if url == self?.image.url {
                Dispatch.onMainThread {
                    self?.mainImageView.image = galleryImage ?? UIImage(asset: .errorImage)
                }
            }
        })
    }
    
}
