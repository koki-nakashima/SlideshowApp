//
//  secondViewController.swift
//  SlideshowApp
//
//  Created by 中島晃希 on 2021/02/09.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var Image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = self.Image
        print(self.Image)
        
    }

    }
    
    
    

