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
import ProgressHUD

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
        self.view.endEditing(true)
        self.validateFeilds()
        self.signUp(onSuccess: {
            // switch view
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
        
    }
    
}
