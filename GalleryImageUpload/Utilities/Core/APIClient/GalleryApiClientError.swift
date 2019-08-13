//
//  GalleryApiClientError.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

enum GalleryApiClientError: LocalizedError {
    case technicalDifficulties
    case serverError(message:String, code: Int)
    
    public var errorDescription: String? {
        switch self {
        case .technicalDifficulties:
            return "Technical Difficulties Error"
        case .serverError(let message, let code):
            return "Server Error: \(message), code: \(code)"
        }
    }
}
