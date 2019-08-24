# GalleryImageUpload

Implementaion of 
https://github.com/sparknetworks/coding_exercises_options/tree/master/gallery_images_upload

## Server Side
Cloudinary(https://cloudinary.com/) was used to host images upload & retrieval

- Retrieve request Api
	- GET https://api.cloudinary.com/v1_1/elwan/resources/image?next_cursor=c822bb9ee377035a5e650d9b1f5a64d6cec39ab964745e02819a2e8ab002d510
  where next_cursor is returned with response to get next page of images

- Upload photo Api
  - Post	https://api.cloudinary.com/v1_1/elwan/image/upload

## Cocoa pods used
- MEDataLoader (https://github.com/m7md3elwan/MEDataLoader)
  - Library that allow loading & caching of data from a remote URL
- Alamofire
- UIScrollView-InfiniteScroll'
- SwiftMessages
- GeometricLoaders
- Quick
- Nimble
- Mockit

## Author

m7md3elwan, eng.m.elwan@gmail.com

## License

MEDataLoader is available under the MIT license. See the LICENSE file for more info.
