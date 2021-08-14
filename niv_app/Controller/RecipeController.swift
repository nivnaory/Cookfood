//
//  RecipeController.swift
//  niv_app
//
//  Created by Moveo on 11/08/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
class RecipeController{
    var recipeDB:CollectionReference
    //TODO:put the db as an attrabuite of this class!x
    //how to return true from setRecipeInDBfucntion
    init() {
        recipeDB=Firestore.firestore().collection("recipes");
    }

    func setRecipeInDB(image:UIImage,title:String,description:String,userName:String)  -> Bool {
        let identifier = UUID()
        let storageRef = FirebaseStorage.Storage.storage().reference()
        let filePath = "\("imageRecipe")/\(identifier.uuidString)"
        let recipeImages = storageRef.child(filePath)
        let data=image.jpegData(compressionQuality: 0.8);
            recipeImages.putData(data! , metadata: nil){(metaData,error) in
               if let error = error {
                   print(error.localizedDescription)
                   return
               }else{
                recipeImages.downloadURL { (url, error) in
                    if let downloadURL = url{
                        self.recipeDB.addDocument(data:["creator": userName,"description":description,"title":title,"imageUrl":downloadURL.absoluteString]) {error in
                              if  error != nil  {
                                  print("error");
                              }else{
                                print("succuss!");
                            }
                         }
                    }else {
                      print("eror");
                      return
                  }
               }
           }
        }
        return true;
    }
}






    /*
    func uploadImageToDB(image:UIImage) -> Bool{
        let storageRef = FirebaseStorage.Storage.storage().reference()
        let filePath = "\("imageRecipe")/\("2")s"
        let recipeImages = storageRef.child(filePath)
           let data=image.jpegData(compressionQuality: 0.8);
            recipeImages.putData(data! , metadata: nil){(metaData,error) in
               if let error = error {
                   print(error.localizedDescription)
                   return
               }else{
                recipeImages.downloadURL { (url, error) in
                    if let downloadURL = url{
                    }else {
                        print("eror");
                      return
                    }
        
            }
       }
    }
     return true
 }
}
// set upload path
//let filePath = "\(FIRAuth.auth()!.currentUser!.uid)/\("userPhoto")"
// let metaData = F
//metaData.contentType = "image/jpg"
*/
