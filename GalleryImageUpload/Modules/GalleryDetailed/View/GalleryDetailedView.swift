//
//  GalleryDetailedView.swift
//  Parent
//
//  Created by Elwan on 09/09/2019.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation
import UIKit
import MEDataLoader

class GalleryDetailedView: UIViewController {
    
    // MARK:- Constants
    struct Constants {
    }
    
    // MARK:- Properties
    var presenter: GalleryDetailedPresenterProtocol?
    var imageFetcher: ImageFetchable! = MEDataLoader.shared
    var image: GalleryImage!
    
    // MARK: Outlets
    @IBOutlet var imageView: UIImageView!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    // MARK: Private Methods
    // MARK: Actions
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK:- GalleryDetailedViewProtocol
extension GalleryDetailedView: GalleryDetailedViewProtocol {
    func showImage(url: URL) {
        imageView.image = UIImage(asset: .imagePlaceholder)
        
        imageFetcher?.getImage(with: url, completion: {[weak self] (galleryImage) in
            Dispatch.onMainThread {
                self?.imageView.image = galleryImage ?? UIImage(asset: .errorImage)
            }
        })
    }
}
