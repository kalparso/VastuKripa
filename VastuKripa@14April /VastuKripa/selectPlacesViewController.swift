//
//  selectPlacesViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/21/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit

class selectPlacesViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var table_View: UITableView!
    @IBOutlet weak var navigation_title: UILabel!
    
    @IBOutlet weak var back_btn: UIButton!
    
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var place_tbl: UITableView!
    
    @IBOutlet weak var useInfo_view: UIView!
    
    @IBOutlet weak var info_View: UIView!
    
    @IBOutlet weak var info_back_view: UIView!
    
    @IBOutlet weak var info_scroll_View: UIScrollView!
    
    @IBOutlet weak var infoApp_img: UIImageView!
    
    @IBOutlet weak var lbl_infoHeader: UILabel!
    
    @IBOutlet weak var info_red_img: UIImageView!
    
    @IBOutlet weak var lbl_info: UILabel!
    
    @IBOutlet weak var info_lineView: UIView!
    
    @IBOutlet weak var info_ok_btn: UIButton!
    
    @IBOutlet weak var usageInfo_btn: UIButton!
    @IBOutlet weak var demoVedio_btn: UIButton!
    
    var infoView_height = CGFloat(500)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        navigation_view.frame.size.width = self.view.frame.size.width
        
        navigation_title.frame.origin.x = self.view.frame.size.width/2-navigation_title.frame.size.width/2
        
        useInfo_view.frame.origin.x = self.view.frame.size.width/2-useInfo_view.frame.size.width/2
        
        useInfo_view.hidden = false
        
        usageInfo_btn.layer.cornerRadius = 5.0
        
        demoVedio_btn.layer.cornerRadius = 5.0
        
        
        info_View.hidden = true
        
        info_ok_btn.layer.cornerRadius = 5.0
        
        infoView_height = info_View.frame.size.height
        
        info_View.frame.origin.x = self.view.frame.size.width/2-info_View.frame.size.width/2
        
        self.navigationController?.navigationBarHidden = false
        
        self.title = "Select Place"
        
         NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        info_View.hidden = true
        
        // contact_btn.hidden = true
        
        navigation_title.text = "Vastu Calculator Compass"
        
        self.navigationController?.navigationBarHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        
        return 7;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        
        var cell : placeTableViewCell! = tableView.dequeueReusableCellWithIdentifier("placeCell") as! placeTableViewCell
        
        if(cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("placeCell", owner: self, options: nil)[0] as! placeTableViewCell;
        }
        cell.selectionStyle=UITableViewCellSelectionStyle.None

        
        if indexPath.row == 0 {
            
            cell.place_lbl.text = "Director's Cabin"
            
        } else if indexPath.row == 1 {
            
            cell.place_lbl.text = "Temple/Poojasthan"
            
            
        } else if indexPath.row == 2 {
            
            cell.place_lbl.text = "Kitchen"
            
            
        } else if indexPath.row == 3 {
            
            cell.place_lbl.text = "Master's Bedroom"
            
            
        } else if indexPath.row == 4 {
            
            cell.place_lbl.text = "Safe/Vault"
            
            
        } else if indexPath.row == 5 {
            
            cell.place_lbl.text = "Toilet"
            
            
        } else if indexPath.row == 6 {
            
            cell.place_lbl.text = "Entrance Door"
            
            
        }
        
        place_tbl.scrollEnabled = false
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.row == 0 {
            
            NSUserDefaults.standardUserDefaults().setValue("Director's Cabin", forKey: "place")
            
        } else if indexPath.row == 1 {
            
            NSUserDefaults.standardUserDefaults().setValue("Temple/Poojasthan", forKey: "place")
            
            
        } else if indexPath.row == 2 {
            
            NSUserDefaults.standardUserDefaults().setValue("Kitchen", forKey: "place")
            
        } else if indexPath.row == 3 {
            
            NSUserDefaults.standardUserDefaults().setValue("Master's Bedroom", forKey: "place")
            
            
        } else if indexPath.row == 4 {
            
            NSUserDefaults.standardUserDefaults().setValue("Safe/Vault", forKey: "place")
        
            
        } else if indexPath.row == 5 {
         
            
            NSUserDefaults.standardUserDefaults().setValue("Toilet", forKey: "place")
            
        } else if indexPath.row == 6 {
            
            NSUserDefaults.standardUserDefaults().setValue("Entrance Door", forKey: "place")
            
        }
        
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("vastucompassVC")
        self.showViewController(vc as! UIViewController, sender: vc)

        
    }
    
    @IBAction func info_btn_tuch(sender: AnyObject) {
        
        info_View.frame = CGRectMake(self.view.frame.origin.x+40, self.view.frame.origin.y+70+67,self.view.frame.size.width-80 , self.view.frame.size.height-140-67)
        
        var frame = info_View.frame
        
        frame.origin.x = (self.view.frame.size.width-info_View.frame.size.width)/2
        
        info_View.frame=frame
        
        frame = lbl_infoHeader.frame
        
        frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+20
        
        lbl_infoHeader.frame=frame
        
        lbl_info.text = "";
        lbl_info.sizeToFit()
        
        infoApp_img.frame.origin.x = self.lbl_infoHeader.frame.origin.x-40
        
        info_lineView.frame.size.width = self.info_View.frame.width
        
        frame = info_lineView.frame
        
        frame.origin.x = 0;
        
        info_lineView.frame = frame
        
        frame = info_red_img.frame
        
        frame.origin.x = (self.info_View.frame.size.width-info_red_img.frame.size.width)/2
        
        info_red_img.frame=frame
        
        info_red_img.frame.origin.y = self.lbl_info.frame.origin.y+self.lbl_info.frame.size.height+15
        
        info_ok_btn.frame.origin.y = info_red_img.frame.origin.y+info_red_img.frame.size.height+20
        
        info_back_view.frame.size.height = info_View.frame.size.height-info_back_view.frame.origin.y
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width,height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
        
        
        info_View.hidden = false
        
    }
    
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func contact_btn_tuch(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }
    
    @IBAction func info_hide_btn(sender: AnyObject) {
        
        info_View.hidden = true
      
    }
    
    
    @IBAction func tapDemo_vedio_btn(sender: AnyObject) {
        
       UIApplication.sharedApplication().openURL(NSURL(string: "http://youtube.com")!)
    }
@IBAction func tapUsage_info_btn(sender: AnyObject) {
        
        
        if self.view.frame.size.height<568
        {
            
            info_View.frame.size.height = 400
            
        } else if self.view.frame.size.width==375{
            
        }
        
        lbl_infoHeader.text = "How to use Vastu Calculator"
        
        var frame = info_View.frame
        
        frame.origin.y = 65
        
        info_View.frame=frame
        
        lbl_info.text = "• Stand in the center of the  property (Brahmasthaan) and orient yourself with a fixed direction with the help of the compass. And please put the phone parallel to the earth axis.\n\n• Room/Space name is displayed at the top of each page (e.g. Director Cabin). Also you can see the score regarding the direction of the place.\n\n• When you are using the Vastu Calculator, please ensure that you are not close to any Magnetic Field like Iron Beams / Columns / Metallic Furniture / Electric Fans / Magnets / Metals because it could interfere with the Magnetic North Readings. Please check that while using this Vastu Calculator on our App..the Magnetic Field should be less than 50uT.\n\n• On top of the screen, You will see the Score and also the Level of Vastu compliance. The Score will ascertain the level of Vastu Doshas or Vastu Perfection of your property.\n\n• You can check the Vastu Tips for the particular place by clicking \"Tips for this direction\" button for particular direction using compass.\n\n• You can select different Vastu places by clicking \"Evaluate other vastu places\" button.\n\n• To Initialize the Sensors, point your phone up towards the sky and move it in a figure 8 motion.";
        
        lbl_info.sizeToFit()
    
        if  self.view.frame.size.width<1024{
        
            infoApp_img.frame.origin.x = 5
       
        }
    
        info_lineView.frame.size.width = self.info_View.frame.width-2
    
       info_lineView.frame.origin.x = 0;
    
        info_red_img.frame.origin.x = (self.info_View.frame.size.width-info_red_img.frame.size.width)/2
  
        info_red_img.frame.origin.y = self.lbl_info.frame.origin.y+self.lbl_info.frame.size.height+15

        info_ok_btn.frame.origin.x = (self.info_View.frame.size.width-info_ok_btn.frame.size.width)/2
    
        info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
    
      if self.view.frame.size.width == 768{
 
       info_back_view.frame.size.height = info_View.frame.size.height-info_back_view.frame.origin.y
       }
    
       info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
    
        navigation_view.userInteractionEnabled = false
     
        table_View.userInteractionEnabled = false
        
        info_View.hidden = false
        
      info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
    
     info_back_view.frame.size.height = info_View.frame.size.height-info_back_view.frame.origin.y
    
    info_ok_btn.backgroundColor = navigation_view.backgroundColor
        
    }
    
    @IBAction func tapInfo_hide_btn(sender: AnyObject) {
        
        info_View.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
        table_View.userInteractionEnabled = true
        
    }
}
