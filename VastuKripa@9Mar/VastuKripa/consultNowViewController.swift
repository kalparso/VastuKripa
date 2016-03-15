//
//  consultNowViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class consultNowViewController: UIViewController,UIWebViewDelegate,UIGestureRecognizerDelegate {
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var popupOK: UIButton!
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
        
        self.revealViewController().panGestureRecognizer()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        info_btn.hidden = true
        
        var frame = navigation_title.frame
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
        contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        }
        
        upper_view.frame.size.width = self.view.frame.width
        
        
        popup_View.frame.origin.x = (self.view.frame.size.width - popup_View.frame.size.width)/2
        
        consultWebView.frame.size.width = self.view.frame.size.width
        
        popup_View.layer.borderWidth = 1.0
        
        popup_View.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        popupOK.layer.cornerRadius = 3.0
        
        consultNow_btn.layer.cornerRadius = 3.0
        
        upper_view.hidden = true
        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
         self.navigationController?.navigationBarHidden = false

         self.title = "Consult Now"
        
        consultNow_btn.backgroundColor = navigation_view.backgroundColor
        
        popupOK.backgroundColor = popupOK.backgroundColor
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        consult_scrollView.frame.size.height = self.view.frame.size.height
        
        if self.view.frame.size.height<1024{

        consultNow_imgView.frame = CGRectMake(118,15,self.view.frame.width-236,self.view.frame.width-236)
        
        consultNow_btn.frame = CGRectMake(60, 155,self.view.frame.width-200,35)
        
        consultNow_btn.frame.origin.x = (self.view.frame.size.width - consultNow_btn.frame.size.width)/2
            
        //consultWebView.frame = CGRectMake(0,self.consultNow_btn.frame.origin.y+40,self.view.frame.width,1040)
            
         
            
        }else{
            
            upper_view.frame.size.height = self.view.frame.size.height
        }
        upper_view.frame.size.width = self.view.frame.size.width
        upper_view.frame.size.height = self.view.frame.size.height
        
        consultNow_btn.frame.origin.y = consultNow_imgView.frame.origin.y+consultNow_imgView.frame.size.height+15
        
        consultWebView.frame.origin.y = consultNow_btn.frame.origin.y+consultNow_btn.frame.size.height+5
        
        
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
        
        //consultWebView.frame.size.height = self.view.frame.size.height
        
        //consult_scrollView.contentSize = CGSizeMake(self.view.frame.size.width,consultWebView.frame.size.height)
        
        upper_view.frame.size.height = consultWebView.frame.size.height+50
        
        
       consultWebView.sizeToFit()
        
        print(consultWebView.scrollView.contentSize.height)
        
         print(consultWebView.frame.size.height)
        
        
         //consultWebView.scrollView.scrollEnabled = false

    }
    
func webViewDidFinishLoad(webView: UIWebView) {
        
        consultWebView.sizeToFit()
        
        print(consultWebView.scrollView.contentSize.height)
        
        print(consultWebView.frame.size.height)
        
        
       // consult_scrollView.frame.size.height = consultWebView.scrollView.contentSize.height+consultWebView.frame.origin.y
       
        consult_scrollView.contentSize = CGSizeMake(self.view.frame.size.width,consultWebView.frame.size.height+consultWebView.frame.origin.y+50)
        

}
    
    override func viewWillAppear(animated: Bool) {
        
        //navigation_view.hidden = false
        
        info_btn.hidden = true
        
        navigation_title.text =  "Consult Now"
        
        
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
    @IBAction func FixAppoinment(sender: AnyObject) {
        
        //upper_view.hidden = false
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
         self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
//        upper_view.hidden = false
//        
//        upper_view.frame.size.height = self.view.frame.size.height
//        
//        popup_View.frame.origin.y =
//            consultNow_btn.frame.origin.y+5
//        
//        
//        btn_mobile1.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        btn_mobile1.tag=1;
//        
//        btn_mobile2.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        btn_mobile2.tag=2;
//        
//        btn_email.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        btn_email.tag=3;
//        
//        btn_skypeid.addTarget(self, action:"contactInfo:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        btn_skypeid.tag=4;
//        
//        upper_view.backgroundColor = UIColor(red: 0, green: 0.1, blue: 0.1, alpha: 0.2)
//        
//        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
//        tap.delegate = self
//        
//        upper_view.addGestureRecognizer(tap)
        
    }
   
@IBAction func popupOK_btn(sender: AnyObject) {
        
        upper_view.hidden = true
    

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



}
