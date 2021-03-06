//
//  DemoViewController.swift
//  walmartScan
//
//  Created by admin on 12/15/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import BarcodeScanner
import AVFoundation

extension Notification.Name {
    static let algo = Notification.Name("peru")
}


class DemoViewController: UIViewController,UIPageViewControllerDataSource,UINavigationBarDelegate,UINavigationControllerDelegate{
 
    @IBOutlet weak var imagenScroll: UIScrollView!

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnSaltar: UIButton!
    
    @IBOutlet weak var inicioButton: UIButton!
    @IBOutlet weak var labelLine: UILabel!
    var pageDescript: NSArray!

    @IBOutlet weak var demoDesc: UILabel!
    var pageViewController: UIPageViewController?
    
    let contentImages = [Constants.Images.tutorial1,Constants.Images.tutoial2,Constants.Images.tutorial3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showSaltar(notification:)), name: .algo, object: nil)

        
        if UserDefaults.standard.bool(forKey: "DemoFromMenu"){
            self.inicioButton.isHidden = true
          //  self.btnSaltar.isHidden = false
        }
        
        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.pageDescript =  NSArray(objects: NSLocalizedString("descripcion_tutorial_slide1", comment: "descripcionTutorialSlide1"), NSLocalizedString("descripcion_tutorial_slide2", comment: "descripcionTutorialSlide2"), NSLocalizedString("descripcion_tutorial_slide3", comment: "descripcionTutorialSlide3"))
        createPageViewController()
        //  setupPageControl()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createPageViewController() {
        
        self.pageControl.currentPage = 0
        
        let pageController = self.storyboard?.instantiateViewController(withIdentifier: "PageController") as! UIPageViewController
        pageController.dataSource = self
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers = [firstController]
            pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
            
        }
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
        
        self.view.bringSubview(toFront: self.pageControl)
        self.view.bringSubview(toFront: self.demoDesc)
        self.view.bringSubview(toFront: self.labelLine)
        self.view.bringSubview(toFront: self.inicioButton)
        self.view.bringSubview(toFront: self.btnSaltar)



    }
    @objc func showSaltar(notification: NSNotification) {
        
        //   btnMenuButton.tintColor = UIColor.gray
        //self.revealViewController().rearViewRevealWidth = 400
        self.btnSaltar.isHidden = false

        
        
    }
    func setupPageControl() {
        
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.darkGray
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! DemoContenido
        self.pageControl.currentPage = itemController.itemIndex
        self.demoDesc.text = self.pageDescript[itemController.itemIndex] as? String

        if itemController.itemIndex > 0 {
            
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! DemoContenido
        self.pageControl.currentPage = itemController.itemIndex
        if (itemController.itemIndex > 1){
             NotificationCenter.default.post(name: .algo, object: nil)
        }
        self.demoDesc.text = self.pageDescript[itemController.itemIndex] as? String

        if itemController.itemIndex+1 < contentImages.count {
            
            return getItemController(itemController.itemIndex+1)
            
        }
        return nil
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    func currentControllerIndex() -> Int {
        
        let pageItemController = self.currentControllerIndex()
        
        if let controller = pageItemController as? DemoContenido{
            self.pageControl.currentPage = controller.itemIndex
            return controller.itemIndex
        }
        
        return -1
    }
    
    
    func currentController() -> UIViewController? {
        
        if (self.pageViewController?.viewControllers?.count)! > 0 {
            return self.pageViewController?.viewControllers![0]
        }
        
        return nil
    }
    
    
    func getItemController(_ itemIndex: Int) -> DemoContenido? {
        
        if itemIndex < contentImages.count{
            
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "DemoContenido") as! DemoContenido
            
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
            
            
        }
        return nil
        
    }
    
    
    @IBAction func showLogin(_ sender: Any) {
        
        
        
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "scann") as! ScannViewController
       // self.present(vc, animated: true, completion: nil)
        
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginRut") as! LoginRutViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    @IBAction func saltarDemo(_ sender: Any) {
      /*  let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let newViewcontrolleree = mainstoryboard.instantiateViewController(withIdentifier: "PreguntasViewController") as! PreguntasViewController
        let newFrontControllere = UINavigationController.init(rootViewController: newViewcontrolleree)
        
        revealviewcontroller.pushFrontViewController(newFrontControllere, animated: true)
        revealviewcontroller.popoverPresentationController*/
        
        dismiss(animated: true, completion: nil)

        
        
        
    }
    
}


