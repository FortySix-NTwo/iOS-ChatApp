//
//  AuthenticationService.swift
//  ChatApp
//
//  Created by Jonathan Farber on 18/11/2020.
//

import Firebase

struct AuthService {
  
  static func userSignup(credentials: AuthenticationModel, completionBlock: @escaping (_ success: Bool) -> Void)  {
    guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
    
    let filename = NSUUID().uuidString
    let filenameReference = STOREAGE.reference(withPath: "/profile_images/\(filename)")
    
    filenameReference.putData(imageData, metadata: nil) { (meta, error) in
      if error != nil {
        completionBlock(false)
      }
      
      filenameReference.downloadURL { (url, error) in
        
        guard let profileImageUrl = url?.absoluteString else { return }
        
        AUTH.createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
          
          guard let uid = result?.user.uid else { return }
          
          let data = ["uid": uid,
                      "email": credentials.email,
                      "password": credentials.password,
                      "fullname": credentials.fullname,
                      "profileImage": profileImageUrl,
                      "lastSeen": Date()
          ] as [String: Any]
          
          COLLECTION_USER.document(uid).setData(data) { error in
            
            if (result?.user) != nil {
              completionBlock(true)
            } else {
              completionBlock(false)
            }
          }
        }
      }
    }
  }
  
  static func userLogin(withEmail email: String, password: String,  completionBlock: @escaping (_ success: Bool) -> Void) {
    AUTH.signIn(withEmail: email, password: password) { (result, error) in
      if error != nil {
        completionBlock(false)
      } else {
        guard let uid = result?.user.uid else { return }
        let data = ["lastSeen": Date()] as [String: Any]
        COLLECTION_USER.document(uid).updateData(data) { error in
          if error != nil {
            completionBlock(false)
          }
          completionBlock(true)
        }
      }
    }
  }
  
}
