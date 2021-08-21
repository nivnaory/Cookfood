//
//  RecipeViewController.swift
//  niv_app
//
//  Created by Moveo on 10/08/2021.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements();
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        Utilities.styleTextView(descriptionTextView)
        Utilities.styleImageView(recipeImageView);

   }}
