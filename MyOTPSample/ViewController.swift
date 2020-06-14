//
//  ViewController.swift
//  MyOTPSample
//
//  Created by Fikri Adriansa Yudha on 12/06/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOTP: OTPTextField!
    
    @IBOutlet weak var buttonVerify: UIButton!
    //    let alert = AlertService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelOTP.configure()
        labelOTP.layer.cornerRadius = 20
//        buttonVerify.layer.cornerRadius = 16
        // Do any additional setup after loading the view.
    }


}

