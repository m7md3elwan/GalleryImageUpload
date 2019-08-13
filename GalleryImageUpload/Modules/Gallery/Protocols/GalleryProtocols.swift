//
//  GalleryProtocols.swift
//  GalleryImageUpload
//
//  Created by Elwan on 08/12/2019.
//  Copyright © 2018 GalleryImageUpload. All rights reserved.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol GalleryViewProtocol: class {
    var presenter: GalleryPresenterProtocol? { get set }
    
    func reloadView()
    func showLoader()
    func hideLoader()
    
    func addNextPageLoader(completion: (()->())?)
    func removeNextPageLoader()
    
    func showErrorMessage(text: String?)
    func showSuccessMessage(text: String?)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol GalleryPresenterProtocol: class {
    var view: GalleryViewProtocol? { get set }
    var interactor: GalleryInteractorInputProtocol? { get set }
    var wireFrame: GalleryWireFrameProtocol? { get set }
    
    func viewLoaded()

}

// MARK: Interactor -> Presenter
protocol GalleryInteractorOutputProtocol: class {
    func galleryUpdated()
    func errorOccured(error: GalleryApiClientError)
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol GalleryInteractorInputProtocol: class {
    var presenter: GalleryInteractorOutputProtocol? { get set }
    var repository: GalleryRepositoryProtocol? { get set }
    
    var gallaryLoadState: PaginatedDataLoadState<GalleryImage> { get }
    
    func loadImages()
    func loadImagesNextPage()
}

// MARK:- Wireframe Protocols
protocol GalleryWireFrameProtocol: class {
    static func createGalleryView() -> GalleryView
}

// MARK:- Repository Protocols
protocol GalleryRepositoryProtocol: class {
    func getGalleryImages(nextCursor: String, success:@escaping (ImagesWrapper)-> Void, fail:@escaping(GalleryApiClientError?) -> Void)
}
