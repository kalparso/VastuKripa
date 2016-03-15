//
//  profileViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//@"http://rate-exchange.appspot.com/"


import UIKit

class profileViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var info_btn: UIButton!
   
    @IBOutlet weak var contact_btn: UIButton!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet weak var profileWeb_View: UIWebView!
    
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.revealViewController().panGestureRecognizer()
//        
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
         navigation_view.frame.size.width = self.view.frame.size.width
        
         self.navigationController?.navigationBarHidden = true
        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
        var frame = navigation_title.frame
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        }
        
        self.view.backgroundColor=UIColor.whiteColor()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
 
        profileWeb_View.backgroundColor=UIColor.clearColor()
    
        
        if self.view.frame.size.width==768{
            
             let    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("profile_ipad", ofType:"html")!)
            
             let request = NSURLRequest(URL: url)
            
             profileWeb_View.loadRequest(request)

            
        }else{
      
        
            let  url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("profile", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
             profileWeb_View.loadRequest(request)

        }
        
        
        profileWeb_View.delegate = self
        
        [self.view .addSubview(profileWeb_View)]
        
        if self.view.frame.size.width==768{
            
           // profileWeb_View.scrollView.scrollEnabled = false
            
        }
    
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
         //navigation_view.hidden = false
        
         info_btn.hidden = true
        
         contact_btn.hidden = true
        
         navigation_title.text = "Profile"
        
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //profileWeb_View.loadRequest(NSURLRequest(URL: NSURL(string: "//http://rate-exchange.appspot.com/profile")!))
        
//        let url = NSURL(fileURLWithPath: "profile.html")
//        
//        let request = NSURLRequest(URL: url!)
//        
//        profileWeb_View.loadRequest(request)
//        
//        var testHTML = NSBundle.mainBundle().pathForResource("profile", ofType: "html")
//        var contents = NSString(contentsOfFile: testHTML!, encoding: NSUTF8StringEncoding, error: nil)
//        var baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
        
        //profileWeb_View.loadHTMLString(contents, baseURL: baseUrl)
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
        
        let contactUsViewController: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(contactUsViewController as! UIViewController, sender: contactUsViewController)
    }
    
   
}
