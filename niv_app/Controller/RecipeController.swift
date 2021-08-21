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
    typealias RecipesClosure = (Array<Recipe>?,Error?) -> Void
    typealias RecipeClosure = (Recipe?,Error?) -> Void
    //TODO:put the db as an attrabuite of this class!x
    //how to return true from setRecipeInDBfucntion
    init() {
        recipeDB=Firestore.firestore().collection("recipes");
    }

    func setRecipeInDB(image:UIImage,title:String,description:String,creator:String,userEmail:String,completion: @escaping RecipeClosure )   -> Void {
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
                
                //set the image url in db
                recipeImages.downloadURL { (url, error) in
                    if let downloadURL = url{
                        self.recipeDB.addDocument(data:["creator": creator,"userEmail":userEmail, "description":description,"title":title,
                            "imageUrl":downloadURL.absoluteString]) {error in
                              if  error != nil  {
                                  print("error");
                              
                    }else {
                        completion(Recipe(title: title, description: description, creatorName: creator, creatorEmail: userEmail,imageUrl: url!.absoluteString), error)
                  }
               }
           }
        }
      }
   }
}

    func getAllRecipesFromDB(completion: @escaping RecipesClosure) ->Void{
        recipeDB
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    var allRecipes=[Recipe]()
                    for document in querySnapshot!.documents {
                        allRecipes.append(Recipe(title: document.data()["title"] as! String, description:  document.data()["description"] as! String, creatorName:  document.data()["creator"] as! String, creatorEmail:  document.data()["userEmail"] as! String,imageUrl: document.data()["imageUrl"] as! String))
                    }
                        completion(allRecipes,err)
            }
        }
    }
  }


