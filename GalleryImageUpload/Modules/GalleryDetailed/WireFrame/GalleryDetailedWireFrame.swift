//
//  GalleryDetailedWireFrame.swift
//  Parent
//
//  Created by Elwan on 09/09/2019.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation

class GalleryDetailedWireFrame: GalleryDetailedWireFrameProtocol {
	
	// MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "GalleryDetailedView"
    }
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createGalleryDetailedView(selectedImageUrl: URL) -> GalleryDetailedView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! GalleryDetailedView
        let presenter: GalleryDetailedPresenterProtocol & GalleryDetailedInteractorOutputProtocol = GalleryDetailedPresenter()
        let interactor: GalleryDetailedInteractorInputProtocol = GalleryDetailedInteractor(selectedImageUrl: selectedImageUrl)
        let apiDataManager: GalleryDetailedAPIDataManagerInputProtocol = GalleryDetailedAPIDataManager()
        let localDataManager: GalleryDetailedLocalDataManagerInputProtocol = GalleryDetailedLocalDataManager()
        let wireFrame: GalleryDetailedWireFrameProtocol = GalleryDetailedWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = apiDataManager
        interactor.localDatamanager = localDataManager
        
        return view
    }
    
    static var storyBoard: UIStoryboard {
        get {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
            }else{
                return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
            }
        }
    }
}
