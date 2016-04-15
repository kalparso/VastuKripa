//
//  consultNowViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class consultNowViewController: UIViewController,UIWebViewDelegate,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var submit_btn: UIButton!
    @IBOutlet weak var contectUs_btn: UIButton!
    @IBOutlet weak var popupOK: UIButton!
    @IBOutlet weak var btn_View: UIView!
    @IBOutlet weak var contact_btn: UIButton!
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    @IBOutlet weak var consultNow_imgView: UIImageView!
    @IBOutlet weak var consultNow_btn: UIButton!
    @IBOutlet weak var consult_scrollView: UIScrollView!
    @IBOutlet weak var consultWebView: UIWebView!
    @IBOutlet weak var popup_View: UIView!
    
    @IBOutlet weak var btn_mobile1: UIButton!
    
    @IBOutlet weak var btn_skypeid: UIButton!
    @IBOutlet weak var btn_email: UIButton!
    @IBOutlet weak var btn_mobile2: UIButton!
    
    @IBOutlet weak var upper_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_View.hidden = true
        
        btn_View.frame.origin.y = self.view.frame.size.width/2-btn_View.frame.size.width/2
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        var frame = navigation_title.frame
        
        submit_btn.layer.cornerRadius = 5
        
        contectUs_btn.layer.cornerRadius = 5
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
        }
        
        if self.view.frame.size.width == 414{
            
            consultNow_imgView.frame.origin.x = self.view.frame.size.width/2-consultNow_imgView.frame.size.width/2
        }
        
        consultWebView.scrollView.scrollEnabled = false

        consultWebView.frame.origin.x = 5
        
        consultWebView.frame.size.width = self.view.frame.size.width-30
        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
         self.navigationController?.navigationBarHidden = false

         self.title = "Consult Now"

        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        

        
        consultWebView.frame.origin.y = consultNow_imgView.frame.origin.y+consultNow_imgView.frame.size.height+10
        
        
        consultWebView.backgroundColor=UIColor.clearColor()
        
        
        if self.view.frame.size.width==768{
        
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("consultNow_ipad", ofType:"html")!)
        
             let request = NSURLRequest(URL: url)
             consultWebView.loadRequest(request)
            
        }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("consultNow", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            consultWebView.loadRequest(request)

            
        }
        
       consultWebView.delegate = self
    
       consultWebView.sizeToFit()
        
     }
    
 func webViewDidFinishLoad(webView: UIWebView) {
        
      consultWebView.sizeToFit()
        
    
      btn_View.frame.origin.y = consultWebView.frame.origin.y+consultWebView.frame.size.height-20
    
      btn_View.frame.origin.x = self.view.frame.size.width/2-btn_View.frame.size.width/2
    
      consult_scrollView.contentSize = CGSizeMake(self.view.frame.size.width,btn_View.frame.size.height+btn_View.frame.origin.y+65)
    
      btn_View.hidden = false

}
    
    override func viewWillAppear(animated: Bool) {
        
        navigation_title.text =  "Consult Now"
        
        
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
       
    }
    
    
@IBAction func FixAppoinment(sender: AnyObject) {
        
    
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
         self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
   
@IBAction func popupOK_btn(sender: AnyObject) {
        
    
}
   
    
func  handleTap(sendr:UIButton){
    
    upper_view.hidden = true
    
    
    }
    
func contactInfo(sendr:UIButton){
        
        
        switch sendr.tag{
            
        case 1:
            
            UIApplication.sharedApplication().openURL(NSURL(string:"tel://9324522891")!)
            
            break
            
        case 2:
            
            UIApplication.sharedApplication().openURL(NSURL(string:"tel://9821515194")!)
            
            break
            
        case 3:
            
            UIApplication.sharedApplication().openURL(NSURL(string:"mailto://vastukripa@gmail.com?")!)
            
            break
            
        case 4:
            UIApplication.sharedApplication().openURL(NSURL(string:"skype://VastuKripa?call")!)
            
            break
            
            
        default :
            
            break
            
        }
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

    @IBAction func contectUs_btn(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }


    @IBAction func SubmitQuery_btn(sender: AnyObject) {
        
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("enquiryVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }
   
}
