//
//  ImagesWrapper.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

class ImagesWrapper: Codable {
    var images = [GalleryImage]()
    let nextCursor: String?
    
    enum CodingKeys: String, CodingKey {
        case images = "resources"
        case nextCursor = "next_cursor"
    }
    
    init(images: [GalleryImage], nextCursor: String?) {
        self.images = images
        self.nextCursor = nextCursor
    }
}
