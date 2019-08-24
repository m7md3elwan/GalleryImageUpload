//
//  GalleryInteractorTests.swift
//  GalleryImageUploadTests
//
//  Created by Mohamed Mostafa on 8/23/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Mockit

@testable import GalleryImageUpload

class GalleryInteractorTests: QuickSpec {
    override func spec() {
        
        var interactor: GalleryInteractor!
        var repository: GalleryRepositoryMock!
        
        // MARK:- Text data
        let image1 = GalleryImage(id: "id1", url: "http://testUrl1")
        let image2 = GalleryImage(id: "id2", url: "http://testUrl2")
        let image3 = GalleryImage(id: "id3", url: "http://testUrl3")
        let image4 = GalleryImage(id: "id4", url: "http://testUrl4")
        let image5 = GalleryImage(id: "id5", url: "http://testUrl5")
        
        let successDummyCompletionHandler: (ImagesWrapper) -> Void = { (wrapper) -> Void in }
        let failDummyCompletionHandler: (GalleryApiClientError?) -> Void = { (error) -> Void in }
        
        
        // MARK:- Testing GalleryInteractor
        describe("testing GalleryInteractor") {
            
            beforeEach {
                interactor = GalleryInteractor.init()
                repository = GalleryRepositoryMock(testCase: self)
                interactor.repository = repository
            }
            
            context("Loading data Successfully with next cursor") {
                
                beforeEach {
                    _ = repository.when().call(withReturnValue: repository.getGalleryImages(nextCursor: "", success: successDummyCompletionHandler, fail: failDummyCompletionHandler), andArgumentMatching: [Anything(), Anything(), Anything()]).thenDo({ (args:[Any?]) in
                        if let comp = args[1] as? (ImagesWrapper) -> Void {
                            comp(ImagesWrapper.init(images: [image1, image2, image3], nextCursor: nil))
                        }
                    })
                    interactor!.loadImages()
                }
                
                
                it("Should return data of 3 images") { // [image1, image2, image3] returned from Mocked repository
                    expect(interactor!.gallaryLoadState.data.count).to(equal(3))
                }
                
                it("hasNexPage should be true if there is nextCursor returned") {
                    expect(interactor!.gallaryLoadState.hasNextPage).to(equal(false))
                }
            }
            
            context("Loading data Successfully with no next cursor") {
                
                beforeEach {
                    _ = repository.when().call(withReturnValue: repository.getGalleryImages(nextCursor: "", success: successDummyCompletionHandler, fail: failDummyCompletionHandler), andArgumentMatching: [Exact(), Anything(), Anything()]).thenDo({ (args:[Any?]) in
                        if let comp = args[1] as? (ImagesWrapper) -> Void {
                            comp(ImagesWrapper.init(images: [image1, image2, image3], nextCursor: "nextCursor"))
                        }
                    })
                    
                    _ = repository.when().call(withReturnValue: repository.getGalleryImages(nextCursor: "nextCursor", success: successDummyCompletionHandler, fail: failDummyCompletionHandler), andArgumentMatching: [Exact(), Anything(), Anything()]).thenDo({ (args:[Any?]) in
                        if let comp = args[1] as? (ImagesWrapper) -> Void {
                            comp(ImagesWrapper.init(images: [image3, image4, image5], nextCursor: "nextCursor1"))
                        }
                    })
                    
                    interactor!.loadImages()
                }
                
                
                it("Should return data of 3 images") { // [image1, image2, image3] returned from Mocked repository
                    expect(interactor!.gallaryLoadState.data.count).to(equal(3))
                }
                
                it("hasNexPage should be false if there is no nextCursor returned") {
                    expect(interactor!.gallaryLoadState.hasNextPage).to(equal(true))
                }
                
                /*
                 [image1, image2, image3, image4, image5] should be stored as image3 has the same url so it should be discarded
                 */
                it("Should return data of 5 images after geting next page") {
                    interactor!.loadImagesNextPage()
                    expect(interactor!.gallaryLoadState.data.count).to(equal(5))
                }
            }
            
            afterEach {
                interactor = nil
            }
        }
    }
}
