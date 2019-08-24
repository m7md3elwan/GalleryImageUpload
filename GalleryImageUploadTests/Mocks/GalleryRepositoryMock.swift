//
//  GalleryRepositoryMock.swift
//  GalleryImageUploadTests
//
//  Created by Mohamed Mostafa on 8/18/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import Mockit
import Quick
import Nimble

@testable import GalleryImageUpload

class GalleryRepositoryMock: Mock, GalleryRepositoryProtocol {
    
    // required by Mockit framework Mock protocol
    let callHandler: CallHandler
    
    // required by Mockit framework Mock protocol
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    // required by Mockit framework Mock protocol
    func instanceType() -> GalleryRepositoryProtocol {
        return self
    }
    
    func getGalleryImages(nextCursor: String, success: @escaping (ImagesWrapper) -> Void, fail: @escaping (GalleryApiClientError?) -> Void) {
        callHandler.accept(nil,ofFunction: #function, atFile: #file, inLine: #line, withArgs: nextCursor, success, fail)
    }
    
    func uploadImage(base64Image: String, success: @escaping (GalleryImage) -> Void, fail: @escaping (GalleryApiClientError?) -> Void) {
        callHandler.accept(nil,ofFunction: #function, atFile: #file, inLine: #line, withArgs: base64Image, success, fail)
    }

}
