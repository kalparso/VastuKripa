//
//  BuyViewController.swift
//  
//
//  Created by promatics on 2/15/16.
//
//

import UIKit

class BuyViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var activity_indicate: UIActivityIndicatorView!
    @IBOutlet weak var navigation_title_lbl: UILabel!
    
    @IBOutlet weak var back_btn: UIButton!
    
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var buy_webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity_indicate.hidden = true
        
        activity_indicate.frame.origin.x = self.view.frame.size.width/2 - activity_indicate.frame.size.width/2
        
        activity_indicate.frame.origin.y = self.view.frame.size.height/2 - activity_indicate.frame.size.height/2

        navigation_view.frame.size.width = self.view.frame.size.width
        
        buy_webView.frame.size.width = self.view.frame.size.width
       
       let device = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String
        
        var postString = device
        
        postString = postString!.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)

        buy_webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://mars.promaticstechnologies.com/Vastukirpa/WebService/paymentNew/"+postString! )! ))
        
           }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        
        activity_indicate.hidden = false
        activity_indicate.startAnimating()
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        activity_indicate.stopAnimating()
       activity_indicate.hidden = true
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        print(request.URL?.absoluteString)
        
        
        if request.URL?.absoluteString == "http://vastu.com/Vastukirpa/webService/paymentconfirm/app_redirect" {
            
          let alert = UIAlertView(title: "Thank you", message: "Your payment have done successfully", delegate: nil, cancelButtonTitle: "Ok")
            
            alert.show()
            
            self.navigationController!.popViewControllerAnimated(true)
            
         return false
            
        }else if request.URL?.absoluteString=="http://vastu.com/Vastukirpa/webService/paymentfailure/app_redirect" {
            
            let alert = UIAlertView(title: "Opps", message: "Your payment failed", delegate: nil, cancelButtonTitle: "Ok")
            
            
            alert.show()
            
            self.navigationController!.popViewControllerAnimated(true)
            
            return false
                
            }else{
                
                 return true
                
            }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back_btn_prsd(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
