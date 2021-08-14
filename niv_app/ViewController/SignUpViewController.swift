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
   
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var FullNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setUpElements();
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
    Utilities.styleTextField(EmailTextField);
    Utilities.styleTextField(PasswordTextField);
    Utilities.styleTextField(FullNameTextField);
    Utilities.styleFilledButton(SignUpButton);
 }
    
    @IBAction func SignUpPress(_ sender: Any) {
        //validate the field and create the user
        //trensition the the home screen
        let validate=validateFiled();
        
        if(!validate){
           // self.showToast(message: "Please fill in all fields ", font: .systemFont(ofSize: 20.0))
            self.view.makeToast(FEILDS_EMPTY_ERROR_MASSAGE);
            return;
        }
         //create the user.
        let email=EmailTextField.text!.trimmingCharacters(in: .whitespaces);
        let password=PasswordTextField.text!.trimmingCharacters(in: .whitespaces);
        let fullName=FullNameTextField.text!.trimmingCharacters(in: .whitespaces);
        if (Utilities.isPasswordValid(password)){
        Auth.auth().createUser(withEmail:email, password:password) { authResult, error in
            if error != nil{
                print("Eror creating user!");
            }
            
            //user create successfuly now creaet the collection
            self.view.makeToast(USER_SUCCESSFULLY_REGISRERDS);
        }
    }
     else{
        self.view.makeToast(PASSWORD_LENGTH_ERROR_MASSAGE);
    }
        
        let db = Firestore.firestore();
        db.collection("users").addDocument(data:["fullName": fullName,"Email":email]){(error) in
        if error != nil {
                    print("Errror");
                }else{
                    print("trasition to home screen");
                }
            }
        
        
    }

    func validateFiled()-> Bool{
        if EmailTextField.text?.trimmingCharacters(in: .whitespaces)=="" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespaces)=="" ||
            FullNameTextField.text?.trimmingCharacters(in: .whitespaces)==""{
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


