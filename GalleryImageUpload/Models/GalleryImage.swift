//
//  GalleryImage.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

class GalleryImage: Codable {
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "public_id"
        case url
        case width
        case height
    }
}
