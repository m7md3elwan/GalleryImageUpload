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
        static let imageCellName = "GalleryImageCollectionViewCell"
        static let iPadCellSize: CGFloat = 320
    }
    
    // MARK:- Properties
    var presenter: GalleryPresenterProtocol?
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(GalleryView.loadImages), for: .valueChanged)
        return refreshControl
    } ()
    
    // MARK: Outlets
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        registerCollectionViewCells()
        addRefreshControlToCollectionView()
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    // MARK: Private Methods
    fileprivate func registerCollectionViewCells() {
        let imageCellNib = UINib(nibName: Constants.imageCellName, bundle: Bundle.main)
        collectionView.register(imageCellNib, forCellWithReuseIdentifier: Constants.imageCellName)
    }
    
    fileprivate func addRefreshControlToCollectionView() {
        collectionView.addSubview(refreshControl)
    }
    
    @objc fileprivate func loadImages() {
        presenter?.viewLoaded()
    }
    // MARK: Actions
}

// MARK:- GalleryViewProtocol
extension GalleryView: GalleryViewProtocol {
    func reloadView() {
        collectionView.reloadData()
    }
    
    func addNextPageLoader(completion: (() -> ())?) {
        collectionView.addInfiniteScroll { (_) in
            completion?()
        }
    }
    
    func removeNextPageLoader() {
        collectionView.removeInfiniteScroll()
    }
}

// MARK:- UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
extension GalleryView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.imageCellName, for: indexPath) as! GalleryImageCollectionViewCell
        cell.configure(image: presenter!.itemAt(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: Constants.iPadCellSize, height: Constants.iPadCellSize)
        }
        return CGSize(width: self.view.frame.width, height: self.view.frame.width)
    }
    
}
