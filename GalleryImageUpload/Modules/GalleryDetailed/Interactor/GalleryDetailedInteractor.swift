//
//  GalleryDetailedInteractor.swift
//  Parent
//
//  Created by Elwan on 09/09/2019.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation

class GalleryDetailedInteractor {
    
    // MARK:- Properties
    weak var presenter: GalleryDetailedInteractorOutputProtocol?
    var APIDataManager: GalleryDetailedAPIDataManagerInputProtocol?
    var localDatamanager: GalleryDetailedLocalDataManagerInputProtocol?

    let selectedImageUrl: URL
    
    init(selectedImageUrl: URL) {
        self.selectedImageUrl = selectedImageUrl
    }
    
}

// MARK:- GalleryDetailedInteractorInputProtocol
extension GalleryDetailedInteractor: GalleryDetailedInteractorInputProtocol {
        
}
