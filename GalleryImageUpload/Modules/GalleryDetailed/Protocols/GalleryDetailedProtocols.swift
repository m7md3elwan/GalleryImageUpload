//
//  GalleryDetailedProtocols.swift
//  Parent
//
//  Created by Elwan on 09/09/2019.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol GalleryDetailedViewProtocol: class {
    var presenter: GalleryDetailedPresenterProtocol? { get set }
    
    func showImage(url: URL)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol GalleryDetailedPresenterProtocol: class {
    var view: GalleryDetailedViewProtocol? { get set }
    var interactor: GalleryDetailedInteractorInputProtocol? { get set }
    var wireFrame: GalleryDetailedWireFrameProtocol? { get set }
    
    func viewLoaded()
}

// MARK: Interactor -> Presenter
protocol GalleryDetailedInteractorOutputProtocol: class {
    
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol GalleryDetailedInteractorInputProtocol: class {
    var presenter: GalleryDetailedInteractorOutputProtocol? { get set }
    var APIDataManager: GalleryDetailedAPIDataManagerInputProtocol? { get set }
    var localDatamanager: GalleryDetailedLocalDataManagerInputProtocol? { get set }
    
    var selectedImageUrl: URL { get }
}

// MARK:- Wireframe Protocols
protocol GalleryDetailedWireFrameProtocol: class {
    static func createGalleryDetailedView(selectedImageUrl: URL) -> GalleryDetailedView
}

// MARK:- APIDATAMANAGER Protocols
protocol GalleryDetailedAPIDataManagerInputProtocol: class {
    
}

// MARK:- LocalDataManager Protocols
protocol GalleryDetailedLocalDataManagerInputProtocol: class {
    
}
