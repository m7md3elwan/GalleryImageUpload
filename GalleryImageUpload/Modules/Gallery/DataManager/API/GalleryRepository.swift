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
    
    func uploadImage(base64Image: String, success:@escaping (GalleryImage)-> Void, fail:@escaping(GalleryApiClientError?) -> Void) {
        
        let params: [String: Any] = ["file": base64Image,
                                     "upload_preset": "elwanUnsigned"]
        
        let path = GalleryApiClient.Endpoints.uploadImage.rawValue
        
        apiService.execute(path: path, method: .post, parameters: params) { (image: GalleryImage?, error) in
            if let image = image {
                success(image)
            } else {
                fail(error)
            }
        }
    }
}
