//
//  subVastu.swift
//  VastuKripa
//
//  Created by Promatics on 12/30/15.
//  Copyright © 2015 promatics. All rights reserved.
//

import UIKit

class SubVastuTipsWebView: UIViewController,UIWebViewDelegate {
    
    
    @IBOutlet weak var SubVastuTipsWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubVastuTipsWebView.frame.size.width = self.view.frame.size.width

        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tagValue  = defaults.valueForKey("tagValue") as! Int
        
        SubVastuTipsWebView.backgroundColor=UIColor.clearColor()
        
     switch tagValue{
            
        case 1 :
            
            print(tagValue)
            
            self.title = "Bedroom"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 2 :
            
            print(tagValue)
            
            self.title = "Living Room"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("living_room", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
            
        case 3 :
            
            print(tagValue)
            
            self.title = "Under Construction"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("under_construction", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 4 :
            
            print(tagValue)
            
            self.title = "Under Construction"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("under_construction", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break

            
        case 5 :
            
            print(tagValue)
            
            self.title = "Kitchen"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break

        case 6 :
            
            print(tagValue)
            
            self.title = "Study Room"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("study_room", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 7 :
            
            print(tagValue)
            
            self.title = "Temple"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 8 :
            
            print(tagValue)
            
            self.title = "Toilet"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break
            
        case 9 :
            
            print(tagValue)
            
            self.title = "Tijori"
            
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            
            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("tijori", ofType:"html")!)
            
            let request = NSURLRequest(URL: url)
            SubVastuTipsWebView.loadRequest(request)
            SubVastuTipsWebView.delegate = self
            [self.view .addSubview(SubVastuTipsWebView)]
            
            break

            
        default :
            
            break
        }
        
        // Do any additional setup after loading the view.
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

}
