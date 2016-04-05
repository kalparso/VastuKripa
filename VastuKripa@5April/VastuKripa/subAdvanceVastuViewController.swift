//
//  subAdvanceVastuViewController.swift
//  VastuKripa
//
//  Created by Promatics on 1/2/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class subAdvanceVastuViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var newScrool_view: UIScrollView!
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    // var subVastu:SubVastuTips
    @IBOutlet weak var submitQuery_btn: UIButton!
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    @IBOutlet weak var subAdvanceWebView: UIWebView!
    
    @IBOutlet weak var scroll_view: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll_view.scrollEnabled = true
        
        submitQuery_btn.hidden = true
        
        submitQuery_btn.layer.cornerRadius = 5.0
        
        info_btn.hidden = true
        
        var frame = navigation_title.frame
        
        scroll_view.frame = self.view.frame
              
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        } 
        
        submitQuery_btn.frame.origin.x = (self.view.frame.size.width -  submitQuery_btn.frame.size.width)/2
        
         navigation_view.frame.size.width = self.view.frame.size.width
        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
         self.navigationController?.navigationBarHidden = false
        
        subAdvanceWebView.frame.size.width = self.view.frame.size.width
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tagValue  = defaults.valueForKey("tagValue") as! Int
        
        subAdvanceWebView.backgroundColor=UIColor.clearColor()
        
        self.navigationController?.navigationBarHidden = true
        
    switch tagValue{
            
        case 1 :
            
            print(tagValue)
            
            navigation_title.text = "Plot of Land"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
         
      if self.view.frame.size.width==768{
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("plot_of_land_ipad", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            subAdvanceWebView.loadRequest(request)
        
       }else{
        
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("plot_of_land", ofType:"html")!)
        
            let request = NSURLRequest(URL: url)
             subAdvanceWebView.loadRequest(request)
        
            }
            subAdvanceWebView.delegate = self
            
//            [self.view .addSubview(subAdvanceWebView)]
            
            
            break
            
        case 2 :
                
            
               navigation_title.text = "Factory"
                
                self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
          
         if self.view.frame.size.width==768{
            
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("factory_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL:url)
            
                subAdvanceWebView.loadRequest(request)
            
         }else{
            
              let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("factory", ofType:"html")!)
            
              let request = NSURLRequest(URL:url)
            
              subAdvanceWebView.loadRequest(request)
            
               }
                subAdvanceWebView.delegate = self
               // [self.view .addSubview(subAdvanceWebView)]
                
                break
        
    case 3 :
        
       
        
        navigation_title.text = "Office"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
       
    if self.view.frame.size.width==768{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("large_office_ipad", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
    }else{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("large_office", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
        }
        subAdvanceWebView.delegate = self
     //   [self.view .addSubview(subAdvanceWebView)]
        
        break

        
    case 4 :
        
        
        navigation_title.text = "Bungalow"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    if self.view.frame.size.width==768{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bungalow_large_ipad", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
    }else{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bungalow_large", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
        }
        
        subAdvanceWebView.delegate = self
       // [self.view .addSubview(subAdvanceWebView)]
        
        break
        
    case 5 :
        
       
        
        navigation_title.text = "Building"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
    if self.view.frame.size.width==768{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("building_ipad", ofType:"html")!)
        
        let request = NSURLRequest(URL:url)
        subAdvanceWebView.loadRequest(request)
        
    }else{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("building", ofType:"html")!)
        
        let request = NSURLRequest(URL:url)
        subAdvanceWebView.loadRequest(request)
        
        }
        subAdvanceWebView.delegate = self
      //  [self.view .addSubview(subAdvanceWebView)]
        
        break
        
    case 6 :
        
       
        
        navigation_title.text = "Hotel"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
    if self.view.frame.size.width==768{

        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("hotel_ipad", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
    }else{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("hotel", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
        }
        subAdvanceWebView.delegate = self
        
      //  [self.view .addSubview(subAdvanceWebView)]
        
        break
        
    case 7 :
        
        
        navigation_title.text = "Educational Institute"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
      
   if self.view.frame.size.width==768{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("institute_large_ipad", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
    
        subAdvanceWebView.loadRequest(request)
    
   }else{
    
       let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("institute_large", ofType:"html")!)
    
       let request = NSURLRequest(URL: url)
    
       subAdvanceWebView.loadRequest(request)
    
        }
        subAdvanceWebView.delegate = self
      //  [self.view .addSubview(subAdvanceWebView)]
        
        break
        
    case 8 :
        
        
        navigation_title.text = "Hospital"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
    if self.view.frame.size.width==768{
    
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("hospital_ipad", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
    }else{
        
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("hospital", ofType:"html")!)
        
        let request = NSURLRequest(URL: url)
        
        subAdvanceWebView.loadRequest(request)
        
        }
        subAdvanceWebView.delegate = self
      //  [self.view .addSubview(subAdvanceWebView)]
        
        break

        default :
            
            break
        }
        
        

    }
    
override func viewWillAppear(animated: Bool) {
        
        
        
        info_btn.hidden = true
        
        
 }

func webViewDidFinishLoad(webView: UIWebView) {
    
    
    subAdvanceWebView.sizeToFit()
    
    scroll_view.frame.origin.y = 50
    
    subAdvanceWebView.scrollView.scrollEnabled = false
    
//    scroll_view.scrollEnabled = true
    
    print(subAdvanceWebView.frame.size.height)
    
    
    submitQuery_btn.frame.origin.y = subAdvanceWebView.frame.origin.y+subAdvanceWebView.frame.size.height
    
     print( submitQuery_btn.frame.origin.y)
    
    scroll_view.contentSize = CGSizeMake(self.view.frame.size.width,submitQuery_btn.frame.origin.y+submitQuery_btn.frame.size.height+70)
    
    
    submitQuery_btn.hidden = false
    
    
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

    @IBAction func SubmitQuery(sender: AnyObject) {
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("enquiryVC")
        self.showViewController(vc as! UIViewController, sender: vc)
        
    }
}
