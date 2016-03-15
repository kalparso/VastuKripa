//
//  contactUsViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class contactUsViewController: UIViewController {
    
    @IBOutlet weak var vastuKripa_img: UIImageView!
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!

    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var logo_img: UIImageView!
    
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var address_lbl: UILabel!
    @IBOutlet weak var telephone_lbl: UILabel!
    @IBOutlet weak var email_lbl: UILabel!
    @IBOutlet weak var findUs_lbl: UILabel!
    @IBOutlet weak var website_lbl: UILabel!
    @IBOutlet weak var mobile_lbl: UILabel!
    @IBOutlet weak var vastu_img: UIImageView!
    
    @IBOutlet weak var btn_Telephone: UIButton!
    
    @IBOutlet weak var btn_Mobile1: UIButton!
    
    @IBOutlet weak var btn_Mobile2: UIButton!
    
    @IBOutlet weak var btn_Website: UIButton!
    @IBOutlet weak var btn_Email: UIButton!
    
    @IBOutlet weak var btn_Facebook: UIButton!
    
    @IBOutlet weak var btn_Linkedin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.revealViewController().panGestureRecognizer()
//        
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        info_btn.hidden = true
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        var frame = navigation_title.frame
        
       
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        }

        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
        self.navigationController?.navigationBarHidden = false
        
        self.title = "Contact Us"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        frame = scrollView.frame
        
        frame.origin.x = (self.view.frame.size.width-scrollView.frame.size.width)/2
        
        scrollView.frame=frame
        
        btn_Telephone.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_Telephone.tag=1
        
        btn_Mobile1.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
//        btn_Mobile1.tag=2
//        
//        
//        btn_Mobile2.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        btn_Mobile2.tag=3
        
        btn_Email.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_Email.tag=4
        
        btn_Website.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_Website.tag=5
        
        btn_Facebook.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_Facebook.tag=6
        
        btn_Linkedin.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        btn_Linkedin.tag=7
        
                
       
        
        //scrollView.frame.size.height = vastu_img.frame.origin.y+vastu_img.frame.size.height+30)
        
//        btn_Facebook.layer.cornerRadius = 10.0
//        
//        btn_Linkedin.layer.cornerRadius = 10.0
//        
//        btn_Linkedin.layer.masksToBounds = true
//        
//        btn_Facebook.layer.masksToBounds = true
        
    }
    
 func contactInfo(sendr:UIButton){
        
        
        switch sendr.tag{
            
        case 1:
            
            UIApplication.sharedApplication().openURL(NSURL(string:"tel://912226736711")!)
            
            break
            
        case 2:
            
            UIApplication.sharedApplication().openURL(NSURL(string:"tel://919821515194")!)
            
            break
            
        case 3:
            
            UIApplication.sharedApplication().openURL(NSURL(string:"tel:919324522891")!)
            
            break
            
        case 4:
            UIApplication.sharedApplication().openURL(NSURL(string:"mailto:vastukripa@gmail.com?")!)
            
            break
            
        case 5:
            UIApplication.sharedApplication().openURL(NSURL(string:"http://www.vastukripa.com")!)
            
            break
            
        case 6:
            
            if(UIApplication.sharedApplication().openURL(NSURL(string:"fb://")!))
            {
                UIApplication.sharedApplication().openURL(NSURL(string:"fb://pages/145989492223613")!)
            }else{
                
                UIApplication.sharedApplication().openURL(NSURL(string:"https://www.facebook.com/pages/Vastu-Kripa/145989492223613")!)
                
            }
            
            break
            
        case 7:
            
           UIApplication.sharedApplication().openURL(NSURL(string:"http://in.linkedin.com/pub/khushal-sachdeva/16/35/8b5")!)
            
            break

            
        default :
            
            break
            
        }
    }
    override func viewWillAppear(animated: Bool) {
        
        //navigation_view.hidden = false
        
        info_btn.hidden = true
        
        contact_btn.hidden = true
        
        navigation_title.text = "Contact Us"
        
        
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
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsViewController")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }

    
}
