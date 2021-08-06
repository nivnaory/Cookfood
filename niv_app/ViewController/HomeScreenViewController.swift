//
//  HomeScreenViewController.swif t
//  niv_app
//
//  Created by Moveo on 20/07/2021.
//

import UIKit

class HomeScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var cardTableView: UITableView!
    
     var images: [UIImage] = [
          UIImage(named: "image2.jpg")!,
         UIImage(named: "image2.jpg")!, UIImage(named: "image2.jpg")!, UIImage(named: "image2.jpg")!, UIImage(named: "image2.jpg")!]
        let titles = ["title of recipe 1", "title of recipe 2","title of recipe 3","title of recipe 4","title of recipe 5"];
        let descriptions = ["description of recipe number 1","description of recipe number 2","description of recipe number 3","description of recipe number 4","description of recipe number 5"];


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the v iew.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count ;
    }
    
    
    //define what calles are being used
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "cardCell",for: indexPath) as! CardCell
        cell.configure(image:images[indexPath.row], title:titles[indexPath.row], description:descriptions[indexPath.row])
        return cell;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
