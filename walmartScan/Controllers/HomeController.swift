//
//  viewController.swift
//  walmartScan
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 admin. All rights reserved.
//


import UIKit

extension Notification.Name {
    static let peru = Notification.Name("peru")
}
class HomeController: UIViewController {

    @IBOutlet weak var lblSaludo: UILabel!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setToPeru(notification:)), name: .peru, object: nil)
        var nombre = UserDefaults.standard.value(forKey: "name")!
        var apellido = UserDefaults.standard.value(forKey: "secondName")!

        var algo = "¡Biembenido/a  \( UserDefaults.standard.value(forKey: "name")!   )"
        algo += " \( apellido)!"
         lblSaludo.text = algo
        // Do any additional setup after loading the view, typically from a nib.
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            btnMenuButton.target = revealViewController()
            btnMenuButton.action = "revealToggle:"
            
            
            
            //            revealViewController().rightViewRevealWidth = 150
            //            extraButton.target = revealViewController()
            //            extraButton.action = "rightRevealToggle:"
 
        }
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        //self.revealViewController().rearViewRevealWidth = 300

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //self.revealViewController().rearViewRevealWidth = 30

    }
    override func viewWillDisappear(_ animated: Bool) {
        //self.revealViewController().rearViewRevealWidth = 30
        //self.btnMenuButton.action = "revealToggle:"
        
        
        
        var instanceOfCustomObject: SWRevealViewController = revealViewController()
        instanceOfCustomObject.revealToggle(self)
        

    }
  @objc func closeMenu()  {
       // self.revealViewController().rearViewRevealWidth = 30

    }
    
    @objc func setToPeru(notification: NSNotification) {
        
     //   btnMenuButton.tintColor = UIColor.gray
        //self.revealViewController().rearViewRevealWidth = 400

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lateralMenu(_ sender: UIButton) {
        
        revealViewController().rearViewRevealWidth = 300
        
    }
    
}

