//
//  GalleryWireFrame.swift
//  Parent
//
//  Created by Elwan on 08/12/2019.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation
import UIKit

class GalleryWireFrame: GalleryWireFrameProtocol {
    
    // MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "GalleryView"
    }
    
    weak var view: UIViewController?
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createGalleryView() -> GalleryView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! GalleryView
        let presenter: GalleryPresenterProtocol & GalleryInteractorOutputProtocol = GalleryPresenter()
        let interactor: GalleryInteractorInputProtocol = GalleryInteractor()
        let galleryRepository: GalleryRepositoryProtocol = GalleryRepository()
        let wireFrame: GalleryWireFrameProtocol = GalleryWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        wireFrame.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.repository = galleryRepository
        
        return view
    }
    
    static var storyBoard: UIStoryboard {
        return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
    }
    
    func openImageDetailedView(url: URL) {
        let galleryDetailedView = GalleryDetailedWireFrame.createGalleryDetailedView(selectedImageUrl: url)
        view?.present(galleryDetailedView, animated: true, completion: nil)
    }
}
