# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def testingPods
  pod 'Quick'
  pod 'Nimble'
end

target 'GalleryImageUpload' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'UIScrollView-InfiniteScroll'
  pod 'Alamofire'
  pod 'SwiftMessages', '5.0.0'
  pod 'MEDataLoader'
  pod 'GeometricLoaders'

  target 'GalleryImageUploadTests' do
    inherit! :search_paths
    testingPods
  end

end
