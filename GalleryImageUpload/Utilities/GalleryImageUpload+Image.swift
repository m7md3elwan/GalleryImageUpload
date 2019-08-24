//
//  GalleryImageUpload+Image.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import UIKit

// allowing images to Strongly typed to decrease nil image crashes with the help of unit-testing
enum ImageAsset: String, CaseIterable {
    case imagePlaceholder = "image-placeholder"
    case errorImage = "errorImage"
}

extension UIImage {
    convenience init?(asset image: ImageAsset) {
        self.init(named: image.rawValue)
    }
}
