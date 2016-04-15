//
//  inviteFriendsViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class inviteFriendsViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!

    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    
    
    @IBOutlet var left_bar_logo: UIBarButtonItem!
    
    var request:NSURLRequest!
    
    var webView :UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        info_btn.hidden = true
        
        var frame = navigation_title.frame
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x +
            navigation_title.frame.size.width+50
            
            
            
        }

        
     navigation_view.frame.size.width = self.view.frame.size.width
        
        webView = UIWebView()
        
        webView.loadRequest(request)
        
        webView.frame = self.view.frame
        
        webView.delegate = self
        
        self.view.addSubview(webView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        info_btn.hidden = true
        
        contact_btn.hidden = true
        
        navigation_title.text = "Invite friends"
        
        
        self.navigationController?.navigationBarHidden = true
    }


    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
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
