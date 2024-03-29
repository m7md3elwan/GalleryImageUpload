//
//  GalleryPresenter.swift
//  GalleryImageUpload
//
//  Created by Elwan on 08/12/2019.
//  Copyright © 2018 GalleryImageUpload. All rights reserved.
//


import Foundation

class GalleryPresenter {
    
    // MARK:- Properties
    weak var view: GalleryViewProtocol?
    var interactor: GalleryInteractorInputProtocol?
    var wireFrame: GalleryWireFrameProtocol?

    // MARK:- Methods
    // MARK: Private methods
    fileprivate func setLoadState(isLoading: Bool) {
        isLoading ? view?.showLoader() : view?.hideLoader()
    }
    
    fileprivate func galleryHasNextPage(nextPage: Bool) {
        if nextPage {
            view?.addNextPageLoader(completion: { [weak self] in
                self?.interactor?.loadImagesNextPage()
            })
        } else {
            view?.removeNextPageLoader()
        }
    }
}

// MARK:- GalleryPresenterProtocol
extension GalleryPresenter: GalleryPresenterProtocol {
    func viewLoaded() {
        interactor?.loadImages()
    }
    
    func numberOfItems() -> Int {
        return interactor?.gallaryLoadState.data.count ?? 0
    }
    
    func itemAt(index: Int) -> GalleryImage {
        return interactor!.gallaryLoadState.data[index]
    }
    
    func userDidSelectImageToUpload(image: UIImage) {
        view?.showLoader()
        interactor?.uploadImage(image: image)
    }
    
    func usedDidSelectItem(index: Int) {
        wireFrame?.openImageDetailedView(url: interactor!.gallaryLoadState.data[index].url!)
    }
}

// MARK:- GalleryInteractorOutputProtocol
extension GalleryPresenter: GalleryInteractorOutputProtocol {
    func errorOccured(error: GalleryApiClientError) {
        view?.hideLoader()
        view?.showErrorMessage(text: error.errorDescription ?? "")
    }
    
    func galleryUpdated() {
        view?.reloadView()
        setLoadState(isLoading: interactor!.gallaryLoadState.isLoading)
        galleryHasNextPage(nextPage: interactor!.gallaryLoadState.hasNextPage)
    }
}
