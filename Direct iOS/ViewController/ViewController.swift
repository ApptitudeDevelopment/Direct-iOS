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

    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        assignbackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "firstViewtoTabBarVC", sender: nil)
        }
    }

    func setUpElements() {
        Helpers.styleFilledButton(SignUpButton)
        Helpers.styleHollowButton(LogInButton)
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

