//
//  ViewController.swift
//  SwiftCamera
//
//  Created by Naoki Arakawa on 2019/02/22.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //アルバムにアクセスするための通知メッセージで定型文
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status) {
                
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
                
            }
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[ .originalImage] as? UIImage
        {
            backImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
     
        
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openCamera(_ sender: Any) {
        
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            
             //最後の１行でカメラを呼び出していて、その上は下準備である
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    
    }
    
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            
            //最後の１行でカメラを呼び出していて、その上は下準備である
            self.present(cameraPicker, animated: true, completion: nil)
            
        }

    }
    
    @IBAction func share(_ sender: Any) {
        
        let text = ""
        let url = NSURL(string: "http://www.apple.com")
        
        //次にこの２つを辞書型として入れる
        //これを外部のSNSに飛ばす
        let item = [text, url, backImageView.image] as [Any]
        
        //インスタンス化を行う
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    

}

