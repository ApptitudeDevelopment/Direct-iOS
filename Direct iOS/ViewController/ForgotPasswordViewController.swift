//
//  ForgotPasswordViewController.swift
//  Direct iOS
//
//  Created by Kevin Liu on 2020-06-23.
//  Copyright © 2020 Victor Shijie Wu. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailContainerView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var resetButton: UIButton!
    
     override func viewDidLoad() {
           super.viewDidLoad()
           setupUI()
       }
       
       func setupUI(){
           setupEmailTextField()
           setupResetButton()
       }
       
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
