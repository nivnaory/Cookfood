//
//  LoginViewController.swift
//  niv_app
//
//  Created by Moveo on 20/07/2021.
//

import UIKit
import SwiftUI
import FirebaseAuth
import Toast_Swift
class LoginViewController: UIViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var recipeController = RecipeController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func loginPress(_ sender: Any) {
        let email=emailTextField.text!.trimmingCharacters(in: .whitespaces);
        let password=passwordTextField.text!.trimmingCharacters(in: .whitespaces);
        Auth.auth().signIn(withEmail: email, password: password) {
            (result,error) in
            if error != nil{
                self.view.makeToast(PASSWORD_OR_EMAIL_NOT_CORRECT);
            }else{
                self.spinner.startAnimating()
                self.recipeController.getAllRecipesFromDB() {allrecipes, err in
                    let  vc = self.storyboard?.instantiateViewController(identifier: "home") as!  HomeScreenViewController
                    
                        for  recipe in allrecipes!{
                         let url = URL(string:recipe.getImageUrl())
                        if let data = try? Data(contentsOf:url!) {
                                vc.images.append(UIImage(data: data)!)
                               
                        }
                     }
                    //when we get here to cancel the loading
                    self.spinner.startAnimating()
                    vc.allrecipes=allrecipes!
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc ,animated:true);
            }
          }
       }
    }
    @IBAction func signUpPress(_ sender: Any) {
        let  vc = self.storyboard?.instantiateViewController(identifier: "signUp") as!  SignUpViewController
        vc.modalPresentationStyle = .formSheet
        self.present(vc ,animated:true);
    }
}
