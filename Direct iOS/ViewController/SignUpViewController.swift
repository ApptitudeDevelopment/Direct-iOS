//
//  SignUpViewController.swift
//  Direct iOS
//
//  Created by Victor Shijie Wu on 2020-05-22.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        assignbackground()
    }
    
    func setUpElements() {
        ErrorLabel.alpha = 0
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        Helpers.styleTextField(FirstNameTextField)
        Helpers.styleTextField(LastNameTextField)
        Helpers.styleTextField(EmailTextField)
        Helpers.styleTextField(PasswordTextField)
        Helpers.styleFilledButton(SignUpButton)
    }

    // Makes sure that data is correct for text fields
    func validatefields() -> String? {
        
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in First Name."
        }
        if LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in Last Name."
        }
        if EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in Email."
        }
        if PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in Password."
        }
        
        let baseemail = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isValidEmail(baseemail) == false {
            // Invalid Email
            return "Please make sure you entered a valid email."
        }
        
        let basepassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Helpers.isPasswordValid(basepassword) == false {
            // Insecure Password
            return "Please make sure your password is at least 8 characters long, contains a special character and contains a number."
        }
        return nil
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func showerror( message:String) {
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func transitionhome() {
        
        let homeviewcontroller = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeviewcontroller) as? HomeViewController
        
        view.window?.rootViewController = homeviewcontroller
        view.window?.makeKeyAndVisible()
        
    }
    
    func assignbackground(){
        let background = UIImage(named: "background2")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

    
    @IBAction func SignUpTapped(_ sender: Any) {
        // Input Validation
        let error = validatefields()
        
        if error != nil {
            // There is something wrong with the fields
            showerror(message: error!)
        }
        else {
            let firstname = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            // User Account Creation
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    
                    // There was an error creating the user
                    self.showerror(message: "Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstname, "lastname":lastname, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showerror(message: "Error saving user data")
                        }
                    }
                    // Home Screen Transition
                    self.performSegue(withIdentifier: "signIntoTabBarVC", sender: nil)
                }
            }
        }
    }
    
}
