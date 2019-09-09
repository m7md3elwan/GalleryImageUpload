//
//  GalleryImage.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

enum CodableError: Error {
    case urlNotExist
}

class GalleryImage: Codable {
    let id: String
    let url: URL?
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
        
        let stringURL = try container.decode(String.self, forKey: .url)
        self.url = URL(string: stringURL)
        
        width = try container.decodeIfPresent(Int.self, forKey: .width)
        height = try container.decodeIfPresent(Int.self, forKey: .height)
    }
    
    init?(id: String, url: String, width: Int? = nil, height: Int? = nil) {
        self.id = id
        if let url = URL(string: url) {
            self.url = url
        } else {
            return nil
        }
        self.width = width
        self.height = height
    }
}

extension GalleryImage: Equatable {
    static func == (lhs: GalleryImage, rhs: GalleryImage) -> Bool {
        return lhs.url == rhs.url
    }
}
