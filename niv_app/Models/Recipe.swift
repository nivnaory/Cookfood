//
//  recipe.swift
//  niv_app
//
//  Created by Moveo on 11/08/2021.
//
import UIKit

class Recipe {
     //var image:UIImage
     private var  title:String
     private var  description:String
     private var  creatorName:String
     private var  creatorEmail:String
    private var   imageUrl:String

    

    
    init(title:String,description:String,creatorName:String,creatorEmail:String,imageUrl:String) {
        self.title = title
        self.description = description
        self.creatorName = creatorName
        self.creatorEmail=creatorEmail
        self.imageUrl=imageUrl
    }

    public func getTitle() ->String{
        return self.title
    }
    public func getDescription() ->String{
        return self.description
    }
    public func getCreatorName() ->String{
        return self.creatorName
    }
    public func getImageUrl () -> String {
        return self.imageUrl
    }
}
