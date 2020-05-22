//
//  ViewController.swift
//  Direct iOS
//
//  Created by Victor Shijie Wu on 2020-05-22.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }

    func setUpElements() {
        Helpers.styleFilledButton(SignUpButton)
        Helpers.styleHollowButton(LogInButton)
    }

}

