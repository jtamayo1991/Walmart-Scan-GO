//
//  PreguntasViewController.swift
//  walmartScan
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class PreguntasViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var textDescPreguntas: UITextView!
    @IBOutlet weak var menu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 70.0/255.0, green: 124.0/255.0, blue: 189.0/255.0, alpha: 1.0)

        // Do any additional setup after loading the view.
         textDescPreguntas.text = NSLocalizedString("text_preguntas", comment: "alert_terminos")
       // revealViewController().rearViewRevealWidth = 300
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


