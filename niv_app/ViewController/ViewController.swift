//
//  ViewController.swift
//  niv_app
//
//  Created by Moveo on 20/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements();
    }
    func setUpElements(){
        Utilities.styleFilledButton(SignUpButton);
        Utilities.styleHollowButton(LoginButton);
    }

}

