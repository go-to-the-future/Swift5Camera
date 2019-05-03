//
//  ViewController.swift
//  Swift5Camera
//
//  Created by Kiyoto Ryuman on 2019/05/03.
//  Copyright © 2019 Kiyoto Ryuman. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PHPhotoLibrary.requestAuthorization{(status) in
            
            switch(status){
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage{
            backImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func openCamera(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType =
        UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func share(_ sender: Any) {
        
        let text = ""
        let url = NSURL(string: "http://www.apple.com")
        
        let items = [text,url,backImageView.image] as [Any]
        
        let activityVC = UIActivityViewController(activityItems:items , applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
}

