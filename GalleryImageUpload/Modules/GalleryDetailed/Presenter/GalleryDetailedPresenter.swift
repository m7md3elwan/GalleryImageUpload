//
//  GalleryDetailedPresenter.swift
//  Parent
//
//  Created by Elwan on 09/09/2019.
//  Copyright © 2018 Parent. All rights reserved.
//


import Foundation

class GalleryDetailedPresenter {
    
    // MARK:- Properties
    weak var view: GalleryDetailedViewProtocol?
    var interactor: GalleryDetailedInteractorInputProtocol?
    var wireFrame: GalleryDetailedWireFrameProtocol?

}

// MARK:- GalleryDetailedPresenterProtocol
extension GalleryDetailedPresenter: GalleryDetailedPresenterProtocol {
    func viewLoaded() {
        view?.showImage(url: interactor!.selectedImageUrl)
    }
}

// MARK:- GalleryDetailedInteractorOutputProtocol
extension GalleryDetailedPresenter: GalleryDetailedInteractorOutputProtocol {
    
}
