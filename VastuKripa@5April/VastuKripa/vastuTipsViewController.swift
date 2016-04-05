//
//  vastuTipsViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class vastuTipsViewController: UIViewController {
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!

    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
   // var subVastu:SubVastuTips
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var Background_view: UIView!
    @IBOutlet weak var tijori_button: UIButton!
    @IBOutlet weak var toilet_button: UIButton!
    @IBOutlet weak var tample_button: UIButton!
    @IBOutlet weak var studyRoom_button: UIButton!
    @IBOutlet weak var kitchen_button: UIButton!
    @IBOutlet weak var entranceRoom_button: UIButton!
    @IBOutlet weak var construction_button: UIButton!
    @IBOutlet weak var livingRoom_button: UIButton!
    @IBOutlet weak var bedroom_button: UIButton!
    
    @IBOutlet weak var lbl_studyRoom: UILabel!
    @IBOutlet weak var lbl_poojasthan: UILabel!
    @IBOutlet weak var lbl_bedRoom: UILabel!
    
    @IBOutlet weak var lbl_tijori: UILabel!
    @IBOutlet weak var lbl_toilet: UILabel!
    @IBOutlet weak var lbl_kitchen: UILabel!
    @IBOutlet weak var lbl_entranceRoom: UILabel!
    @IBOutlet weak var lbl_construction: UILabel!
    @IBOutlet weak var lbl_livingRoom: UILabel!
    var interface = ""
    
    override func
        viewDidLoad() {
        super.viewDidLoad()
            
//            self.revealViewController().panGestureRecognizer()
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad{
                
            interface = "ipad"
                
        }else{
                
            interface = "iphone"
        
        }
  
        navigation_view.frame.size.width = self.view.frame.size.width
        
        info_btn.hidden = true
            
        back_btn.hidden = false
            
            
        navigation_title.frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
       
            
        if self.view.frame.size.width==375{
                contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
         }

        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
         self.navigationController?.navigationBarHidden = false

         self.title = "Vastu Tips"
        
         self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        self.view.backgroundColor=UIColor.whiteColor()
            
    
            
        bedroom_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        bedroom_button.frame = CGRectMake(5,5,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        bedroom_button.tag=1;
        
        livingRoom_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        livingRoom_button.frame = CGRectMake((self.view.frame.size.width-15)/2+10,5,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)

        livingRoom_button.tag=2;
            
        construction_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
       
        construction_button.frame = CGRectMake(5,(self.view.frame.size.width-15)/2+10,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        construction_button.tag=3;
        
        entranceRoom_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        entranceRoom_button.frame = CGRectMake((self.view.frame.size.width-16)/2+10,(self.view.frame.size.width-15)/2+10,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        entranceRoom_button.tag=4;
        
            
        tample_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
            
        tample_button.frame = CGRectMake(5,3*(self.view.frame.size.width-15)/2+20,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
            
        tample_button.tag=7;
            
        studyRoom_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        studyRoom_button.frame = CGRectMake((self.view.frame.size.width-15)/2+10,2*(self.view.frame.size.width-15)/2+15,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        studyRoom_button.tag=6;
            
        kitchen_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
            
        kitchen_button.frame = CGRectMake(5,2*(self.view.frame.size.width-15)/2+15,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
            
        kitchen_button.tag=5

        toilet_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        toilet_button.frame = CGRectMake((self.view.frame.size.width-15)/2+10,3*(self.view.frame.size.width-15)/2+20,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)
        
        toilet_button.tag=8;
            
        tijori_button.addTarget(self, action:"getInfo:", forControlEvents: UIControlEvents.TouchUpInside)
            
      tijori_button.frame = CGRectMake(5,4*(self.view.frame.size.width-15)/2+25,(self.view.frame.size.width-15)/2,(self.view.frame.size.width-15)/2)    
        
        tijori_button.tag=9
            
            
        scrollView.contentSize = CGSize(width:self.view.frame.size.width, height:tijori_button.frame.origin.y+tijori_button.frame.size.height+75)
        
        Background_view.frame.size.height = tijori_button.frame.origin.y+tijori_button.frame.size.height+215
            
            
            lbl_bedRoom.frame.origin.x = bedroom_button.frame.origin.x
            
            lbl_livingRoom.frame.origin.x = livingRoom_button.frame.origin.x
            
            lbl_construction.frame.origin.x = construction_button.frame.origin.x
            
            lbl_entranceRoom.frame.origin.x = entranceRoom_button.frame.origin.x
            
            lbl_poojasthan.frame.origin.x = tample_button.frame.origin.x
            
            
            lbl_studyRoom.frame.origin.x = studyRoom_button.frame.origin.x
            
            lbl_kitchen.frame.origin.x = kitchen_button.frame.origin.x
            
            lbl_toilet.frame.origin.x = toilet_button.frame.origin.x
            
            
            lbl_tijori.frame.origin.x = tijori_button.frame.origin.x

        
            if interface == "iphone"{
                
                print(self.view.frame.size.width)
              
                if self.view.frame.size.width<=320{
                    
                    lbl_bedRoom.frame.origin.y = bedroom_button.frame.origin.y+90
                    
                    lbl_livingRoom.frame.origin.y = livingRoom_button.frame.origin.y+90
                    
                    lbl_construction.frame.origin.y = construction_button.frame.origin.y+90
                    
                    lbl_entranceRoom.frame.origin.y = entranceRoom_button.frame.origin.y+90
                    
                    lbl_poojasthan.frame.origin.y = tample_button.frame.origin.y+90
                    
                    lbl_studyRoom.frame.origin.y = studyRoom_button.frame.origin.y+90
                    
                    lbl_kitchen.frame.origin.y = kitchen_button.frame.origin.y+90
                    
                    lbl_tijori.frame.origin.y = tijori_button.frame.origin.y+90
                    
                    lbl_toilet.frame.origin.y = toilet_button.frame.origin.y+90
                    
                }else{
                
                lbl_bedRoom.frame.origin.y = bedroom_button.frame.origin.y+114
  
                lbl_livingRoom.frame.origin.y = livingRoom_button.frame.origin.y+114
                
                lbl_construction.frame.origin.y = construction_button.frame.origin.y+114

                lbl_entranceRoom.frame.origin.y = entranceRoom_button.frame.origin.y+114

                lbl_poojasthan.frame.origin.y = tample_button.frame.origin.y+114
                
                lbl_studyRoom.frame.origin.y = studyRoom_button.frame.origin.y+114
                
                lbl_kitchen.frame.origin.y = kitchen_button.frame.origin.y+114

                lbl_tijori.frame.origin.y = tijori_button.frame.origin.y+114

                lbl_toilet.frame.origin.y = toilet_button.frame.origin.y+114
                }
                
            }else{

            scrollView.frame.origin.y = 45
                
            scrollView.contentSize = CGSize(width:self.view.frame.size.width, height:tijori_button.frame.origin.y+tijori_button.frame.size.height+55)
            }
    }
    
func getInfo(sendr:UIButton) {
        
        if sendr.tag==1{
            
           NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
           let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
             //scrollView.contentSize = CGSize(width:self.view.frame.size.width, height:self.view.frame.size.height+1110)
            
            
        }
        
       if sendr.tag==2{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        
        if sendr.tag==3{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        
        if sendr.tag==4{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        
        if sendr.tag==5{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        if sendr.tag==6{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        
        if sendr.tag==7{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        if sendr.tag==8{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        if sendr.tag==9{
            
            NSUserDefaults.standardUserDefaults().setObject(sendr.tag, forKey: "tagValue")
            
            let subvastuview : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("subVastuVC")
            
            self.showViewController(subvastuview as! UIViewController, sender: subvastuview)
            
        }
        
        
    }
    
   override func viewWillAppear(animated: Bool) {
        
        navigation_view.hidden = false
        
        info_btn.hidden = true
        
        //contact_btn.hidden = true
        
        navigation_title.text =  "Vastu Tips"
        
        
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
