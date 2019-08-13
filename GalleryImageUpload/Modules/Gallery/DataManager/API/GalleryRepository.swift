//
//  GalleryRepository.swift
//  GalleryImageUpload
//
//  Created by Elwan on 08/12/2019.
//  Copyright © 2018 GalleryImageUpload. All rights reserved.
//

import Foundation

class GalleryRepository: GalleryRepositoryProtocol {
    
    var apiService: ApiExecutable
    
    init(apiService: ApiExecutable = GalleryApiClient.shared) {
        self.apiService = apiService
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    func getGalleryImages(nextCursor: String, success:@escaping (ImagesWrapper)-> Void, fail:@escaping(GalleryApiClientError?) -> Void) {

        let params: [String: Any] = ["next_cursor": nextCursor]
        let path = GalleryApiClient.Endpoints.getImages.rawValue
        
        apiService.execute(path: path, method: .get, parameters: params) { (wrapper: ImagesWrapper?, error) in
            if let wrapper = wrapper {
                success(wrapper)
            } else {
                fail(error)
            }
        }
    }
}
