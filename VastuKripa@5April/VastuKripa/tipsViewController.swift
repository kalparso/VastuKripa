//
//  tipsViewController.swift
//  VastuKripa
//
//  Created by promatics on 3/17/16.
//  Copyright © 2016 promatics. All rights reserved.

import UIKit

class tipsViewController: UIViewController {
    
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var pendingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var ok_btn: UIButton!

    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var back_view: UIView!
    
    @IBOutlet weak var tips_msg: UILabel!
    
    @IBOutlet weak var vastu_img: UIImageView!
    
    var imageURl:NSString?
    
    var img:String = ""
    
    var id = ""
    
     var indicator:IndicatorView!
    
    let getConn:WebServiceConnection =  WebServiceConnection.connectionManager() as! WebServiceConnection

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title_lbl.frame.origin.x = self.view.frame.size.width/2-title_lbl.frame.size.width/2

        ok_btn.layer.cornerRadius = 5
        
        back_view.frame.origin.x = self.view.frame.size.width/2-back_view.frame.size.width/2
        
       // vastu_img.frame.origin.x = back_view.frame.size.width/2-back_view.frame.size.width/2
        
        tips_msg.frame.size.width = tips_msg.frame.size.width
        
        
        var noti:AnyObject
        
        if NSUserDefaults.standardUserDefaults().objectForKey("notification") != nil{
        
          noti = NSUserDefaults.standardUserDefaults().valueForKey("notification")!
        
            if noti.objectForKey("tip_id") != nil{
                
                id = (noti.valueForKey("tip_id") as? String)!
                
                
            }
            
            
        if noti.objectForKey("acme2") != nil{
        
          let getImgName = noti.valueForKey("acme2") as? String
          
            
            img = img + (getImgName)!
            
            
            vastu_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
            
        }
        
        if noti.objectForKey("message") != nil{
            
          let msg  = noti.valueForKey("message") as! String
            
          tips_msg.text = msg
            
          tips_msg.sizeToFit()
            
          tips_msg.frame.origin.x = self.view.frame.size.width/2-tips_msg.frame.size.width/2

            }
        }
        
        //self.update()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
//    func update(){
//        
//        var passDict = [String:AnyObject]()
//        
//        passDict = ["tip_id":id]
//        
//        getConn.startConnectionWithString("update_tip", httpMethodType:Post_Type, httpBodyType:passDict) { (receivedData) -> Void in
//            
//            print(receivedData)
//            
//            if self.getConn.responseCode() == 1{
//                
//                var arr:NSDictionary?
//                
//                arr = receivedData!
//                
//                let msg = arr?.valueForKey("msg") as! String
//                
//                if msg != "successfully updated"{
//                    
//                    
//                    let Alert: UIAlertView = UIAlertView(title: "Vastu Kripa", message: msg,
//                        delegate: self, cancelButtonTitle: "Ok")
//                    
//                    Alert.show()
//                    
//                }
//                
//            }
//        }
//        
//    }
    

 @IBAction func tap_ok_btn(sender: AnyObject) {
        
    self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    func start(){
        
        indicator = IndicatorView(target:self.view, userEnable:true, message:"LOADING", backgroundColor:nil, fontColor:navigation_view.backgroundColor)
        
        indicator.start();
        
    }
    
    
}
