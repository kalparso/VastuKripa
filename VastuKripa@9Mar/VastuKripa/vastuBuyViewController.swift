//
//  vastuBuyViewController.swift
//  
//
//  Created by promatics on 2/6/16.
//
//

import UIKit

class vastuBuyViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var vastu_Webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activity.hidden = true
        
        activity.frame = self.view.frame
        
        activity.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
        
         navigation_title.text = "Vastu Products"
        
         contact_btn.hidden = true
        
        vastu_Webview.frame.size.width = self.view.frame.size.width
        
        
        let requestURL = NSURL(string:"http://vastukripa.com/products-page/")
        
        let request = NSURLRequest(URL: requestURL!)
        
        print(request)
        
        vastu_Webview.loadRequest(request)


        // Do any additional setup after loading the view.
    }
    
func webViewDidStartLoad(webView: UIWebView) {
        
    activity.hidden = false
    activity.startAnimating()
        
    }
    
func webViewDidFinishLoad(webView: UIWebView) {
    
    activity.hidden = true
    activity.stopAnimating()

    
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
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
 @IBAction func contact_btn_tuch(sender: AnyObject) {
        
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }

    
}
