//
//  TerminosCondicionesView.swift
//  walmartScan
//
//  Created by admin on 12/15/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit


class TerminosCondicionesView: UIViewController {
    
    @IBOutlet weak var textDescTerms: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textDescTerms.text =   NSLocalizedString("text_terminos", comment: "alert_terminos")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

@IBAction func back(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    
    
}
    
    @IBAction func aceptaTerms(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "terminosOK") //Bool
        dismiss(animated: true, completion: nil)

    }
    //   @IBAction func aceptar(_ sender: Any) {
        
      //  UserDefaults.standard.set(true, forKey: "terminosOK") //Bool
       //
  //  }
}
