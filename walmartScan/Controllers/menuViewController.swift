//
//  menuViewController.swift
//  memuDemo
//
//  Created by Parth Changela on 09/10/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblTableView: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblSaludoMenu: UILabel!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ManuNameArray = NSArray(objects: NSLocalizedString("menu_como", comment: "menu_como"),NSLocalizedString("menu_preg", comment: "menu_preg"),NSLocalizedString("menu_escan", comment: "menu_escan"),NSLocalizedString("menu_tiend", comment: "menu_tiend"),NSLocalizedString("menu_close", comment: "menu_close")) as! Array<String>//["Home","Message","Map","Setting"]
        iconArray = [UIImage(named:"menu_como")!,UIImage(named:"menu_preguntas")!,UIImage(named:"menu_escanear")!,UIImage(named:"menu_como")!,UIImage(named:"menu_como")!]
        
        lblSaludoMenu.text = "               Hola  \(UserDefaults.standard.value(forKey: "name")!  ) "
        
        //imgProfile.layer.borderWidth = 2
        //imgProfile.layer.borderColor = UIColor.green.cgColor
        //imgProfile.layer.cornerRadius = 50
        
        //imgProfile.layer.masksToBounds = false
        //imgProfile.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.lblMenuname.text! = ManuNameArray[indexPath.row]
        cell.imgIcon.image = iconArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.lblMenuname.text!)
        if cell.lblMenuname.text! == NSLocalizedString("menu_como", comment: "menu_como")
        {
            print("Home Tapped")
           /* let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "Demo") as! DemoViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            UserDefaults.standard.set(true, forKey: "DemoFromMenu") //Bool

            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)*/
            
           
          //  NotificationCenter.default.post(name: .peru, object: nil)


            //kmcecemlvemlvkmelvelgve
          //  self.revealViewController().rearViewRevealWidth = 30
            UserDefaults.standard.set(true, forKey: "DemoFromMenu")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Demo") as! DemoViewController
            self.present(vc, animated: true, completion: nil)
            
            
        }
        if cell.lblMenuname.text! == "Message"
        {
            print("message Tapped")
           
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuname.text! == NSLocalizedString("menu_preg", comment: "menu_preg")
        {
            let newViewcontrolleree = mainstoryboard.instantiateViewController(withIdentifier: "PreguntasViewController") as! PreguntasViewController
            let newFrontControllere = UINavigationController.init(rootViewController: newViewcontrolleree)
            
            revealviewcontroller.pushFrontViewController(newFrontControllere, animated: true)
            
        }
        if cell.lblMenuname.text! == "Setting"
        {
           print("setting Tapped")
        }
    }
   
    
}
