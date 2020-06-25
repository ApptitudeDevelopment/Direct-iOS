//
//  WelcomeViewController.swift
//  Direct iOS
//
//  Created by Kevin Liu on 2020-06-18.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signInFacebookButton: UIButton!
    @IBOutlet weak var signInGoogleButton: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var TermsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        setupHeader()
        setupOr()
        setupTerms()
        setupFacebookButton()
        setupGoogleButton()
        setupCreateButton()
    }
}
