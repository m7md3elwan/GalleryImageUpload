//
//  GalleryImage.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

class GalleryImage: Codable {
    let id: String
    let url: String
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "public_id"
        case url
        case width
        case height
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        url = try container.decode(String.self, forKey: .url)
        
        width = try container.decodeIfPresent(Int.self, forKey: .width)
        height = try container.decodeIfPresent(Int.self, forKey: .height)
    }
}

extension GalleryImage: Equatable {
    static func == (lhs: GalleryImage, rhs: GalleryImage) -> Bool {
        return lhs.url == rhs.url
    }
}
