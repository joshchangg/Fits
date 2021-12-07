//
//  PostViewController.swift
//  Fits
//
//  Created by Joshua Chang  on 12/4/21.
//

import Photos
import PhotosUI
import AVFoundation
import UIKit

class CameraViewController: UIViewController, PHPickerViewControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let profileCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        profileCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        return profileCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
        config.filter = .images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc,animated: true)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else {
                    return
                }
                print(image)
            }
        }
    }
}
