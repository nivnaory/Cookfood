//
//  UserController.swift
//  niv_app
//
//  Created by Moveo on 11/08/2021.
//

import Foundation
import FirebaseFirestore
class UserController{
    var userDB:CollectionReference
    init() {
        userDB=Firestore.firestore().collection("users");
    }
    
    func getUserFromDB(userEmail:String)   ->User{ 
        let user=User(email: "", name:"")
        self.userDB.whereField("Email", isEqualTo: userEmail)             .getDocuments() { (querySnapshot, err)  in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let email=document.data()["Email"]! as? String
                        let name=document.data()["fullName"]! as? String
                        user.setName(name: name!)
                        user.setEmail(email: email!)
              
                }
            }
        }
        return user
    }

}
