//
//  LoginViewController.swift
//  niv_app
//
//  Created by Moveo on 20/07/2021.
//

import UIKit
import FirebaseAuth
import Toast_Swift
class LoginViewController: UIViewController {
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    
    @IBAction func LoginButton(_ sender: Any) {
        let email=EmailTextField.text!.trimmingCharacters(in: .whitespaces);
        let password=PasswordTextField.text!.trimmingCharacters(in: .whitespaces);
        
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result,error) in
            if error != nil{
                self.view.makeToast(PASSWORD_OR_EMAIL_NOT_CORRECT);
            }else{
                print("logged in succesfully");
                //luanch to the homescreen.
            }
           
        }
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements();
    }
    func setUpElements(){
       Utilities.styleTextField(EmailTextField);
       Utilities.styleTextField(PasswordTextField);
        Utilities.styleFilledButton(LoginButton)


   }
    func validateFiled()-> Bool{
        if EmailTextField.text?.trimmingCharacters(in: .whitespaces)=="" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespaces)==""
            {
            return false
        }

        return true
}
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


