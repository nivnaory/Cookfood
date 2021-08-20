//
//  User.swift
//  niv_app
//
//  Created by Moveo on 11/08/2021.
//

import Foundation

class User {
    private var  email:String
    private var  name:String
    private var recipes: [Recipe];

    
    init(email:String,name:String) {
        self.email=email
        self.name=name
        recipes=[]
    }
      
    func getEmail() -> String {
        return self.email
    }
    func getName() -> String {
        return self.name
    }
    func getRecipes() -> [Recipe] {
        return self.recipes
    }
    func setEmail(email:String){
        self.email=email
    }
    func setName(name:String){
        self.name=name
    }
}
