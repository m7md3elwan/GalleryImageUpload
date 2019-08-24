//
//  ImageAssetTests.swift
//  GalleryImageUploadTests
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import GalleryImageUpload

class ImageAssetTests: QuickSpec {
    override func spec() {
        describe("Testing ImageAsset") {
            context("Has images in ImageAsset") {
                it("Has non nil Image") {
                    for image in ImageAsset.allCases {
                        expect(UIImage(asset: image)).toNot(beNil(), description: "make sure to add \"\(image)\" in assets")
                    }
                }
            }
        }
    }
}
