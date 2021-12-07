//
//  DatabaseManager.swift
//  Fits
//
//  Created by Joshua Chang  on 12/5/21.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // Mark: - Public
    
    /// Check if username and email is available
    /// Parameters
    ///     email: String representing email
    ///     username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Adds new user data to database
    /// Parameters
    ///     email: String representing email
    ///     username: String representing username
    ///     completion: Async callback for result if database entry succeeded
    public func addNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        print(key)
        database.child(key).setValue(["username": username]) {error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
}
