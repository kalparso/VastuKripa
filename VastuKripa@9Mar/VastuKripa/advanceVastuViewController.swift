//  advanceVastuViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class advanceVastuViewController: UIViewController {
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    
    @IBOutlet weak var scroll_view: UIScrollView!
    
    @IBOutlet weak var background_view: UIView!
    
    
    @IBOutlet weak var plot_btn: UIButton!
    
    @IBOutlet weak var factory_btn: UIButton!
    
    @IBOutlet weak var office_btn: UIButton!
    
    @IBOutlet weak var building_btn: UIButton!
    @IBOutlet weak var bungalow_btn: UIButton!
    
    @IBOutlet weak var institute_btn: UIButton!
    
    @IBOutlet weak var hotel_btn: UIButton!
    
    @IBOutlet weak var hospital_btn: UIButton!
    
    @IBOutlet weak var lbl_plot: UILabel!
    
    @IBOutlet weak var lbl_factory: UILabel!
    
    @IBOutlet weak var lbl_hospital: UILabel!
    
    @IBOutlet weak var lbl_institute: UILabel!
    
    @IBOutlet weak var lbl_hotel: UILabel!
    
    @IBOutlet weak var lbl_building: UILabel!
    
    @IBOutlet weak var lbl_bungalow: UILabel!
    
    @IBOutlet weak var lbl_office: UILabel!
    
    var interface = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.revealViewController().panGestureRecognizer()
//        
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad{
            
            interface = "ipad"
            
        }else{
        
            interface = "iphone"

            
            self.scroll_view.frame.origin.y = 45

            
         }
        
    
        navigation_view.frame.size.width = self.view.frame.size.width
        
        info_btn.hidden = true
        
        var frame = navigation_title.frame
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        }
        
        NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
        self.navigationController?.navigationBarHidden = false
        
        self.title = "Advance Vastu"

        plot_btn.frame = CGRectMake(5, 5,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        factory_btn.frame = CGRectMake((self.view.frame.size.width-15)/2+10, 5,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        office_btn.frame = CGRectMake(5,(self.view.frame.size.width-15)/2+10,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        bungalow_btn.frame = CGRectMake((self.view.frame.size.width-15)/2+10,(self.view.frame.size.width-15)/2+10,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)

        building_btn.frame = CGRectMake(5,2*((self.view.frame.size.width-15)/2)+15,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        hotel_btn.frame = CGRectMake((self.view.frame.size.width-15)/2+10,2*(self.view.frame.size.width-15)/2+15,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        institute_btn.frame = CGRectMake(5,3*((self.view.frame.size.width-15)/2)+20,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        hospital_btn.frame = CGRectMake((self.view.frame.size.width-15)/2+10,3*((self.view.frame.size.width-15)/2)+20,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        scroll_view.contentSize = CGSize(width:self.view.frame.size.width, height:hospital_btn.frame.origin.y+hospital_btn.frame.size.height+75)
        
        background_view.frame.size.height = hospital_btn.frame.origin.y+hospital_btn.frame.size.height+16
        
        lbl_plot.frame.origin.x = plot_btn.frame.origin.x
        
        lbl_factory.frame.origin.x = factory_btn.frame.origin.x

        lbl_office.frame.origin.x = office_btn.frame.origin.x
        
        lbl_bungalow.frame.origin.x =  bungalow_btn.frame.origin.x
        
        lbl_building.frame.origin.x =  building_btn.frame.origin.x
        
        lbl_hotel.frame.origin.x =  hotel_btn.frame.origin.x
        
        lbl_institute.frame.origin.x =  institute_btn.frame.origin.x
        
        lbl_hospital.frame.origin.x =  hospital_btn.frame.origin.x


        if interface == "iphone"{
        
            if self.view.frame.size.width<=320{
            
            lbl_plot.frame.origin.y = plot_btn.frame.origin.y+90
        
            lbl_factory.frame.origin.y = factory_btn.frame.origin.y+90
        
            lbl_office.frame.origin.y = office_btn.frame.origin.y+90
            
            lbl_bungalow.frame.origin.y =  bungalow_btn.frame.origin.y+90
            
            lbl_building.frame.origin.y = building_btn.frame.origin.y+90
            
            lbl_hotel.frame.origin.y = hotel_btn.frame.origin.y+90
            
            lbl_institute.frame.origin.y = institute_btn.frame.origin.y+90
            
            lbl_hospital.frame.origin.y = hospital_btn.frame.origin.y+90
                
            }else{
                
                lbl_plot.frame.origin.y = plot_btn.frame.origin.y+114
                
                lbl_factory.frame.origin.y = factory_btn.frame.origin.y+114
                
                lbl_office.frame.origin.y = office_btn.frame.origin.y+114
                
                lbl_bungalow.frame.origin.y =  bungalow_btn.frame.origin.y+114
                
                lbl_building.frame.origin.y = building_btn.frame.origin.y+114
                
                lbl_hotel.frame.origin.y = hotel_btn.frame.origin.y+114
                
                lbl_institute.frame.origin.y = institute_btn.frame.origin.y+114
                
                lbl_hospital.frame.origin.y = hospital_btn.frame.origin.y+114
                
 
            }
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        
        info_btn.hidden = true
        
        //contact_btn.hidden = true
        
        navigation_title.text =  "Advance Vastu"
        
        
        self.navigationController?.navigationBarHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func tapPlot_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(1, forKey: "tagValue")
        
//        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
//        
//        self.showViewController(subAdvancevastuView as! UIViewController, sender:
//            subAdvancevastuView)
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC") as! subAdvanceVastuViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
    }
    @IBAction func tapFactory_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(2, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    @IBAction func tapOffice_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(3, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    
    @IBAction func tapBangalow_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(4, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    
    @IBAction func tapBuilding_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(5, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    
    @IBAction func tapHotel_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(6, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    
    @IBAction func tapInstitute_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(7, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    @IBAction func tapHospital_btn(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(8, forKey: "tagValue")
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subAdvanceVastuVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    
    @IBAction func info_btn_tuch(sender: AnyObject) {
    }
    
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func contact_btn_tuch(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }
    
}