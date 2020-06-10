//
//  ViewController.swift
//  Direct iOS
//
//  Created by Victor Shijie Wu on 2020-05-22.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var SignInGoogle: UIButton!
    
    @IBOutlet weak var SignInFacebookButton: UIButton!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var TermsOfServiceButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        assignbackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser?.uid != nil {
            self.performSegue(withIdentifier: "firstViewtoTabBarVC", sender: nil)
        }
    }

    func setUpElements() {
        Helpers.styleFilledButton(SignUpButton)
        Helpers.styleHollowButton(LogInButton)
        
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
          
        SignInFacebookButton.setTitle("Sign in with Facebook", for: UIControl.State.normal)
        SignInFacebookButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        SignInFacebookButton.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        SignInFacebookButton.layer.cornerRadius = 5
        SignInFacebookButton.clipsToBounds = true
        SignInFacebookButton.setImage(UIImage(named: "icon-facebook"), for: UIControl.State.normal)
        SignInFacebookButton.imageView?.contentMode = .scaleAspectFit
        SignInFacebookButton.tintColor = .white
        SignInFacebookButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: -30, bottom: 12, right: 0)
        
        SignInGoogle.setTitle("Sign in with Google", for: UIControl.State.normal)
        SignInGoogle.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        SignInGoogle.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        SignInGoogle.layer.cornerRadius = 5
        SignInGoogle.clipsToBounds = true
        SignInGoogle.setImage(UIImage(named: "google"), for: UIControl.State.normal)
        SignInGoogle.imageView?.contentMode = .scaleAspectFit
        SignInGoogle.tintColor = .white
        SignInGoogle.imageEdgeInsets = UIEdgeInsets(top: 12, left: -30, bottom: 12, right: 0)
       
    }

    func assignbackground(){
        let background = UIImage(named: "background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}

