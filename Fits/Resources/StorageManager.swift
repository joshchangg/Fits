//
//  StorageManager.swift
//  Fits
//
//  Created by Joshua Chang  on 12/5/21.
//

import FirebaseStorage

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum FitsStorageManagerError: Error {
        case failedToDownload
    }
    
    // Mark: - Public
    
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL,Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL, FitsStorageManagerError>) -> Void) {
        bucket.child(reference).downloadURL(completion: {url, error in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        })
    }
    
}

