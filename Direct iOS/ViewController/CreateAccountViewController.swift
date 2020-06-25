//
//  CreateAccountViewController.swift
//  Direct iOS
//
//  Created by Kevin Liu on 2020-06-22.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class CreateAccountViewController: UIViewController{
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var fullnameContainerView: UIView!
    
    @IBOutlet weak var fullnameTextField: UITextField!

    @IBOutlet weak var emailContainerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordContainerView: UIView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        setupSignUpLabel()
        setupAvatar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
    }
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        guard let imageSelected = self.image else{
            print("Avatar is nil")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else{
            return
        }
            Auth.auth().createUser(withEmail: "test9@gmail.com", password: "123456") { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            if let authData = authDataResult {
                print(authData.user.email)
                var dict: Dictionary<String, Any> =  [
                    "uid": authData.user.uid,
                    "email": authData.user.email,
                    "profileImageUrl": "",
                    "status": "Welcome to Direct"
                ]
                
                let storageRef = Storage.storage().reference(forURL: "gs://direct-ios-app.appspot.com")
                
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metadata, completion: { (StorageMetadata, error) in
                    if error != nil{
                        print(error?.localizedDescription)
                        return
                    }
                    storageProfileRef.downloadURL(completion: { (url,error) in
                        if let metaImageUrl = url?.absoluteString{
                            dict["profileImageUrl"] = metaImageUrl
                        
                            Database.database().reference().child("Users")
                                               .child(authData.user.uid).updateChildValues(dict, withCompletionBlock: { (error, ref) in
                                               if error == nil {
                                                   print("Done")
                                               }
                                           })
                        }
                    })
                    
                })
                
               
            }
        }
    }
    
}
