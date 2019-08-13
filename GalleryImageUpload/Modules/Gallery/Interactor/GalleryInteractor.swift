//
//  GalleryInteractor.swift
//  GalleryImageUpload
//
//  Created by Elwan on 08/12/2019.
//  Copyright © 2018 GalleryImageUpload. All rights reserved.
//

import Foundation

class GalleryInteractor {
    
    // MARK:- Properties
    weak var presenter: GalleryInteractorOutputProtocol?
    var repository: GalleryRepositoryProtocol?
    
    var gallaryLoadState: PaginatedDataLoadState<GalleryImage> = .loading {
        didSet {
            presenter?.galleryUpdated()
        }
    }
}

// MARK:- GalleryInteractorInputProtocol
extension GalleryInteractor: GalleryInteractorInputProtocol {    
    func loadImages() {
        gallaryLoadState = .loading
        loadImagesNextPage()
    }
    
    func loadImagesNextPage() {
        
        let nextPageCursor = gallaryLoadState.nextCursor
        
        repository?.getGalleryImages(nextCursor: nextPageCursor, success: { (wrapper) in
            let loadedImages = self.gallaryLoadState.data
            let newImages = wrapper.images.filter{!Set(loadedImages.map{$0.url}).contains($0.url) }
            let totalImages = loadedImages + newImages
            
            if let cursor = wrapper.nextCursor {
                self.gallaryLoadState = PaginatedDataLoadState.paging(totalImages, nextCursor: cursor)
            } else {
                self.gallaryLoadState = PaginatedDataLoadState.populated(totalImages)
            }
            
        }, fail: { (error) in
            if let error = error {
                self.presenter?.errorOccured(error: error)
            }
        })
    }
}
