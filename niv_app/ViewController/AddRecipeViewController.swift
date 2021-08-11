

import UIKit

class AddRecipeViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
  
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickImageButton: UIButton!
   
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
    @IBAction func addButtonTap(_ sender: Any) {
    /*
     handle the add button
     * check if all the field are fiil
     * check if image was choosen.
     * add the recipe to firesbase and check if its there
   */
    }
}
    

