//
//  DetailsViewController.swift
//  EatiOSApp
//
//  Created by Şükrü Şimşek on 13.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var eatSelect = ""
    var eatSelectImage = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: eatSelectImage)
        label.text = eatSelect
    }
    

}
