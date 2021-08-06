//
//  CardCell.swift
//  niv_app
//
//  Created by Moveo on 02/08/2021.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    func configure(image: UIImage,title: String,description: String){
        pictureView.image=image;
        titleLabel.text=title;
        descriptionLabel.text=description;
        
        cardView.layer.shadowColor=UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 2.0
        
    }
}
