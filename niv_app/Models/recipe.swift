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
     private var creatorName:String

    
    init(image:UIImage,title:String,description:String,creatorName:String) {
      //  self.image = image;
        self.title = title
        self.description = description
        self.creatorName = creatorName
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
}
