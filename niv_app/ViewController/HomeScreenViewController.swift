//
//  HomeScreenViewController.swif t
//  niv_app
//
//  Created by Moveo on 20/07/2021.
//

import UIKit

class HomeScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var cardTableView: UITableView!
     var allrecipes=[Recipe]()
     var images = [UIImage]();
      
    override func viewDidLoad() {
        super.viewDidLoad()
  }
        // Do any additional setup after loading the v iew.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return images.count ;
        allrecipes.count
    }
    
    
    //define what calles are being use
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cardCell",for: indexPath) as! CardCell
        cell.configure(image:images[indexPath.row] , title:allrecipes[indexPath.row].getTitle(), description:allrecipes[indexPath.row].getDescription())
      
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //here we ditect the pree of the cell and send to the the other screen the details of the specific cell.
        let  vc = storyboard?.instantiateViewController(identifier: "recipe") as!  RecipeViewController
        vc.modalPresentationStyle = .formSheet
        present(vc ,animated:true);
        vc.recipeImageView.image = images[indexPath.row]
        vc.titleLabel.text = allrecipes[indexPath.row].getTitle()
        vc.descriptionTextView.text=allrecipes[indexPath.row].getDescription()
        vc.creatorLabel.text=allrecipes[indexPath.row].getCreatorName()
     }
    }
    

