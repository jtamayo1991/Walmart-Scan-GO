//
//  menuViewController.swift
//  memuDemo
//
//  Created by Parth Changela on 09/10/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblTableView: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ManuNameArray = NSArray(objects: NSLocalizedString("menu_como", comment: "menu_como"),NSLocalizedString("menu_preg", comment: "menu_preg"),NSLocalizedString("menu_escan", comment: "menu_escan"),NSLocalizedString("menu_tiend", comment: "menu_tiend")) as! Array<String>//["Home","Message","Map","Setting"]
        iconArray = [UIImage(named:"menu_como")!,UIImage(named:"menu_preguntas")!,UIImage(named:"menu_escanear")!,UIImage(named:"home")!]
        
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
        if cell.lblMenuname.text! == "Home"
        {
            print("Home Tapped")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.lblMenuname.text! == "Message"
        {
            print("message Tapped")
           
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuname.text! == "Map"
        {
            let newViewcontrolleree = mainstoryboard.instantiateViewController(withIdentifier: "PreguntasViewController") as! PreguntasViewController
           // let newFrontControllere = UINavigationController.init(rootViewController: newViewcontrolleree)
            
            //revealviewcontroller.pushFrontViewController(newFrontControllere, animated: true)        }
        if cell.lblMenuname.text! == "Setting"
        {
           print("setting Tapped")
        }
    }
   
    }
}
