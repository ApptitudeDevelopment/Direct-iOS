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
    
    @IBOutlet weak var GoogleButton: UIButton!
    
    @IBOutlet weak var FacebookButton: UIButton!


    
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
        Helpers.styleGoogleButton(GoogleButton)
        Helpers.styleFacebookButton(FacebookButton)
        

       
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

