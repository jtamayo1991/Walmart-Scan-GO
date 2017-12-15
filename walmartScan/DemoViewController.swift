//
//  DemoViewController.swift
//  walmartScan
//
//  Created by admin on 12/15/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit


class DemoViewController: UIViewController {
    
    @IBOutlet weak var imagenScroll: UIScrollView!
    
    var imagenArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagenArray = [#imageLiteral(resourceName: "tutorial_1"), #imageLiteral(resourceName: "tutorial_2") ,#imageLiteral(resourceName: "tutorial_3")]
        
        for i in 0..<imagenArray.count {
            let imageView = UIImageView()
            imageView.image = imagenArray[i]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showdemo(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
    }
    
}

