//
//  LoginViewController.swift
//  walmartScan
//
//  Created by admin on 12/15/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnCheckTerm: UIButton!
    
    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var apellido: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCheckTerm.setBackgroundImage(UIImage(named: "checkFalse"), for: .normal)
        btnCheckTerm.setBackgroundImage(UIImage(named: "checkTrue"), for: .selected)
        UserDefaults.standard.set(false, forKey: "terminosOK") //Bool

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "terminosOK"){
            btnCheckTerm.isSelected = true
        }

    
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
       
    }
    @IBAction func checkTerminos(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected
        if (sender.isSelected == true)
        {
            UserDefaults.standard.set(true, forKey: "terminosOK") //Bool
        }
        else
        {
            UserDefaults.standard.set(false, forKey: "terminosOK") //Bool
        }
    }
    
    
    
    @IBAction func showHome(_ sender: Any) {
        
      
        if UserDefaults.standard.bool(forKey: "terminosOK") {
            if ((nombre.text == "") || (apellido.text == "")) {
                let alert = UIAlertController(title: "¡Oops!", message: NSLocalizedString("alert_NombreApell", comment: "alert_NombreApell"), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "ACEPTAR", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                
                UserDefaults.standard.set(nombre.text, forKey: "name")
                UserDefaults.standard.set(apellido.text, forKey: "secondName")

                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeInicio") as! SWRevealViewController
                self.present(vc, animated: true, completion: nil)
            }
            
        }
        else{
            showAlert()
        }
        
       
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "¡Oops!", message: NSLocalizedString("alert_terminos", comment: "alert_terminos"), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "ACEPTAR", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


