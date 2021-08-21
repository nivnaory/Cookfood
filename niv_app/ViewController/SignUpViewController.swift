//
//  SignUpViewController.swift
//  niv_app
//
//  Created by Moveo on 20/07/2021.
//
import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import Toast_Swift
class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    var userController=UserController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
  
    
    @IBAction func signUpPress(_ sender: Any) {
        let validate=validateFiled();
        if(!validate){
            self.view.makeToast(FEILDS_EMPTY_ERROR_MASSAGE);
            return;
        }
        
         //create the user.
        let email=emailTextField.text!.trimmingCharacters(in: .whitespaces);
        let password=passwordTextField.text!.trimmingCharacters(in: .whitespaces);
        let username=userNameTextField.text!.trimmingCharacters(in: .whitespaces);
        if (Utilities.isPasswordValid(password)){
        Auth.auth().createUser(withEmail:email, password:password) { authResult, error in
            if error != nil{
                print("Eror creating user!");
            }
            //user create successfuly now creaet the collection
            self.view.makeToast(USER_SUCCESSFULLY_REGISRERDS);
            self.userController.setUserInDB(email: email, username: username)
            let  vc = self.storyboard?.instantiateViewController(identifier: "login") as!  LoginViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc ,animated:true);
            
        }
    }
     else{
        self.view.makeToast(PASSWORD_LENGTH_ERROR_MASSAGE);
        
    }
     
   
        
    }

    func validateFiled()-> Bool{
        if emailTextField.text?.trimmingCharacters(in: .whitespaces)=="" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespaces)=="" ||
            userNameTextField.text?.trimmingCharacters(in: .whitespaces)==""{
            return false
        }
    
        return true
    }
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 30;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


