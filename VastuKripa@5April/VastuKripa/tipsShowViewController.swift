//
//  tipsShowViewController.swift
//  VastuKripa
//
//  Created by promatics on 3/17/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit

class tipsShowViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var back_view: UIView!
    
    @IBOutlet weak var tips_msg: UILabel!
    
    @IBOutlet weak var vastu_img: UIImageView!
    
    var message:String = ""
    
    var imageURl:NSURL!
    
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        back_view.frame.origin.x = self.view.frame.size.width/2-back_view.frame.size.width/2
        
        
        //let noti = NSUserDefaults.standardUserDefaults().valueForKey("notification")
        
        //var imageURl:String?
        
        //let  msg = noti!.valueForKey("acme2")?.valueForKey("message") as! NSDictionary
        
        
        //imageURl = msg.valueForKey("image") as? String
        
        //let message = msg.valueForKey("message") as! String
       
        
        
        
        tips_msg.text = message
        

        vastu_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))

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

    
    @IBAction func tao_ok_btn(sender: AnyObject) {
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("ShowPushDataVC")
        self.showViewController(vc as! UIViewController, sender: vc)
    }
}
