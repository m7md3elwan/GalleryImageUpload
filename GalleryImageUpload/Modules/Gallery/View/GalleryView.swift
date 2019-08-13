//
//  GalleryView.swift
//  GalleryImageUpload
//
//  Created by Elwan on 08/12/2019.
//  Copyright © 2018 GalleryImageUpload. All rights reserved.
//

import Foundation
import UIKit

class GalleryView: BaseViewController {
    
    // MARK:- Constants
    struct Constants {
    }
    
    // MARK:- Properties
    var presenter: GalleryPresenterProtocol?
    
    // MARK: Outlets
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    // MARK: Private Methods
    // MARK: Actions
}

// MARK:- GalleryViewProtocol
extension GalleryView: GalleryViewProtocol {
    func reloadView() {
        
    }
    
    func addNextPageLoader(completion: (() -> ())?) {
        
    }
    
    func removeNextPageLoader() {
        
    }
}
