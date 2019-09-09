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
    func numberOfItems() -> Int
    func itemAt(index: Int) -> GalleryImage
    
    func userDidSelectImageToUpload(image: UIImage)
    func usedDidSelectItem(index: Int)
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
    func uploadImage(image: UIImage)
}

// MARK:- Wireframe Protocols
protocol GalleryWireFrameProtocol: class {
    var view: UIViewController? { get set }
    static func createGalleryView() -> GalleryView
    func openImageDetailedView(url: URL)
}

// MARK:- Repository Protocols
protocol GalleryRepositoryProtocol: class {
    func getGalleryImages(nextCursor: String, success:@escaping (ImagesWrapper)-> Void, fail:@escaping(GalleryApiClientError?) -> Void)
    func uploadImage(base64Image: String, success:@escaping (GalleryImage)-> Void, fail:@escaping(GalleryApiClientError?) -> Void)
}
