

import UIKit
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth
import Firebase


class AddRecipeViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickImageButton: UIButton!
    // user = Auth.auth().currentUser;
    var recipeController = RecipeController()
    var userController = UserController()

    
    
   
    override func viewDidLoad() {
        super.viewDidLoad();
        setUpElements();
    }

    func setUpElements(){
        Utilities.styleTextView(descriptionTextView);
        

}
    
    @IBAction func uplodeImage(_ sender: Any) {
        let vc=UIImagePickerController();
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true;
        present(vc, animated: true);
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")]as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion:nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:nil)
    }
    
    /*TODO : NEED TO GET THE CURRENT NAME OF THE USER THAT
      uplode image to firebase and connect it with spcefic recipe
     
     §
    */
    @IBAction func addButtonTap(_ sender: Any)    {
        //check that all field are not empty.
        if(!checkFeild()){
            return;
        }
          let  currentUserEmail = (Firebase.Auth.auth().currentUser?.email)!
        //get the current username from the db
        userController.getUserFromDB(userEmail:currentUserEmail) { user, error in
            if error != nil {
                self.view.makeToast(RECIPE_ERROR);
             }
              else{
                self.spinner.startAnimating()
                self.recipeController.setRecipeInDB(image:self.imageView.image!,title:self.titleTextField.text!, description:self.descriptionTextView.text,creator:user!.getName(),userEmail: user!.getEmail()){newRecipe,err in
                    if err != nil {
                        self.view.makeToast(RECIPE_ERROR)
                    }else{
                        
                        self.recipeController.getAllRecipesFromDB(){allrecipes,err in
                    self.view.makeToast(RECIPE_SAVED);
                     let  vc = self.storyboard?.instantiateViewController(identifier: "home") as!  HomeScreenViewController
                        
                        //get all images from the server
                        vc.allrecipes = allrecipes!
                            for  recipe in allrecipes!{
                                let url = URL(string:recipe.getImageUrl())
                            if let data = try? Data(contentsOf:url!) {
                                vc.images.append(UIImage(data: data)!)
                          }
                        }
                     self.spinner.stopAnimating();
                     vc.modalPresentationStyle = .fullScreen
                     self.present(vc ,animated:true);
                    }
                }
            }
        }
    }
    func checkFeild()-> Bool{
        if  titleTextField.text?.trimmingCharacters(in: .whitespaces)==""{
            self.view.makeToast(NO_TITLE);
             return false
        }else if descriptionTextView.text?.trimmingCharacters(in: .whitespaces) == ""{
            self.view.makeToast(NO_RECIPE);
            return false;
        }else  if (imageView.image == nil){
            self.view.makeToast(NO_IMAGE);
            return false;
        }
        return true;
    }
}
}
