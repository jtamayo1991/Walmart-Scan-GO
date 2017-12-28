//
//  DemoContenido.swift
//  walmartScan
//
//  Created by admin on 12/27/17.
//  Copyright © 2017 admin. All rights reserved.
//


import UIKit

class DemoContenido: UIViewController {

var itemIndex: Int = 0
var imageName: String = "" {
    
    didSet {
        if let imageView = contentImageView{
            imageView.image = UIImage(named: imageName)
            
        }
    }
    
}

@IBOutlet weak var contentImageView: UIImageView!
override func viewDidLoad() {
    super.viewDidLoad()
    
    contentImageView.image = UIImage(named: imageName)
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}
