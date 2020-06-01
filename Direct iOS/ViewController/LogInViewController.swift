//
//  LogInViewController.swift
//  Direct iOS
//
//  Created by Victor Shijie Wu on 2020-05-22.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        assignbackground()
    }
    
    func setUpElements() {
        ErrorLabel.alpha = 0
        Helpers.styleTextField(EmailTextField)
        Helpers.styleTextField(PasswordTextField)
        Helpers.styleFilledButton(LogInButton)
    }
    
    func validatefields() -> String? {
        
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
        let background = UIImage(named: "background3")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func LogInTapped(_ sender: Any) {
        
        // Text Field Validation
        let error = validatefields()
        
        if error != nil {
            // There is something wrong with the fields
            showerror(message: error!)
        }
        else {
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // User Sign In
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.ErrorLabel.text = err!.localizedDescription
                    self.ErrorLabel.alpha = 1
                }
                else {
                    self.performSegue(withIdentifier: "logIntoTabBarVC", sender: nil)
                }
            }
    }
  }
}
