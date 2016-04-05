//
//  onlineVastuViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit


class onlineVastuViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var scroll_View: UIScrollView!
    @IBOutlet weak var receivedetail_lbl: UILabel!
    @IBOutlet weak var receiveheader_lbl: UILabel!
    @IBOutlet weak var submitdetail_lbl: UILabel!
    @IBOutlet weak var submitheader_lbl: UILabel!
    @IBOutlet weak var submit_btn: UIButton!
    @IBOutlet weak var advicedetail_lbl: UILabel!
    @IBOutlet weak var adviceheader_lbl: UILabel!
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    @IBOutlet weak var onlineWebView: UIWebView!
    @IBOutlet weak var office_btn: UIButton!
    @IBOutlet weak var bungalow_btn: UIButton!
    @IBOutlet weak var apartment_btn: UIButton!
    @IBOutlet weak var line1_View: UIView!
    @IBOutlet weak var line2_View: UIView!
    override func
        
        viewDidLoad() {
            super.viewDidLoad()
            
//            self.revealViewController().panGestureRecognizer()
//            
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            

            navigation_view.frame.size.width = self.view.frame.size.width
            
            info_btn.hidden = true
            
            
            NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
            
            
            navigation_title.frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
            
            
            if self.view.frame.size.width==375{
                contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
            }
            
            submit_btn.backgroundColor = navigation_view.backgroundColor
            
            adviceheader_lbl.frame.size.width = self.view.frame.size.width-24
            
            advicedetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            submitheader_lbl.frame.size.width = self.view.frame.size.width-24
            
            submitdetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            receivedetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            receiveheader_lbl.frame.size.width = self.view.frame.size.width-24
            
            
            submit_btn.frame.origin.x = (self.view.frame.size.width - submit_btn.frame.size.width)/2
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            
            apartment_btn.addTarget(self, action:"changeColor:", forControlEvents: UIControlEvents.TouchUpInside)
            
            apartment_btn.tag=1
            
            bungalow_btn.addTarget(self, action:"changeColor:", forControlEvents: UIControlEvents.TouchUpInside)
            
            bungalow_btn.tag=2
            
            office_btn.addTarget(self, action:"changeColor:", forControlEvents: UIControlEvents.TouchUpInside)
            
            
            office_btn.tag=3
            
            if self.view.frame.size.height<1024{
            
            apartment_btn.frame = CGRectMake(0, 0, (self.view.frame.width-4)/3, 55)
            
            bungalow_btn.frame = CGRectMake(apartment_btn.frame.width+2, 0, (self.view.frame.width-4)/3, 55)
            
            office_btn.frame = CGRectMake(bungalow_btn.frame.width+apartment_btn.frame.width+3,0, (self.view.frame.width-4)/3, 55)
            }

            apartment_btn.backgroundColor = UIColor.lightGrayColor()
            
            bungalow_btn.backgroundColor = UIColor.lightGrayColor()
            
            office_btn.backgroundColor = UIColor.lightGrayColor()
           
            line1_View.frame.size.height = apartment_btn.frame.size.height
            
            line1_View.frame.origin.x = bungalow_btn.frame.origin.x-1
            
            line2_View.frame.size.height = apartment_btn.frame.size.height
            
            line2_View.frame.origin.x = office_btn.frame.origin.x-1
            
            adviceheader_lbl.frame.size.width = self.view.frame.size.width-24
            
            advicedetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            submit_btn.layer.cornerRadius = 5.0
            
            adviceheader_lbl.text = "Vastu Advice for Residential Apartment"
            
            
            advicedetail_lbl.text = "Benefits achievable by modifying your Residential flat / Apartment as per Vastushastra\n• More peace of mind.\n• Better co-ordination with family members.\n• Success & prosperity.\n• Improved health.\n• Statbility of finances.\n• Helps in improving concentration on studies.\n• Helps in timely marriage of children.\n• Improves relationship of the wedded couple."
            
            submitheader_lbl.text = "Please submit the following details:-"
            
            submitdetail_lbl.text = "• Send 1 page layout plan (drawing / sketch) of the property. (incase of Bungalow, then please send 1 page layout plan of each floor).\n• Please mark the Magnetic North direction on the layout plan (drawing).\n• For better insight, you could send photographs of the property ie if it is residential home project then please send photographs of the main door (from outside and inside), bedroom, drawing room etc. (sending the photographs is suggested, but, it is optional).\n• You may send upto 5 Questions / Queries / History / Feedback pertaining to the property ."
            
            receiveheader_lbl.text = "What you will receive"
            
            receivedetail_lbl.text = "Through Email, you will get a detailed customised Vastu Report. We devote sufficient time to diagnose the layouts / photos and identify the flaws and Vastu Doshas. The Vastu Report would contain the 'Observations' and 'Suggestions' on Macro and Micro level. We shall mention the idealist solutions. We understand that many a times it is not possible to do the structural changes hence we shall also give workable (practical) solutions / remedies which would help you to improve your life and business."
            
            adviceheader_lbl.sizeToFit()
            
            advicedetail_lbl.sizeToFit()
            
            submitheader_lbl.sizeToFit()
            
            submitdetail_lbl.sizeToFit()
            
            receiveheader_lbl.sizeToFit()
            
            receivedetail_lbl.sizeToFit()
            
            advicedetail_lbl.frame.origin.y =  adviceheader_lbl.frame.origin.y + adviceheader_lbl.frame.size.height+10
            
            submit_btn.frame.origin.y =  advicedetail_lbl.frame.origin.y + advicedetail_lbl.frame.size.height+15
            
            submitheader_lbl.frame.origin.y =  submit_btn.frame.origin.y + submit_btn.frame.size.height+15
            
            submitdetail_lbl.frame.origin.y =   submitheader_lbl.frame.origin.y +  submitheader_lbl.frame.size.height+3
            
            receiveheader_lbl.frame.origin.y =   submitdetail_lbl.frame.origin.y +  submitdetail_lbl.frame.size.height+8
            
            receivedetail_lbl.frame.origin.y =   receiveheader_lbl.frame.origin.y +  receiveheader_lbl.frame.size.height+3
            
            scroll_View.contentSize = CGSize(width:self.view.frame.size.width, height:receivedetail_lbl.frame.origin.y+receivedetail_lbl.frame.size.height+90)
            
            //scroll_View.frame.origin.y = 65
            
    }
    
    
    
    func changeColor(sendr:UIButton){
        
        switch sendr.tag {
            
        case 1:
            
            
           apartment_btn.backgroundColor = UIColor.lightGrayColor()
            
           bungalow_btn.backgroundColor =  UIColor.lightGrayColor()
            
           office_btn.backgroundColor = UIColor.lightGrayColor()

            
            adviceheader_lbl.frame.size.width = self.view.frame.size.width-24
            advicedetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            adviceheader_lbl.text = "Vastu Advice for Residential Apartment"
            
            
            advicedetail_lbl.text = "Benefits achievable by modifying your Residential flat / Apartment as per Vastushastra\n• More peace of mind.\n• Better co-ordination with family members.\n• Success & prosperity.\n• Improved health.\n• Statbility of finances.\n• Helps in improving concentration on studies.\n• Helps in timely marriage of children.\n• Improves relationship of the wedded couple."
            
            submitheader_lbl.text = "Please submit the following details:-"
            
            submitdetail_lbl.text = "• Send 1 page layout plan (drawing / sketch) of the property. (incase of Bungalow, then please send 1 page layout plan of each floor).\n• Please mark the Magnetic North direction on the layout plan (drawing).\n• For better insight, you could send photographs of the property ie if it is residential home project then please send photographs of the main door (from outside and inside), bedroom, drawing room etc. (sending the photographs is suggested, but, it is optional).\n•You may send upto 5 Questions / Queries / History / Feedback pertaining to the property ."
            
            receiveheader_lbl.text = "What you will receive"
            
            receivedetail_lbl.text = "Through Email, you will get a detailed customised Vastu Report. We devote sufficient time to diagnose the layouts / photos and identify the flaws and Vastu Doshas. The Vastu Report would contain the 'Observations' and 'Suggestions' on Macro and Micro level. We shall mention the idealist solutions. We understand that many a times it is not possible to do the structural changes hence we shall also give workable (practical) solutions / remedies which would help you to improve your life and business."
            
            adviceheader_lbl.sizeToFit()
            
            advicedetail_lbl.sizeToFit()
            
            submitheader_lbl.sizeToFit()
            
            submitdetail_lbl.sizeToFit()
            
            receivedetail_lbl.sizeToFit()
            
            receiveheader_lbl.sizeToFit()
            
            advicedetail_lbl.frame.origin.y =  adviceheader_lbl.frame.origin.y + adviceheader_lbl.frame.size.height+10
            
            submit_btn.frame.origin.y =  advicedetail_lbl.frame.origin.y + advicedetail_lbl.frame.size.height+10
            
            submitheader_lbl.frame.origin.y =  submit_btn.frame.origin.y + submit_btn.frame.size.height+10
            
            submitdetail_lbl.frame.origin.y =   submitheader_lbl.frame.origin.y +  submitheader_lbl.frame.size.height+10
            
            receiveheader_lbl.frame.origin.y =   submitdetail_lbl.frame.origin.y +  submitdetail_lbl.frame.size.height+10
            
            receivedetail_lbl.frame.origin.y =   receiveheader_lbl.frame.origin.y +  receiveheader_lbl.frame.size.height+10
            
            scroll_View.contentSize = CGSize(width:self.view.frame.size.width, height:receivedetail_lbl.frame.origin.y+receivedetail_lbl.frame.size.height+90)
            
            
            break
            
            
            
            
        case 2:
            
            adviceheader_lbl.frame.size.width = self.view.frame.size.width-24
            
            advicedetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            bungalow_btn.backgroundColor = UIColor.lightGrayColor()
            
            apartment_btn.backgroundColor =  UIColor.lightGrayColor()
            
            office_btn.backgroundColor =  UIColor.lightGrayColor()
            
            adviceheader_lbl.text = "Vastu Advice for Residential Bungalow"
            
            
            advicedetail_lbl.text = "Benefits achievable by modifying your Residential Bungalow as per Vastushastra\n• More peace of mind.\n• Better co-ordination with family members.\n•Success & prosperity.\n• Improved health.\n• Statbility of finances.\n• Helps in improving concentration on studies.\n• Helps in timely marriage of children.\n• Improves relationship of the wedded couple."
            
            submitheader_lbl.text = "Please submit the following details:-"
            
            submitdetail_lbl.text = "• Send 1 page layout plan (drawing / sketch) of the property. (incase of Bungalow, then please send 1 page layout plan of each floor).\n• Please mark the Magnetic North direction on the layout plan (drawing).\n• For better insight, you could send photographs of the property ie if it is residential home project then please send photographs of the main door (from outside and inside), bedroom, drawing room etc. (sending the photographs is suggested, but, it is optional).\n•You may send upto 5 Questions / Queries / History / Feedback pertaining to the property ."
            
            receiveheader_lbl.text = "What you will receive"
            
            receivedetail_lbl.text = "Through Email, you will get a detailed customised Vastu Report. We devote sufficient time to diagnose the layouts / photos and identify the flaws and Vastu Doshas. The Vastu Report would contain the 'Observations' and 'Suggestions' on Macro and Micro level. We shall mention the idealist solutions. We understand that many a times it is not possible to do the structural changes hence we shall also give workable (practical) solutions / remedies which would help you to improve your life and business."
            
            adviceheader_lbl.sizeToFit()
            
            advicedetail_lbl.sizeToFit()
            
            submitheader_lbl.sizeToFit()
            
            submitdetail_lbl.sizeToFit()
            
            receivedetail_lbl.sizeToFit()
            
            receiveheader_lbl.sizeToFit()
            
            advicedetail_lbl.frame.origin.y =  adviceheader_lbl.frame.origin.y + adviceheader_lbl.frame.size.height+10
            
            submit_btn.frame.origin.y =  advicedetail_lbl.frame.origin.y + advicedetail_lbl.frame.size.height+10
            
            submitheader_lbl.frame.origin.y =  submit_btn.frame.origin.y + submit_btn.frame.size.height+10
            
            submitdetail_lbl.frame.origin.y =   submitheader_lbl.frame.origin.y +  submitheader_lbl.frame.size.height+10
            
            receiveheader_lbl.frame.origin.y =   submitdetail_lbl.frame.origin.y +  submitdetail_lbl.frame.size.height+10
            
            receivedetail_lbl.frame.origin.y =   receiveheader_lbl.frame.origin.y +  receiveheader_lbl.frame.size.height+10
            
            scroll_View.contentSize = CGSize(width:self.view.frame.size.width, height:receivedetail_lbl.frame.origin.y+receivedetail_lbl.frame.size.height+90)
            
            
            break
            
        case 3:
            
            advicedetail_lbl.frame.size.width = self.view.frame.size.width-24
            
            adviceheader_lbl.frame.size.width = self.view.frame.size.width-24
            
            
            office_btn.backgroundColor = UIColor.lightGrayColor()
            
            bungalow_btn.backgroundColor =  UIColor.lightGrayColor()
            
            apartment_btn.backgroundColor =  UIColor.lightGrayColor()
            
            adviceheader_lbl.text = "Vastu Advice for Commercial Shop / Office"
            
            
            advicedetail_lbl.text = "Benefits achievable by modifying your Office as per Vastushastra\n• Experience success, prosperity and growth.\n• Improve sales revenue and profitability.\n• Attain strong revenue growth and stability of finances.\n• Foster better co-ordination with employees and management etc.\n• Mininize the machinery break-down.\n• Achieve higher output (production).\n• Upscale your business and profession.\n• Stimulate faster movement of stocks and merchandise.\n• Helps to gather more clientele and repute."
            
            submitheader_lbl.text = "Please submit the following details:-"
            
            submitdetail_lbl.text = "• Send 1 page layout plan (drawing / sketch) of the property. (incase of Bungalow, then please send 1 page layout plan of each floor).\n• Please mark the Magnetic North direction on the layout plan (drawing).\n• For better insight, you could send photographs of the property ie if it is residential home project then please send photographs of the main door (from outside and inside), bedroom, drawing room etc. (sending the photographs is suggested, but, it is optional).\n•You may send upto 5 Questions / Queries / History / Feedback pertaining to the property ."
            
            receiveheader_lbl.text = "What you will receive"
            
            receivedetail_lbl.text = "Through Email, you will get a detailed customised Vastu Report. We devote sufficient time to diagnose the layouts / photos and identify the flaws and Vastu Doshas. The Vastu Report would contain the 'Observations' and 'Suggestions' on Macro and Micro level. We shall mention the idealist solutions. We understand that many a times it is not possible to do the structural changes hence we shall also give workable (practical) solutions / remedies which would help you to improve your life and business."
            
            adviceheader_lbl.sizeToFit()
            
            advicedetail_lbl.sizeToFit()
            
            submitheader_lbl.sizeToFit()
            
            submitdetail_lbl.sizeToFit()
            
            receivedetail_lbl.sizeToFit()
            
            receiveheader_lbl.sizeToFit()
            
            advicedetail_lbl.frame.origin.y =  adviceheader_lbl.frame.origin.y + adviceheader_lbl.frame.size.height+10
            
            submit_btn.frame.origin.y =  advicedetail_lbl.frame.origin.y + advicedetail_lbl.frame.size.height+10
            
            submitheader_lbl.frame.origin.y =  submit_btn.frame.origin.y + submit_btn.frame.size.height+10
            
            submitdetail_lbl.frame.origin.y =   submitheader_lbl.frame.origin.y +  submitheader_lbl.frame.size.height+10
            
            receiveheader_lbl.frame.origin.y =   submitdetail_lbl.frame.origin.y +  submitdetail_lbl.frame.size.height+10
            
            receivedetail_lbl.frame.origin.y =   receiveheader_lbl.frame.origin.y +  receiveheader_lbl.frame.size.height+10
            
            scroll_View.contentSize = CGSize(width:self.view.frame.size.width, height:receivedetail_lbl.frame.origin.y+receivedetail_lbl.frame.size.height+90)
            
            
            break
            
            
        default :
            
            break
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        info_btn.hidden = true
        
        //contact_btn.hidden = true
        
        navigation_title.text =  "Online Vastu"
        
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
    
    @IBAction func submitEnquiry(sender: AnyObject) {
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("enquiryVC")
        self.showViewController(vc as! UIViewController, sender: vc)
        
    }
    
}
