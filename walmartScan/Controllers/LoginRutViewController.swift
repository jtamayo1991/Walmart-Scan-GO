//
//  LoginRutViewController.swift
//  walmartScan
//
//  Created by admin on 12/15/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation
import UIKit

class LoginRutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func validaRut(_ s: String) {
        var rut = "167506445"
        
        
        var rutPrueba  = self.reverse(rut)
        
        //        let digito = rutPrueba.substring(from:rutPrueba.index(rutPrueba.endIndex, offsetBy: -1))
        // var index1 = rutPrueba.index(rutPrueba.startIndex, offsetBy: 1)
        var rutSinDig = rutPrueba.substring(to: rutPrueba.index(rutPrueba.startIndex, offsetBy: rutPrueba.count - 1))
        
        var suma = 0
        var multiplo = 2
        var i = 0
        for i  in 0...rutSinDig.count - 1 {
            //extraer primer digito
            var firstDig = Int(rutSinDig.substring(to: rutSinDig.index(rutSinDig.startIndex, offsetBy: 1)) )
            //multiplicar y sumar
            suma = suma + firstDig! * multiplo
            //asignar a la misma variable sin el primer digito
            rutSinDig.remove(at: rutSinDig.startIndex)
            //aumentar multipo
            if( multiplo == 7){
                multiplo = 1
            }
            multiplo = multiplo + 1
        }
        
        var entero = suma / 11
        var divid = suma - (entero * 11)
        var digitoVr = 11 - divid
        if digitoVr == 11 {
            digitoVr = 0
        }else if digitoVr == 10 {
            digitoVr = 12
        }
    }
    
    func reverse(_ s: String) -> String {
        var str = ""
        //.characters gives the character view of the string passed. You can think of it as array of characters.
        for character in s.characters {
            str = "\(character)" + str
            //This will help you understand the logic.
            //!+""
            //p+!
            //l+p! ... goes this way
            print ( str)
        }
        return str
    }
    
}


