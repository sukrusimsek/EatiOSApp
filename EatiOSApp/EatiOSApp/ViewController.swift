//
//  ViewController.swift
//  EatiOSApp
//
//  Created by Şükrü Şimşek on 12.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //View controller a sen artık tableview için main olucaksın demek istiyoruz.
    
    

    @IBOutlet weak var tableView: UITableView!
    var eatName = [String]()
    var eatImage = [String]()
    var eatSelectName = ""
    var eatSelectImage = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        eatName.append("Beef Steak")
        eatName.append("Chicken")
        eatName.append("Hamburger")
        eatName.append("Pasta")
        eatName.append("Pizza")
        
        eatImage.append("beefsteak")
        eatImage.append("chicken")
        eatImage.append("hamburger")
        eatImage.append("pasta")
        eatImage.append("pizza")
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eatName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = eatName[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            eatName.remove(at: indexPath.row)
            eatImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade) //deleteRows ile sütunlarda silme işlemi yapılabilir. Sonda ise animasyon
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eatSelectName = eatName[indexPath.row]
        eatSelectImage = eatImage[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.eatSelect = eatSelectName
            destinationVC.eatSelectImage = eatSelectImage
        }
    }
}


