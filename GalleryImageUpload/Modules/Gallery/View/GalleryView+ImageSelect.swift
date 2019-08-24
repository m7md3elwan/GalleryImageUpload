//
//  GalleryView+ImageSelect.swift
//  GalleryImageUpload
//
//  Created by Mohamed Mostafa on 8/13/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation
import MobileCoreServices

extension GalleryView {
    func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "oK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func openImageOptionsPicker(sourceView: UIBarButtonItem) {
        let alert = UIAlertController(title: "Choose image", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Take using camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Select from gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        if let presenter = alert.popoverPresentationController {
            presenter.barButtonItem = sourceView
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK:- UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension GalleryView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated:true, completion: nil)
        if let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String {
            if mediaType  == "public.image" {
                let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage ?? info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                presenter?.userDidSelectImageToUpload(image: selectedImage)
            }
        }
    }
}

