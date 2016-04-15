//
//  subVastuTips.swift
//  VastuKripa
//
//  Created by Promatics on 1/2/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class subVastuTips: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    @IBOutlet weak var SubVastuTipsWebView: UIWebView!
    
    var start = 0
    
    var Reqest = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.view.frame.size.width == 414{
            
            contact_btn.frame.origin.x = self.view.frame.size.width-contact_btn.frame.size.width-15
        }
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        info_btn.hidden = true
        
        self.navigationController?.navigationBarHidden = true
        
        var frame = navigation_title.frame
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
            
            SubVastuTipsWebView.frame.size.height = 600
       }
        
        NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
        
        SubVastuTipsWebView.delegate = self
        
        SubVastuTipsWebView.frame.size.width = self.view.frame.size.width
        

        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tagValue  = defaults.valueForKey("tagValue") as! Int
        
        SubVastuTipsWebView.backgroundColor=UIColor.clearColor()
        
        switch tagValue{
            
        case 1 :
            
            navigation_title.text = "Bed Room"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
          if self.view.frame.size.width==768{
            
               let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_ipad", ofType:"html")!)
            
               let request = NSURLRequest(URL: url)
               SubVastuTipsWebView.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                SubVastuTipsWebView.loadRequest(request)
                
            }
            
            SubVastuTipsWebView.delegate = self
            
            break
            
        case 2 :
            
            navigation_title.text = "Living Room"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
       
           
        if self.view.frame.size.width==768{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("living_room_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
             SubVastuTipsWebView.loadRequest(request)
            
        }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("living_room", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)
            
            }
            
            SubVastuTipsWebView.delegate = self
            
            break
            
            
        case 3 :
            
            navigation_title.text = "Under Construction"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
         if self.view.frame.size.width==768{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("under_construction_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)
            
         }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("under_construction", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)
            
            }
            
            SubVastuTipsWebView.delegate = self
           
            
            break
            
        case 4 :
            
            navigation_title.text = "Entrance Door"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
         
        if self.view.frame.size.width==768{
            
             let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("entrance_door_ipad", ofType:"html")!)
            
             let request = NSURLRequest(URL: url)
            
             SubVastuTipsWebView.loadRequest(request)
            
        }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("entrance_door", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)
            
            }
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
            
        case 5 :
            
           navigation_title.text  = "Kitchen"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        if self.view.frame.size.width==768{
        
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            
    
            
        }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)

            
            SubVastuTipsWebView.loadRequest(request)
            
            }
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 6 :
            
            navigation_title.text  = "Study Room"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
        if self.view.frame.size.width==768{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("study_room_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            
        }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("study_room", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            
            }
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 7 :
            
            navigation_title.text = "Temple"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
          
        if self.view.frame.size.width==768{
   
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)
        }else{
            
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)
            
            }
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 8 :
    
            navigation_title.text  = "Toilet"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
        if self.view.frame.size.width==768{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
        
            
            SubVastuTipsWebView.loadRequest(request)
        }else{
            
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            
            SubVastuTipsWebView.loadRequest(request)
            
            }
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 9 :
            
           navigation_title.text = "Tijori"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
        if self.view.frame.size.width==768{

            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("tijori_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            
            SubVastuTipsWebView.loadRequest(request)
            
        }else{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("tijori", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            
            SubVastuTipsWebView.loadRequest(request)

            
            }
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
            
        default :
            
            break
        }
        
        // Do any additional setup after loading the view.
    }
  
    
    override func viewWillAppear(animated: Bool) {
        
            
        info_btn.hidden = true
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
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
    
func webViewDidFinishLoad(webView: UIWebView) {
    
   
    
    }
    
func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    
    
    if  start == 1{
    
    let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("productVC")
    self.showViewController(vc as! UIViewController, sender: vc)
        
        return false
        
    }
    
    start = 1
    
        return true
        
    }
    
    

    
}
