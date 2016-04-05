//
//  homeViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/17/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//CoreLocation/CoreLocation.h

import UIKit
import CoreLocation
import QuartzCore
import Foundation
import CoreData
import CoreMotion
//import sqlite3

class homeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,NSURLConnectionDelegate, NSXMLParserDelegate,CLLocationManagerDelegate,UIImagePickerControllerDelegate,UIWebViewDelegate,UIGestureRecognizerDelegate {

    
    @IBOutlet weak var info_headerView: UIView!
    @IBOutlet weak var img_compass: UIImageView!
    @IBOutlet weak var usage_Info: UIButton!
    @IBOutlet weak var demo_video: UIButton!
    @IBOutlet weak var company_logo: UIImageView!
    @IBOutlet weak var compass_logo: UIImageView!
    @IBOutlet weak var arrow: UIButton!
    @IBOutlet weak var notification_View: UIView!
    
    @IBOutlet weak var notification_img: UIImageView!
    
    @IBOutlet weak var notification_lbl: UILabel!
    @IBOutlet weak var circle_ebook: UIButton!
    @IBOutlet weak var circle_consult: UIButton!
    @IBOutlet weak var circle_advance: UIButton!
    @IBOutlet weak var circle_online: UIButton!
    @IBOutlet weak var circle_product: UIButton!
    @IBOutlet weak var circle_compass: UIButton!
    @IBOutlet weak var circle_vastutips: UIButton!
    
    @IBOutlet weak var main_scrollView: UIScrollView!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var bellBtn: UIButton!
    
    @IBOutlet weak var pushCountLbl: UILabel!
    
    @IBOutlet weak var mahaVastuTips_View: UIView!
    
    @IBOutlet weak var mahaVastuTips_cancel_btn: UIButton!
    @IBOutlet weak var mahaVastuTips_lbl: UILabel!
    @IBOutlet weak var select_btn_lbl: UILabel!
    @IBOutlet weak var vedio_btn: UIButton!
    @IBOutlet weak var main_back_view: UIView!
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var more_tips_btn: UIButton!
    
    @IBOutlet weak var magnetic_view: UIView!
    
    @IBOutlet weak var notShow_btn: UIButton!
    
    @IBOutlet weak var ok_magn_btn: UIButton!
    
    
    @IBOutlet weak var left_line_view: UIView!
    
    @IBOutlet weak var checkAlso_lbl: UILabel!
    
    @IBOutlet weak var right_line_view: UIView!
    @IBOutlet weak var info_cancel_btn: UIButton!
    
    @IBOutlet weak var kitchen_btn: UIButton!
    @IBOutlet weak var info_Btn: UIButton!
    @IBOutlet weak var temple_btn: UIButton!
    @IBOutlet weak var toilet_btn: UIButton!
    
    @IBOutlet weak var badroom_btn: UIButton!
    
    @IBOutlet weak var door_btn: UIButton!
    
    @IBOutlet weak var dirCabin_btn: UIButton!
    
    @IBOutlet weak var vastuTipes_View: UIView!
    
    @IBOutlet weak var info_back_view: UIView!
    
    @IBOutlet weak var compass_img: UIImageView!
    
    @IBOutlet weak var magneticField_lbl: UILabel!
    
    @IBOutlet weak var degree_lbl: UILabel!
    
    @IBOutlet weak var scope_lbl: UILabel!
    
    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var tbl_view: UITableView!
    
    @IBOutlet weak var btn_view: UIView!
    
    @IBOutlet weak var selectPlace_btn: UIButton!
    
    @IBOutlet weak var onlineVastu_btn: UIButton!
    
    @IBOutlet weak var advanceVastu_btn: UIButton!
    
    @IBOutlet weak var vastu_ebook_btn: UIButton!
    @IBOutlet weak var vastuProduct_btn: UIButton!
    
    @IBOutlet weak var consultNow_btn: UIButton!
    
    @IBOutlet weak var vastuTip_btn: UIButton!
    
    @IBOutlet weak var info_View: UIView!
    
    @IBOutlet weak var info_scroll_View: UIScrollView!
    
    @IBOutlet weak var infoApp_img: UIImageView!
    @IBOutlet weak var lbl_infoHeader: UILabel!
    var index = 0
    
    @IBOutlet weak var info_ok_btn: UIButton!
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var info_red_img: UIImageView!
    
    @IBOutlet weak var lbl_info: UILabel!
    @IBOutlet weak var info_lineView: UIView!
    
    @IBOutlet weak var moreTipesWebView: UIWebView!
    
    @IBOutlet weak var tapgesture_View: UIView!
    
    var blinkStatus = false
    
    var indicator:IndicatorView!
    
    var timer:NSTimer?
    
    let vastuTipsConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    let getConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var  counter = 1
    
    var date :NSDate!
    
    var showdate :String! = "2016-02-4"
    
    var scroll = 0
    
    var tapMenu = false
    
    var databasePath = ""
    
    var directions = ""
    
    var str_Score = 6
    
    var str_tips = ""
    
    var place_title = "Temple/Poojasthan"
    
    var array_Points = [0,0,0,0,0,0,0,0]
    
    var array_Tips = ["","","","","","","",""]
    
    var tap_place_btn = 2
    
    var tap_place_btn_index = 0
    
    var place_btn_hieght = CGFloat(35)
    
    var infoView_height = CGFloat(500)
    
    let locationManager = CLLocationManager()
    
    let motionManager = CMMotionManager()
    
    let imagePicker = UIImagePickerController()
    
    private var lastContentOffset: CGFloat = 0
    
    var databaseName = "VastuKripa.sqlite"
    
    var showMagneticPopUp = 1
    
    var moreTipsPress = 0
    
    var compassStart = 0
    
    var size :CGFloat = 0
    
    var  request :NSURLRequest!
    
    var url : NSURL!
    
    var blinkTimer:NSTimer!
    
    var interface = ""
    
    var count = 0
    
    var documentPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
    
    var mahaVastuTips  = ["Keep your study table or work desk neat and clean","Always try to enter your home with your first leg first","Avoid buying or staying on a property on a 'T' junction","Keep the toilet door closed at all times","Keep kitchen appliances in the south or west zone","Do not keep pictures of departed souls inside the temple","Never leave the cash drawer empty","The temple door must have some space for air and light","Windows in south and west zone must be kept closed","Worker toilets should not be present in North East or East zone","As per vastu Must keep your study table or work desk neat and clean","Living room must be in the North or in the East","The main door must open in the right direction in order to avoid a Vastu Dosha","Keep distance between objects using fire and water within the kitchen","Jal, the element that gives life","The main door/gate must be unobstructed","Water tanks must not be installed in the South-East zone","Mirrors in the living room must be in the North or East Zone only","The family head must face North or East Zone during discussions & decision making","Professionals can gain a lot from vastu Shastra","Avoid sleeping in the South East zone","All rooms should be rectangular in shape","Heavy furniture should be in the South-West zone","Do not keep construction material in the North-East, East, North and central zone","Picture of Lord Ganeshaji must be installed back to back","Kitchen must not be present in the North-East, South-West of central zone","As per Vast keep windows in the North and East zone open in the study room","As per vastu Keep distance between objects using fire and water within the kitchen","As per vastu The Tijori must never open towards the South or West direction","As per vastu The family head must face North or East Zone during discussions & decision making"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       //UIApplication.sharedApplication().applicationIconBadgeNumber = 6
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "checkNotiction")
        
        pushCountLbl.hidden = true
        
        notification_View.hidden = true

        self.checkLaunch()
    
       circle_ebook.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
       circle_ebook.titleLabel!.textAlignment = NSTextAlignment.Center
        
       title_lbl.frame.origin.x = (navigation_view.frame.size.width - title_lbl.frame.size.width)/2
        
       notification_View.frame.origin.x = (self.view.frame.size.width-notification_View.frame.size.width)/2
        
        
        NSUserDefaults.standardUserDefaults().setObject(0, forKey: "count")
    
        
        pushCountLbl.hidden = true
        
        
        menuBtn.addTarget(self.revealViewController(), action:"revealToggle:", forControlEvents:UIControlEvents.TouchUpInside
        )
        
        self.revealViewController().panGestureRecognizer()
        
       self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
       self.revealViewController().tapGestureRecognizer()
    
        
       self.main_scrollView.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
        info_View.frame.origin.x = self.view.frame.size.width/2-info_View.frame.size.width/2
        
        bellBtn.addTarget(self, action: "ClickOnBell", forControlEvents: UIControlEvents.TouchUpInside)
        
        let key = NSUserDefaults.standardUserDefaults().boolForKey("showdate")
        
        if key == true{
            
            showdate = NSUserDefaults.standardUserDefaults().valueForKey("date") as! String
            
            counter = NSUserDefaults.standardUserDefaults().valueForKey("counter") as! Int
            
        }
    
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            size = -410
            
            interface = "ipad"
            
            
        } else {
            
            size = -245
            
            interface = "iphone"
        }
        
        info_View.hidden = true
        
        info_ok_btn.backgroundColor = navigation_view.backgroundColor
        
        infoView_height = info_View.frame.size.height
        
        vastuTipes_View.frame.size.width = self.view.frame.size.width
        
        more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+20
        
        vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10

        
        main_back_view.frame.size.height = self.view.frame.size.height
        
        
        self.navigationController?.navigationBarHidden = true
        
        let documentsDir: AnyObject = documentPaths[0]
        
        databasePath = (documentsDir as! String)+databaseName
        
        var success = false
        
        let fileManager = NSFileManager.defaultManager()
        
        success = (fileManager.fileExistsAtPath(databasePath))
        
        print(success)
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        info_lineView.frame.size.width = info_scroll_View.frame.size.width-1
        
        info_lineView.frame.origin.x = info_scroll_View.frame.origin.x+1
        
        
        if self.view.frame.width == 375{
    
            main_scrollView.frame.origin.y = 50
            
            main_scrollView.frame.size.height = self.view.frame.size.height-50
            
            bellBtn.frame.origin.x =  self.view.frame.size.width-bellBtn.frame.size.width-18
            
            pushCountLbl.frame.origin.x = bellBtn.frame.origin.x+15
            
            
            more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+20
            
            vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
            
        }
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        main_back_view.frame.size.height = self.view.frame.size.height
    
        
        scope_lbl.frame.origin.x = self.view.frame.size.width/2-scope_lbl.frame.size.width/2
        
        degree_lbl.frame.origin.x = self.view.frame.size.width/2-degree_lbl.frame.size.width/2
        
        main_back_view.frame.size.width = self.view.frame.size.width
        
        main_back_view.frame.origin.y = 0
        
        magnetic_view.frame.origin.x = self.view.frame.size.width/2-magnetic_view.frame.size.width/2
        
        magnetic_view.frame.origin.x = self.view.frame.size.height/2-magnetic_view.frame.size.height/2
        
        NSUserDefaults.standardUserDefaults().setValue("Temple/Poojasthan", forKey: "place")
        
        self.title = "Director's Cabin"
        
        scope_lbl.text = "Temple/Poojasthan\nScore: 10/10\n(Good Vastu Compliance)"
        
        index = 0
        
        tapMenu = false
        
        magnetic_view.hidden = true
        
        info_ok_btn.layer.cornerRadius = 5.0
        
        
        
        if self.view.frame.size.width == 375 && self.view.frame.size.height>568{
            
            degree_lbl.frame.origin.y = scope_lbl.frame.origin.y+scope_lbl.frame.size.height+15
            
            compass_img.frame.origin.y = degree_lbl.frame.origin.y+degree_lbl.frame.size.height+20
            
            compass_img.frame.size.height = 310
            
            compass_img.frame.size.width = 310
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2

            place_btn_hieght = CGFloat(35)
            
            more_tips_btn.frame.size.height = 38
            
            more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+13
            
            vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
            
        }else if self.view.frame.size.height < 568{
            
          place_btn_hieght = CGFloat(30)
            
        }
        
        if  (self.view.frame.size.width != 768){
    
            
            kitchen_btn.frame =  CGRectMake(0,0,self.view.frame.size.width/3-1,place_btn_hieght)
            
            kitchen_btn.layer.cornerRadius  = 5.0
            
            kitchen_btn.layer.borderWidth  =  2.0
            
            kitchen_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            kitchen_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            temple_btn.frame =  CGRectMake(kitchen_btn.frame.width+1,0,kitchen_btn.frame.size.width,place_btn_hieght)
            
            temple_btn.layer.cornerRadius  = 5.0
            
            temple_btn.layer.borderWidth  =  2.0
            
            temple_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            temple_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            toilet_btn.frame =  CGRectMake(temple_btn.frame.origin.x+temple_btn.frame.size.width+1,0,kitchen_btn.frame.size.width,place_btn_hieght)
            
            toilet_btn.layer.cornerRadius  = 5.0
            
            toilet_btn.layer.borderWidth  =  2.0
            
            toilet_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            toilet_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            badroom_btn.frame =  CGRectMake(kitchen_btn.frame.origin.x,kitchen_btn.frame.size.height+kitchen_btn.frame.origin.y+1,kitchen_btn.frame.size.width,kitchen_btn.frame.size.height)
            
            badroom_btn.layer.cornerRadius  = 5.0
            
            badroom_btn.layer.borderWidth  =  2.0
            
            badroom_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            badroom_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            door_btn.frame =  CGRectMake(temple_btn.frame.origin.x,temple_btn.frame.size.height+temple_btn.frame.origin.y+1,temple_btn.frame.size.width,temple_btn.frame.size.height)
            
            door_btn.layer.cornerRadius  = 5.0
            
            door_btn.layer.borderWidth  =  2.0
            
            door_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            door_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            dirCabin_btn.frame =  CGRectMake(toilet_btn.frame.origin.x,toilet_btn.frame.size.height+toilet_btn.frame.origin.y+1,toilet_btn.frame.size.width,temple_btn.frame.size.height)
            
            dirCabin_btn.layer.cornerRadius  = 5.0
            
            dirCabin_btn.layer.borderWidth  =  2.0
            
            dirCabin_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            dirCabin_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            vastuTipes_View.frame.size.height = dirCabin_btn.frame.origin.y+dirCabin_btn.frame.size.height
            
            more_tips_btn.frame.origin.x = (self.view.frame.size.width-more_tips_btn.frame.size.width)/2
            

            more_tips_btn.layer.cornerRadius  = 5.0
            
            more_tips_btn.layer.borderWidth  =  2.0
            
            more_tips_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            
            info_View.frame.origin.x = (self.view.frame.size.width-info_View.frame.size.width)/2

            
            magnetic_view.frame.origin.x = (self.view.frame.size.width-magnetic_view.frame.size.width)/2
            
            more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+15
            
            vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
            
            
        }else{
            
            kitchen_btn.layer.cornerRadius  = 5.0
            
            kitchen_btn.layer.borderWidth  =  2.0
            
            kitchen_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            kitchen_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            temple_btn.layer.cornerRadius  = 5.0
            
            temple_btn.layer.borderWidth  =  2.0
            
            temple_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            temple_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            
            toilet_btn.layer.cornerRadius  = 5.0
            
            toilet_btn.layer.borderWidth  =  2.0
            
            toilet_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            toilet_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            
            badroom_btn.layer.cornerRadius  = 5.0
            
            badroom_btn.layer.borderWidth  =  2.0
            
            badroom_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            badroom_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            door_btn.layer.cornerRadius  = 5.0
            
            door_btn.layer.borderWidth  =  2.0
            
            door_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            door_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            dirCabin_btn.layer.cornerRadius  = 5.0
            
            dirCabin_btn.layer.borderWidth  =  2.0
            
            dirCabin_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            dirCabin_btn.setTitleColor((UIColor.whiteColor()), forState: UIControlState.Normal)
            
            more_tips_btn.frame.origin.x = (self.view.frame.size.width-more_tips_btn.frame.size.width)/2
            
            more_tips_btn.layer.cornerRadius  = 5.0
            
            more_tips_btn.layer.borderWidth  =  2.0
            
            more_tips_btn.layer.borderColor = UIColor.whiteColor().CGColor
            
            
        }
        
        more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+20
        
        vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
        
        
        if self.view.frame.size.height<568{
        
            
            main_scrollView.frame.origin.y = 50
            
            main_scrollView.frame.size.height = self.view.frame.size.height-50
            
            degree_lbl.frame.origin.y = scope_lbl.frame.origin.y+scope_lbl.frame.size.height+10
            
            compass_img.frame.origin.y = degree_lbl.frame.origin.y+degree_lbl.frame.size.height+5
            
            more_tips_btn.frame.size.height = 30
            
            //more_tips_btn.frame.origin.y = more_tips_btn.frame.origin.y+10
            
            compass_img.frame.size.height = 178
            
            compass_img.frame.size.width = 180
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
            
            degree_lbl.frame.origin.y = scope_lbl.frame.origin.y+scope_lbl.frame.size.height+5
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2

            more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+5
            
            vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
            
            demo_video.frame.origin.x = 20
            
            usage_Info.frame.origin.x = self.view.frame.size.width-demo_video.frame.size.width-20
            
            demo_video.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-10
            
            usage_Info.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-10
        
        }else{
            
            
            demo_video.frame.origin.x = more_tips_btn.frame.origin.x
            
            usage_Info.frame.origin.x = more_tips_btn.frame.origin.x+more_tips_btn.frame.size.width-usage_Info.frame.size.width
            
            if self.view.frame.size.height==1024{
            
            demo_video.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-20
            
            usage_Info.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-20
                
            }else{
                
             demo_video.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-12
                
             usage_Info.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-12
                
            }
        }
        
        
        if self.view.frame.size.height == 568{
            
            compass_img.frame.origin.y = degree_lbl.frame.origin.y+degree_lbl.frame.size.height+10
            
            compass_img.frame.size.height = 210
            compass_img.frame.size.width =  210
            
            more_tips_btn.frame.size.height = 36
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
            
            more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+15
            
            vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
            
            demo_video.frame.origin.x = 30
            
            usage_Info.frame.origin.x = self.view.frame.size.width-demo_video.frame.size.width-30
            
            demo_video.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-10
            
            usage_Info.frame.origin.y = more_tips_btn.frame.origin.y-demo_video.frame.size.height-10
            
        }

        demo_video.layer.cornerRadius = 5
        
        usage_Info.layer.cornerRadius = 5
        
        
        
        if self.view.frame.size.height == 1024{
            
            vastuTip_btn.frame.size.height = 400
            
            selectPlace_btn.frame.size.height = 400
            
            vastuProduct_btn.frame.size.height = 400
            
            onlineVastu_btn.frame.size.height = 400
            
            advanceVastu_btn.frame.size.height = 400
            
            consultNow_btn.frame.size.height = 400
            
            vastu_ebook_btn.frame.size.height = 400
            
           img_compass.frame.size.height = 280
            
            img_compass.frame.size.width = 280
            
            company_logo.frame.size.height = 280
            
            company_logo.frame.size.width = 280
            
        
        }else{
            
            company_logo.frame.size.height = 148
            
            company_logo.frame.size.width = 148
            
            vastuTip_btn.frame.size.height = 175
            
            selectPlace_btn.frame.size.height = 175
            
            vastuProduct_btn.frame.size.height = 175
            
            onlineVastu_btn.frame.size.height = 175
            
            advanceVastu_btn.frame.size.height = 175
            
            consultNow_btn.frame.size.height = 175
            
            vastu_ebook_btn.frame.size.height = 175
            
            img_compass.frame.size.height = 149
            
            img_compass.frame.size.width = 149
            
            img_compass.layer.cornerRadius = img_compass.frame.size.width/2
            
        }
        

        
        getVastuScore()
        
        if self.view.frame.size.height == 568{
            
           vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+25
            
            more_tips_btn.frame.origin.y = more_tips_btn.frame.origin.y+10
            
            demo_video.frame.origin.y = demo_video.frame.origin.y+5
            
            usage_Info.frame.origin.y = demo_video.frame.origin.y
        }
        
        if self.view.frame.size.height<568{
            
            
            info_View.frame.origin.y = self.view.frame.size.height/2-info_View.frame.size.height/2
            
        }else{
            
              info_View.frame.origin.y = 68
            
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "setVastuCount", userInfo: nil, repeats: true)
    
        
// // // vastuTip_btn
        
        vastuTip_btn.frame.size.width = self.view.frame.size.width-10
    
        vastuTip_btn.frame.origin.x = (self.view.frame.size.width-vastuTip_btn.frame.size.width)/2
        
        if self.view.frame.size.height<1024{
        
        vastuTip_btn.frame.origin.y = vastuTipes_View.frame.origin.y+vastuTipes_View.frame.size.height+2
            
        }else{
            
            vastuTip_btn.frame.origin.y = vastuTipes_View.frame.origin.y+vastuTipes_View.frame.size.height+2
        }
        
        vastuTip_btn.layer.borderWidth = 1.0
        
        vastuTip_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
// // // vastu_ebook_btn
        
        
        vastu_ebook_btn.frame.size.width = self.view.frame.size.width-10
        
        vastu_ebook_btn.frame.origin.x = (self.view.frame.size.width-vastuTip_btn.frame.size.width)/2
        
        vastu_ebook_btn.frame.origin.y =  vastuTip_btn.frame.origin.y+vastuTip_btn.frame.size.height+3
        
         vastu_ebook_btn.layer.borderWidth = 1.0
        
         vastu_ebook_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
// // // vastuProduct_btn
        
        vastuProduct_btn.frame.size.width = self.view.frame.size.width-10
        
        vastuProduct_btn.frame.origin.x = (self.view.frame.size.width-vastuProduct_btn.frame.size.width)/2
        
        vastuProduct_btn.frame.origin.y = vastu_ebook_btn.frame.origin.y+selectPlace_btn.frame.size.height+3
        
        vastuProduct_btn.layer.borderWidth = 1.0
        
        vastuProduct_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
// // // vastuProduct_btn
        
        onlineVastu_btn.frame.size.width = self.view.frame.size.width-10
        
       onlineVastu_btn.frame.origin.x = (self.view.frame.size.width-onlineVastu_btn.frame.size.width)/2
        
        onlineVastu_btn.frame.origin.y = vastuProduct_btn.frame.origin.y+vastuProduct_btn.frame.size.height+3
        
        onlineVastu_btn.layer.borderWidth = 1.0
        
        onlineVastu_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
// // // vastuProduct_btn
        
        advanceVastu_btn.frame.size.width = self.view.frame.size.width-10
        
        advanceVastu_btn.frame.origin.x = (self.view.frame.size.width-advanceVastu_btn.frame.size.width)/2
        
        advanceVastu_btn.frame.origin.y = onlineVastu_btn.frame.origin.y+onlineVastu_btn.frame.size.height+3
        
        advanceVastu_btn.layer.borderWidth = 1.0
        
        advanceVastu_btn.layer.borderColor = UIColor.lightGrayColor().CGColor


// // // consultNow_btn
        
        consultNow_btn.frame.size.width = self.view.frame.size.width-10
        
        consultNow_btn.frame.origin.x = (self.view.frame.size.width-consultNow_btn.frame.size.width)/2
        
        consultNow_btn.frame.origin.y = advanceVastu_btn.frame.origin.y+advanceVastu_btn.frame.size.height+3
        
        consultNow_btn.layer.borderWidth = 1.0
        
        consultNow_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
// // // vastuCompass_btn
        
        selectPlace_btn.frame.size.width = self.view.frame.size.width-10
        
        selectPlace_btn.frame.origin.x = (self.view.frame.size.width-selectPlace_btn.frame.size.width)/2
        
        selectPlace_btn.frame.origin.y = consultNow_btn.frame.origin.y+consultNow_btn.frame.size.height+3
        
        selectPlace_btn.layer.borderWidth = 1.0
        
        selectPlace_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
//// // componany logo
        
       company_logo.frame.origin.y = selectPlace_btn.frame.origin.y+selectPlace_btn.frame.size.height+10
        
        company_logo.frame.origin.x = self.view.frame.size.width/2-company_logo.frame.size.width/2
        
        
//// // address lbl
        
        let frame = CGRectMake(0, 0, 20, 20)
        
        let add_lbl = UILabel(frame: frame)

        add_lbl.text = "www.vastukripa.com"
        
        add_lbl.textColor = UIColor.blueColor()
        
        if self.view.frame.size.height == 1024{
            
          add_lbl.font = UIFont(name:"Droid Sans", size: 19)
            
        }else{
            
             add_lbl.font = UIFont(name:"Droid Sans", size: 17)
        }
        
        add_lbl.sizeToFit()
        
        add_lbl.frame.origin.x = self.view.frame.size.width/2-add_lbl.frame.size.width/2
        
        add_lbl.frame.origin.y = company_logo.frame.origin.y+company_logo.frame.size.height+10

        
        main_scrollView.addSubview(add_lbl)
        
        main_scrollView.contentSize = CGSize(width:self.view.frame.size.width, height: add_lbl.frame.origin.y+add_lbl.frame.size.height+10)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("tapVstuKripa"))
        add_lbl.userInteractionEnabled = true
        add_lbl.addGestureRecognizer(tapGestureRecognizer)
        
    
    if self.view.frame.size.height == 1024{
    
////circle_vastutips
        
        circle_vastutips.frame.size.height = 300
        
        circle_vastutips.frame.size.width = 300
        
        circle_vastutips.frame.origin.x = (vastuTip_btn.frame.size.width/2-circle_vastutips.frame.size.width/2) + vastuTip_btn.frame.origin.x
        
        circle_vastutips.frame.origin.y = (vastuTip_btn.frame.size.height/2-circle_vastutips.frame.size.height/2) + vastuTip_btn.frame.origin.y
    
////circle_Vastu_ebook
        
        circle_ebook.frame.size.height = 300
        
        circle_ebook.frame.size.width = 300
        
        circle_ebook.frame.origin.x = (vastu_ebook_btn.frame.size.width/2-circle_ebook.frame.size.width/2) + vastu_ebook_btn.frame.origin.x
        
        circle_ebook.frame.origin.y = (vastu_ebook_btn.frame.size.height/2-circle_ebook.frame.size.height/2) + vastu_ebook_btn.frame.origin.y
        
////circle_product
        
        circle_product.frame.size.height = 300
        
        circle_product.frame.size.width = 300
        
        circle_product.frame.origin.x = (vastuProduct_btn.frame.size.width/2-circle_product.frame.size.width/2) + vastuProduct_btn.frame.origin.x
        
        circle_product.frame.origin.y = (vastuProduct_btn.frame.size.height/2-circle_product.frame.size.height/2) + vastuProduct_btn.frame.origin.y
        
        
////circle_online
        
        circle_online.frame.size.height = 300
        
        circle_online.frame.size.width = 300
        
        circle_online.frame.origin.x = (onlineVastu_btn.frame.size.width/2-circle_online.frame.size.width/2) + onlineVastu_btn.frame.origin.x
        
        circle_online.frame.origin.y = (onlineVastu_btn.frame.size.height/2-circle_online.frame.size.height/2) + onlineVastu_btn.frame.origin.y
        
////circle_advance
        
        circle_advance.frame.size.height = 300
        
        circle_advance.frame.size.width = 300
        
        circle_advance.frame.origin.x = (advanceVastu_btn.frame.size.width/2-circle_advance.frame.size.width/2) + advanceVastu_btn.frame.origin.x
        
        circle_advance.frame.origin.y = (advanceVastu_btn.frame.size.height/2-circle_advance.frame.size.height/2) + advanceVastu_btn.frame.origin.y
        
////circle_consult
        
        circle_consult.frame.size.height = 300
        
        circle_consult.frame.size.width = 300
        
        circle_consult.frame.origin.x = (consultNow_btn.frame.size.width/2-circle_consult.frame.size.width/2) + consultNow_btn.frame.origin.x
        
        circle_consult.frame.origin.y = (advanceVastu_btn.frame.size.height/2-circle_consult.frame.size.height/2) + consultNow_btn.frame.origin.y
        
////circle_compass
        
        circle_compass.frame.size.height = 300
        
        circle_compass.frame.size.width = 300
        
        circle_compass.frame.origin.x = (selectPlace_btn.frame.size.width/2-circle_compass.frame.size.width/2) + selectPlace_btn.frame.origin.x
        
        circle_compass.frame.origin.y = (selectPlace_btn.frame.size.height/2-circle_compass.frame.size.height/2) + selectPlace_btn.frame.origin.y
        
/////img_compass_btn
        
        
        img_compass.frame.origin.x = (selectPlace_btn.frame.size.width/2-img_compass.frame.size.width/2) + selectPlace_btn.frame.origin.x + 1.2
        
        img_compass.frame.origin.y = (selectPlace_btn.frame.size.height/2-img_compass.frame.size.height/2) + selectPlace_btn.frame.origin.y + 1.2
        
        
    
    }else{

////circle_vastutips
        
        circle_vastutips.frame.size.height = 150
        
        circle_vastutips.frame.size.width = 150
        
        circle_vastutips.frame.origin.x = (vastuTip_btn.frame.size.width/2-circle_vastutips.frame.size.width/2) + vastuTip_btn.frame.origin.x
        
        circle_vastutips.frame.origin.y = (vastuTip_btn.frame.size.height/2-circle_vastutips.frame.size.height/2) + vastuTip_btn.frame.origin.y
        
        ////circle_Vastu_ebook
        
        circle_ebook.frame.size.height = 150
        
        circle_ebook.frame.size.width = 150
        
        circle_ebook.frame.origin.x = (vastu_ebook_btn.frame.size.width/2-circle_ebook.frame.size.width/2) + vastu_ebook_btn.frame.origin.x
        
        circle_ebook.frame.origin.y = (vastu_ebook_btn.frame.size.height/2-circle_ebook.frame.size.height/2) + vastu_ebook_btn.frame.origin.y
        
        
////circle_product
        
        circle_product.frame.size.height = 150
        
        circle_product.frame.size.width = 150
        
        circle_product.frame.origin.x = (vastuProduct_btn.frame.size.width/2-circle_product.frame.size.width/2) + vastuProduct_btn.frame.origin.x
        
        circle_product.frame.origin.y = (vastuProduct_btn.frame.size.height/2-circle_product.frame.size.height/2) + vastuProduct_btn.frame.origin.y
        
        
////circle_online
        
        circle_online.frame.size.height = 150
        
        circle_online.frame.size.width = 150
        
        circle_online.frame.origin.x = (onlineVastu_btn.frame.size.width/2-circle_online.frame.size.width/2) + onlineVastu_btn.frame.origin.x
        
        circle_online.frame.origin.y = (onlineVastu_btn.frame.size.height/2-circle_online.frame.size.height/2) + onlineVastu_btn.frame.origin.y
        
////circle_advance
        
        circle_advance.frame.size.height = 150
        
        circle_advance.frame.size.width = 150
        
        circle_advance.frame.origin.x = (advanceVastu_btn.frame.size.width/2-circle_advance.frame.size.width/2) + advanceVastu_btn.frame.origin.x
        
        circle_advance.frame.origin.y = (advanceVastu_btn.frame.size.height/2-circle_advance.frame.size.height/2) + advanceVastu_btn.frame.origin.y
        
////circle_consult
        
        circle_consult.frame.size.height = 150
        
        circle_consult.frame.size.width = 150
        
        circle_consult.frame.origin.x = (consultNow_btn.frame.size.width/2-circle_consult.frame.size.width/2) + consultNow_btn.frame.origin.x
        
        circle_consult.frame.origin.y = (consultNow_btn.frame.size.height/2-circle_consult.frame.size.height/2) + consultNow_btn.frame.origin.y
        
////circle_compass
        
        circle_compass.frame.size.height = 150
        
        circle_compass.frame.size.width = 150
        
        circle_compass.frame.origin.x = (selectPlace_btn.frame.size.width/2-circle_compass.frame.size.width/2) + selectPlace_btn.frame.origin.x
        
        circle_compass.frame.origin.y = (selectPlace_btn.frame.size.height/2-circle_compass.frame.size.height/2) + selectPlace_btn.frame.origin.y
        
        
/////img_compass
    
        img_compass.frame.origin.x = (selectPlace_btn.frame.size.width/2-img_compass.frame.size.width/2) + selectPlace_btn.frame.origin.x
        
        img_compass.frame.origin.y = (selectPlace_btn.frame.size.height/2-img_compass.frame.size.height/2) + selectPlace_btn.frame.origin.y
        
        }
        
        
        
        

    }
    
    func ClickOnBell() {
        
        
            
            if pushCountLbl.hidden==true {
                
            self.performSegueWithIdentifier("zeroNotification", sender:self)
 
            }else{

            self.performSegueWithIdentifier("showPushNotifSegue", sender:self)
                
            }
        }
        
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        
        
    }
    
   override func  viewWillDisappear(animated: Bool) {

   
    
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
       
        if NSUserDefaults.standardUserDefaults().boolForKey("register") != true{
            
           self.register()

         }
        
     self.revealViewController().panGestureRecognizer()
        
      self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
      pushCountLbl.hidden = true
        
     setVastuCount()
    
        
      menuBtn.hidden = false
    
        
        timer?.valid
        
        if NSUserDefaults.standardUserDefaults().valueForKey("OpenCamera") as? String == "1"
            
        {
            NSUserDefaults.standardUserDefaults().setValue("0", forKey: "OpenCamera")
            
            self.navigationController?.navigationBarHidden = true
            
            self.title = NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            
            
            title_lbl.text = "Vastu Calculator"
            
            index = 0
            
            //getVastuScore()
            
            print(array_Points)
            
            if UIImagePickerController.isCameraDeviceAvailable(   UIImagePickerControllerCameraDevice.Front){
                
                
            }
            
            main_back_view.backgroundColor = (UIColor .clearColor())
            
            vastuTipes_View.backgroundColor = (UIColor .clearColor())
            
    
            degree_lbl.hidden = false
            
            more_tips_btn.hidden = false
            
            locationManager.startUpdatingHeading()
            
            motionManager.startGyroUpdates()
            
        }
        
        print(info_View.frame.size.height)
        
        locationManager.startUpdatingHeading()
        
        motionManager.startGyroUpdates()
        
    }
    
   @objc func getRemoteDict(getNoti:NSNotification) {
        
       print("I Got Noti")
        
        print(getNoti.userInfo)
    
        
      let data = getNoti.userInfo! as NSDictionary
        
        
    let info = data["aps"] as! NSDictionary
    
    var imageURl:String?
    
    let  msg = info.valueForKey("acme2")?.valueForKey("message") as! NSDictionary
    
    
    imageURl = msg.valueForKey("image") as? String
    
    let message = msg.valueForKey("message") as! String
    
    notification_View.hidden = false
    
    notification_lbl.text = message
    
    var img:String = (imageURl)!
    
    let getImgName = imageURl
    
    img = img + (getImgName)!
    
    notification_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
    

    
    }
    
    func setVastuCount() {
    
        
        var passDict = [String:AnyObject]()
        
        if let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            timer?.invalidate()
            
//            let Alert: UIAlertView = UIAlertView(title: "Vastu Kripa", message: Device_id,
//                delegate: self, cancelButtonTitle: "Ok")
//            
//            Alert.show()
//
            
            passDict = ["device_id":Device_id,"status":"0"]
            
            vastuTipsConn.startConnectionWithString("tipCountList", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
                print(receivedData)
                
                if self.vastuTipsConn.responseCode() == 1{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData!
                    
                    self.pushCountLbl.hidden = false
                    
                    print(arr?.valueForKey("data") as? Int)
                    
                    let num = arr?.valueForKey("data") as? NSNumber
                    
                    if num != nil{
        
                    let numb = num as! Int
                    
                    if numb>0{
                    
                     UIApplication.sharedApplication().applicationIconBadgeNumber = numb
                        
                      self.pushCountLbl.text =  num?.stringValue
                        
                      self.pushCountLbl.hidden = false
                        
                    }else {
                        
                        self.pushCountLbl.hidden = true
                    }
                
                    }else{
                        
                         self.pushCountLbl.hidden = true
                    }
                    
                    }else {
                    
                    self.pushCountLbl.hidden = true
                 }
                
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    }

    func magnitudeFromAttitude(attitude: CMAttitude) -> Double {
        
        return sqrt(pow(attitude.roll, 2) + pow(attitude.yaw, 2) + pow(attitude.pitch, 2))
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        // var oldRad =  -manager.heading.trueHeading * M_PI / 180.0f
        
        //var newRad =  -newHeading.trueHeading * M_PI / 180.0f;
        
        let  M_PI = 3.14159265358979323846264338327950288
        
        let oldRad:Float = Float(-manager.heading!.trueHeading*M_PI/180.0)
        
        let newRad:Float =  Float(-newHeading.trueHeading * M_PI/180.0)
        
        
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotateAnimation.fromValue = NSNumber(float: oldRad)
        
        rotateAnimation.toValue = NSNumber(float: newRad)
        
        rotateAnimation.duration = 0.5
        
         self.compass_img.layer.addAnimation(rotateAnimation, forKey: "animateMyRotation")
        
        self.compass_img.transform = CGAffineTransformMakeRotation(CGFloat(newRad))
        
        let mHeading = Float(newHeading.magneticHeading)
        
        //        if compassStart == 0{
        //
        //        compass_img.layer.addAnimation(rotateAnimation, forKey:"transform.rotation")
        //
        //        let rotation_angle = CGFloat(newRad)
        //
        //         compass_img.transform = CGAffineTransformMakeRotation(rotation_angle)
        //
        //            compassStart = 1
        //
        //        }


        //valAccuracy =  motionManager.deviceMotion.magneticField.accuracy.value
        

             //motionManager.deviceMotionUpdateInterval = 0.01
            
//            if motionManager.deviceMotionAvailable {
//                
//                 //motionManager.deviceMotionUpdateInterval = 0.01
//                
//                motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
//                    data, error in
//                    
//                    let rotation = atan2(data!.gravity.x, data!.gravity.y) - M_PI
//                    self.compass_img.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
//                
//                    var magnitude = self.magnitudeFromAttitude(data!.attitude)
//                
//                if magnitude<1
//                {
//                    
//                    magnitude = magnitude*100
//                    
//                } else {
//                    
//                    magnitude = magnitude*10
//                }
//                
//               
//                
//            })
//        }
        
        print(array_Points)
        
        if (mHeading >= 339) || (mHeading <= 22) {
            
            str_Score = array_Points[1]
            
            str_tips = array_Tips[1] as String
            
            directions = "in North"
            
            tap_place_btn_index = 1
            
            
            degree_lbl.text = NSString(format: "%.0f° N", mHeading) as String
            
            
        } else if (mHeading > 23) && (mHeading <= 68) {
            
            str_Score =  array_Points[2]
            
            str_tips = array_Tips[2] as String
            
            directions = "im East"
            
            tap_place_btn_index = 2
            
            degree_lbl.text = NSString(format: "%.0f° NE", mHeading) as String
            
            
        } else if (mHeading > 69) && (mHeading <= 113) {
            
            str_Score = array_Points[4]
            
            tap_place_btn_index = 4
            
            str_tips = array_Tips[4] as String
            
            directions="in East"
            
            degree_lbl.text = NSString(format: "%.0f° E", mHeading) as String
            
        } else if (mHeading) > 114 && (mHeading) <= 158 {
            
            str_Score =  array_Points[7]
            
            tap_place_btn_index = 7
            
            str_tips = array_Tips[7] as String
            
            directions = "in South-East"
            
            degree_lbl.text = NSString(format: "%.0f° SE", mHeading) as String
            
        } else if (mHeading > 159) && (mHeading <= 203) {
            
            str_Score = array_Points[6]
            
            tap_place_btn_index = 6
            
            str_tips = array_Tips[6] as String
            
            directions = "in South"
            
            degree_lbl.text = NSString(format: "%.0f° S", mHeading) as String
            
        } else if (mHeading > 204) && (mHeading <= 248) {
            
            str_Score = array_Points[5]
            
            tap_place_btn_index = 5
            
            str_tips = array_Tips[5] as String
            
            directions = "in South-West"
            
            degree_lbl.text = NSString(format: "%.0f° SW", mHeading) as String
            
        } else if (mHeading > 249) && (mHeading <= 293) {
            
            
            print(array_Points)
            
            str_Score = array_Points[3]
            
            tap_place_btn_index = 3
            
            str_tips = array_Tips[3] as String
            
            directions = "in West"
            
            degree_lbl.text = NSString(format: "%.0f° W", mHeading) as String
            
        } else if(mHeading > 294) && (mHeading <= 338){
            
            str_Score = array_Points[0]
            
            tap_place_btn_index = 0
            
            str_tips = array_Tips[0] as String
            
            directions = "in North-West"
            
            degree_lbl.text = NSString(format: "%.0f° NW", mHeading) as String
            
            //VastuTips(str_tips)
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            //scope_lbl.textColor = (UIColor .redColor())
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            //scope_lbl.textColor = UIColor(red: 255, green: 150, blue: 50, alpha: 1)
            
           // scope_lbl.textColor = (UIColor .redColor())
            
           // scope_lbl.textColor = (UIColor .redColor())
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        } else if 6 == str_Score && str_Score == 7 {
            
            //scope_lbl.textColor = navigation_view.backgroundColor
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Minor Vastu Dosha) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        } else if str_Score == 8 {
            
           // scope_lbl.textColor = UIColor(red: 8, green: 103, blue: 13, alpha: 1)
            
           // scope_lbl.textColor = (UIColor .greenColor())
            
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        } else if str_Score == 9 {
            
            
            //scope_lbl.textColor = UIColor(red: 8, green: 103, blue: 13, alpha: 1)
            
            //scope_lbl.textColor = (UIColor .greenColor())
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        }else if str_Score == 9 {
            
            
            //scope_lbl.textColor = UIColor(red: 8, green: 103, blue: 13, alpha: 1)
            
            //scope_lbl.textColor = (UIColor .greenColor())
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Excellent Vastu Compliance) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        }
        
        scope_lbl.text =  NSString(format: "Score: %d/10 \n(Excellent Vastu Compliance) ",str_Score ) as String
        
        scope_lbl.text = place_title+"\n"+scope_lbl.text!
        
        
    }
    
    
    @IBAction func tapMenu_list_btn(sender: AnyObject) {
        
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        //make sure you use the relevant array sizes
        
        return 12;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            
            if self.view.frame.size.width == 768{
                
                return 200
                
            }else{
                
                
                return 150;
                
            }
            
        } else {
            
            if self.view.frame.size.width == 768{
                
                return 70
                
            }else{
                
                
                return 47;
                
            }
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        if(indexPath.row == 0){
            
            var cell : userTableViewCell! = tableView.dequeueReusableCellWithIdentifier("userCell") as! userTableViewCell
            
            if(cell == nil)
            {
                cell = NSBundle.mainBundle().loadNibNamed("userCell", owner: self, options: nil)[0] as! userTableViewCell;
            }
            
            cell.user_img.layer.cornerRadius =  45
            
            cell.userImg_btn.layer.cornerRadius =  45.0
            
            cell.selectionStyle=UITableViewCellSelectionStyle.None
            
            cell.backgroundColor = navigation_view.backgroundColor
            //return cell as homeTableViewCell
            
            return cell
            
        } else {
            
            var cell : menuTableViewCell! = tableView.dequeueReusableCellWithIdentifier("menuCell") as! menuTableViewCell
            
            if(cell == nil)
            {
                cell = NSBundle.mainBundle().loadNibNamed("menuCell", owner: self, options: nil)[0] as! menuTableViewCell;
            }
            
            if indexPath.row == 1
            {
                
                cell.menuName_lbl.text = "About Vastu"
                
                //var image : UIImage = UIImage(named:"about_i")!
                
                cell.icon_img.image = UIImage(named: "logo")
                
                // cell.icon_img = UIImageView(image: image)
                
                
            } else if indexPath.row == 2 {
                
                cell.menuName_lbl.text = "Benefits"
                
                cell.icon_img.image = UIImage(named: "benefit_i")
                
                
            }else if indexPath.row == 3 {
                
                cell.menuName_lbl.text = "Check Your Property Vastu Score"
                cell.menuName_lbl.lineBreakMode = NSLineBreakMode.ByWordWrapping
                cell.menuName_lbl.numberOfLines = 2
                
                cell.menuName_lbl.sizeToFit()
                
                cell.icon_img.image = UIImage(named: "property_i")
                
                
                
            } else if indexPath.row == 4 {
                
                cell.menuName_lbl.text = "Online Vastu"
                
                cell.icon_img.image = UIImage(named: "online_i")
                
            } else if indexPath.row == 5 {
                
                cell.menuName_lbl.text = "Advanced Vastu"
                
                cell.icon_img.image = UIImage(named: "advance_i")
                
            } else if indexPath.row == 6 {
                
                cell.menuName_lbl.text = "Vastu Products"
                
                
                cell.icon_img.image = UIImage(named: "product_i")
                
                
            } else if indexPath.row == 7 {
                
                cell.menuName_lbl.text = "Vastu Tips"
                
                cell.icon_img.image = UIImage(named: "tips_i")
                
                
            } else if indexPath.row == 8 {
                
                cell.menuName_lbl.text = "Consult Now"
                
                cell.icon_img.image = UIImage(named: "cunsult_i")
                
                
            }else if indexPath.row == 9 {
                
                cell.menuName_lbl.text = "Contact us"
                
                cell.icon_img.image = UIImage(named: "contact_i")
                
                
            } else if indexPath.row == 10 {
                
                cell.menuName_lbl.text = "Share"
                
                cell.icon_img.image = UIImage(named: "share_i")
                
            } else if indexPath.row == 11 {
                
                cell.menuName_lbl.text = "Download Vastushastra ebook"
                
                cell.icon_img.image = UIImage(named: "filedownload" )
                
            }
            
            
            cell.selectionStyle=UITableViewCellSelectionStyle.None
            
            if interface == "ipad"{
                
                tbl_view.scrollEnabled = false
                
            }
            
            return cell
            
            
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        locationManager.stopUpdatingHeading()
        
        locationManager.stopUpdatingLocation()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        if indexPath.row == 0 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("profileVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 1 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("aboutVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 2 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("benefitVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        }else if indexPath.row == 3 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("placeVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 4 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("onlineVastuVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 5 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("advanceVastuVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 6 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("productVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 7 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("vastuTipsVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 8 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("consultNowVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 9 {
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        } else if indexPath.row == 10 {
            
            let sharingItems = ["https://play.google.com/store/apps/details?id=com.vastukripa"]
            
            let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
            
            //if iPhone
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone) {
                self.presentViewController(activityViewController, animated: true, completion: nil)
            } else {
                let popoverCntlr = UIPopoverController(contentViewController: activityViewController)
                popoverCntlr.presentPopoverFromRect(CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0), inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
                
            }} else if indexPath.row == 10 {
            
            let sharingItems = ["https://play.google.com/store/apps/details?id=com.vastukripa"]
            
            let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
            
            //if iPhone
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone) {
                self.presentViewController(activityViewController, animated: true, completion: nil)
            } else
            {
                let popoverCntlr = UIPopoverController(contentViewController: activityViewController)
                popoverCntlr.presentPopoverFromRect(CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0), inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
                
            }

        }else if indexPath.row == 11{
            
            let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("getdetail")
            
            self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
            
        }
        
        
    }
    
    
    
    @IBAction func tap_selectPlace_btn(sender: AnyObject) {
        
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            locationManager.stopUpdatingHeading()
            
            locationManager.stopUpdatingLocation()
            
            self.dismissViewControllerAnimated(false, completion: nil)
            
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("vastucompassVC")
            self.showViewController(vc as! UIViewController, sender: vc)
        }
    }
    
    @IBAction func tapOnline_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("onlineVastuVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        }
    }
    @IBAction func tapAdvanceVastu_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
            
            
        }else{
            
            locationManager.stopUpdatingHeading()
            
            locationManager.stopUpdatingLocation()
            
            self.dismissViewControllerAnimated(false, completion: nil)
            
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("advanceVastuVC")
            self.showViewController(vc as! UIViewController, sender: vc)
        }
    }
    
    
    @IBAction func tapProduct_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            locationManager.stopUpdatingHeading()
            
            locationManager.stopUpdatingLocation()
            
            //[self dismissViewControllerAnimated:YES completion:nil];
            // This shows a warning: Attempt to dismiss from view contr
            
            self.dismissViewControllerAnimated(false, completion: nil)
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("productVC")
            
            self.showViewController(vc as! UIViewController, sender: vc)
            
        }
    }
    
    
    @IBAction func tapVastuTip_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            self.dismissViewControllerAnimated(false, completion: nil)
            
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("vastuTipsVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        }
        
    }
    
    @IBAction func tapConsultNow_btn(sender: AnyObject) {
        
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            locationManager.stopUpdatingHeading()
            
            locationManager.stopUpdatingLocation()
            
            self.dismissViewControllerAnimated(false, completion: nil)
            
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("consultNowVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
        }
    }
    
    
    func getVastuScore(){
        
        print("call")
        
        //Director's Cabin Temple/Poojasthan Kitchen Master's Bedroom Safe/Vault
        //Toilet Entrance Door
        
        
        if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Director's Cabin" {
                
                array_Points = [6,5,4,9,5,10,9,4]
                
        } else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Temple/Poojasthan" {
                
                array_Points = [5,8,10,3,9,0,1,6]
                
        } else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Kitchen" {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Master's Bedroom" {
                
                array_Points = [6, 5, 5, 9,4, 10,9,4]
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Safe/Vault" {
                
                array_Points = [5,10,9,6,8,9, 5, 5]
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Toilet" {
                
                array_Points = [10,2,0,8,2,2,6,4]
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Entrance Door" {
                
                array_Points = [6,10,10,5,10,0,3,6]
                
        }
        
        
        
        if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Director's Cabin" {
                
                array_Tips = ["• Not advisable to create the Managing Director Cabin at the North-West(Vayu kona), because this could affect the decision making capabilities and would always keep him on the move / travelling, but, the Director handling the Marketing department should be allocated this North-West cabin.\n\n• Ensure that the Directors and Heads of Departments face North side(ideally) or North-East or East side.\n\n• Avoid grey, black, blue upholstery, paint or laminates. Prefer brown, dull green, mustard shade upholstery.\n\n• In order to further empower the Director and to make him focussed and balanced, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it in the corresponding wall behind the Director Seat at about 4 feet level or above).\n\n• General attributes of North-West zone(Vayu Kona): North-West.\nNorth-West Ruled by: Lord Vayu(the God of Winds).\nNorth-West Ruled by: Moon planet(Chandra/Shashi/Chaand).\nColor: White/Ivory White/Light Yellow.\nMantra to \tbe recited: 'Om Shram Shrim Shrom Sah Chandramasey Namah'.\nGemstone: Pearl(Moti/Mukta)\nElement: Wind(Vayu Tatva).",
                    "• Not advisable to create the Director Cabin at North(Uttar disha), because this could affect the decisiveness of the Director. Ideally the Director cabins should be at the South-West, West or South zone.\n\n• It is suggested to create an Accounts Department, Cashier or a Library in the North zone.\n\n• Directors should face the 'Uttar disha' North side(ideally) or North-East or 'Poorav disha' East side.\n\n• Do not place heavy furniture at the North-East corner of the cabin.\n\n• Avoid sharp cornered furniture/columns. Do not sit below over-head beams or sharp cornered cabinets or open shelves.\n\n• In order to enhance the decisiveness and power of the Director, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it on the corresponding wall behind the Director's Seat at about 4 feet level or above.).\n\n• Also install the Sacred Symbol' of Om or Swastik above the cabin entrance door frame(install the symbols inside and outside)\n\n• General attributes of North zone(Uttar disha).\nNorth Ruled by: Lord Kuber(The Lord of Wealth) & Maa Durga.\nNorth Ruled by: Mercury planet(Budh).\nColor: Green.\nMantra to be recited: 'Om Bram Brim Broom Sah Budhaey Namah'.\nGemstone: Green Emerald (Panna).",
                    "• Not advisable to create the Director Cabin at North-East(Eshanya Kona), because this could affect the power and control of the Director. Ideally the Director cabins should be at the South-West, West or South zone.\n\n• Ensure that the Directors face North side(ideally) or North-East or East side, but the Director should not sit backing the door.\n\n• Avoid grey, black, blue upholstery, paint or laminates. Prefer brown, dull green, mustard shade upholstery.\n\n• In order to enhance the power and control of the Director, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick'on the wall(install it in the corresponding wall behind the Director's Seat at about 4 feet level or above.).\n\n• Install the Sacred Symbol' of Om or Swastik above the cabin entrance door frame(install it inside and outside).\n\n• North-East is the 'Dev Moola'(zone of Gods), hence it is suggested to install the Temple at this zone and install our 'Divine Connect Yantra Frame' in the Poojasthaan (Temple).\n\n• General attributes of North-East zone(Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(the Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva)",
                    "• It is advisable to create the Director Cabin at the West(Paschim disha), because this could empower the Director to be goal oriented, focussed and help to take the right decisions.\n\n• Managing Director's cabin should be created at the South-West zone and other Directors/Head of Departments cabin can be created in the West or South zone.\n\n• Ensure that the Directors and Heads of Departments face North side(ideally) or North-East or East side.\n\n• In order to further empower the Director and to make him focussed and balanced, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it in the corresponding wall behind the Director Seat at about 4 feet level or above)\n\n• General attributes of West zone(Paschim disha):\nWest Ruled by: Lord Varuna(The God of Rain and Water)\nWest Ruled by: Saturn planet(Shani)\nColor: Black, Blue.\nMantra to be recited: 'Om Pram Prim Proom Sah Shanischarey Namah'.\nGemstone: Blue Sapphire(Neelam/Neelima).",
                    "• Not advisable to create the Director Cabin at East(Poorav disha), because this could affect the power and control of the Director. Ideally the Director cabins should be at the South-West, West or South zone.\n\n• Ensure that the Director face North side(ideally) or North-East or East side, but the Director should not sit backing the door.\n\n• The cabin entrance door should not be positioned at the South, South-West or West side. Ideally the Cabin Door should be positioned at the North, North-East or East side.\n\n• Avoid keeping unwanted things lying around and too many books lying un-necessarily on the desk.\n\n• Do not place heavy furniture at the North-East corner of the cabin.\n\n• In order to enhance the power and authority of the Director, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it in the corresponding wall behind the Director Seat at about 4 feet level or above.)\n\n• Also install the 'Sacred Symbol' of Om or Swastik above the cabin entrance door frame(install it inside and outside).\n\n• General attributes of East zone(Poorav disha):\nEast Ruled by: Lord Soorya(The Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Ruby(Manik).",
                    "• Best location for the Director Cabin is the South-West(Dakshin disha), because this could make the Director balanced, focussed, powerful, bolder, stronger and decisive.\n\n• Never create junior executive cabins, toilet, pantry, finished stock store at the South-West zone.\n\n• Ensure that the Directors face North side(ideally) or North-East or East side.\n\n• Keep maximum and heavy furniture etc. in the South-West corner of the office/cabin.\n\n• Avoid sharp cornered furniture/columns. Do not sit below over-head beams or sharp cornered cabinets or open shelves.\n\n• In order to further empower the Director and to make him focussed and balanced, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it in the corresponding wall behind the Director Seat at about 4 feet level or above).\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairuti\nSouth-West Ruled by: Rahu planet\nColor: Black, Blackish Brown, Violet\nMantra to be recited: 'Om Bhram Bhrim Bhroom Sah Rahvey Namah'.\nGemstone: Gomed(Zircon) Lead.\nElement: Earth(Prithvi Tatva)",
                    "• Advisable to create the Director Cabin at the South(Dakshin disha), because this could make the Director powerful, bolder, stronger and decisive.\n\n• Ensure that the Directors face North side(ideally) or North-East or East side.\n\n• Directors and Executives should not sit below the overhead beams or below the overhead cabinets.\n\n• Do not place heavy furniture at the North-East corner of the cabin.\n\n• Avoid keeping unwanted things lying around and too many books lying un-necessarily on the desk.\n\n• Avoid sharp cornered furniture/columns. Do not sit below over-head beams or sharp cornered cabinets or open shelves.\n\n• In order to further empower the Director and to make him focussed and balanced, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it in the corresponding wall behind the Director Seat at about 4 feet level or above.).\n\n• General attributes of South zone(Dakshin disha):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: 'Om Kram Krim Kroom Sah Bhomaey Namah'.\nGemstone: Red Coral(Moonga/Mangal).",
                    "• Not advisable to create the Director Cabin at the South-East direction ie. in the 'Agnisthaan'(fire zone), because this could make the Director extremely furious, aggressive, volatile and hyper. Ideally the Director Cabins should be at the South-West, West or South zone.\n\n• The Creative Team(Designers) should occupy the South-East Cabin.\n\n• Ensure that the Directors face North side(ideally) or North-East or East side, but the Director should not sit backing the door.\n\n• Every-day, light a 'diya' or keep a bright red Color bulb switched on at the South-East corner of the cabin.\n\n• Avoid grey, black, blue upholstery, paint or laminates. Prefer brown, dull green, mustard shade upholstery.\n\n• In order to reduce the aggressiveness of the Director and to make him comfortable, we suggest to Install our Vastu Product Accessories: 'Power Grid Stick' on the wall(install it in the corresponding wall behind the Director Seat at about 4 feet level or above.).\n\n• Also install the 'Sacred Symbol' of Om or Swastik above the cabin entrance door frame(install it inside and outside).\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(the God of Fire).\nSouth-East Ruled by: Venus Planet(Shukra).\nColor: Pink/White(Pinkish).\nMantra to be recited: 'Om Dram Drim Droom Sah Shukraey Namah'.\nGemstone: Diamond (Hira).\nElement: Fire(Agni Tatva)."]
                
                
                
        } else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Temple/Poojasthan" {
                
                array_Tips = ["• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Never keep the Temple darshan completely closed. i.e. the light and air should penetrate into the temple, hence keep the shutters open.\n\n• Keep some Silver articles/Silver Coins in the Poojasthaan.\n\n• The windows of the temple should be kept open for maximum time.\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• At home worship \"Sthir Laxmi ji\" i.e. Goddess Mahalaxmi ji sitting on a lotus.\n\n• Ideally the Temple/Poojasthan should be created at the North-East zone, in case it is not possible, then ensure that the photos and idols of God should be installed on the Poorav disha(East side). The devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Do not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• General attributes of North-West zone(Vayu Kona):\nNorth-West Ruled by: Lord Vayu(The God of Winds)\nNorth-West Ruled by: Moon Planet(Chandra / Shashi/Chaand)\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: 'Om Shram Shrim Shrom Sah Chandramasey Namah'.\nGemstone: Pearl(Moti/Mukta).\nElement: Wind(Vayu Tatva).",
                    
                    
                    "• Do not keep multiple temples/statues/pictures in different zones, hence create a single temple in the premises.\n\n• The photos and idols of God should be installed on the Poorav disha(East side). The devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• Do not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Do not use black, grey granite in the temple. Ideally use white, beige or green marble.\n\n• General attributes of North zone(Uttar disha):\nNorth Ruled by: Lord Kuber(The Lord of Wealth) & Maa Durga.\nNorth Ruled by: Mercury Planet(Budh).\nColor: Green.\nMantra to be recited: 'Om Bram Brim Broom Sah Budhaey Namah'.\nGemstone: Green Emerald(Panna).",
                    
                    
                    "• North-East zone is called 'Eshanya Kona'/'Dev Moola' i.e. the abode of Gods. North-East is the energy flow source point. It is recommended to create the Temple/Poojasthan at the North-East zone.\n\n• Never keep the Temple darshan completely closed. i.e. the light and air should penetrate into the temple, hence keep the shutters open.\n\n• The photos and idols of God should be facing Poorav disha(East side) or Paschim disha(West side) ie. either the devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Keep atleast 1 litre of Ganga Jal in the Poojasthaan.\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Do not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• Paint the temple wall in light yellow, golden or white.\n\n• General attributes of North-East zone(Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(the Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nMantra to be recited: 'Om Gram Grim Grom Sah Guruveh Namah'.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva).",
                    
                    
                    "• The photos and idols of God should be facing Poorav disha(East side) or Paschim disha(West side) ie. Either the devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• At home worship \"Sthir Laxmi ji\" ie. Goddess Mahalaxmi ji sitting on a lotus.\n\n• Do not keep multiple temples/statues/pictures in different zones, hence create a single temple in the premises.\n\n• Do not recite/play the Gayatri Mantra after 12 noon.\n\n• Never keep the Temple darshan completely closed. ie. the light and air should penetrate into the temple, hence keep the shutters open.\n\n• Do not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• General attributes of West zone(Paschim disha):\nWest Ruled by: Lord Varuna(The God of Rain and Water)\nWest Ruled by: Saturn Planet(Shani)\nColor: Black, Blue.\nMantra to be recited: 'Om Pram Prim Proom Sah Shanischarey Namah'.\nGemstone: Blue Sapphire(Neelam/Neelima).",
                    
                    
                    "• Keep the East side windows open for maximum time.\n\n• The photos and idols of God should be installed on the Poorav disha(East side). The devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• Keep atleast 1 litre of Ganga Jal in the Poojasthaan.\n\n• Paint the temple wall in light yellow, golden or white.\n\n• The photos and idols of God should be facing Poorav disha(East side) or Paschim disha(West side) ie. Either the devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• At home worship \"Sthir Laxmi ji\" ie. Goddess Mahalaxmi ji sitting on a lotus.\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Do not keep multiple temples/statues/pictures in different zones, hence create a single temple in the premises.\n\n• General attributes of East zone(Poorav disha):\nEast Ruled by: Lord Soorya(The Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Ruby (Manik).",
                    
                    
                    "• Ideally the Temple/Poojasthan should be created at the North-East zone, in case it is not possible, then ensure that the photos and idols of God should be installed on the Poorav disha(East side). The devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Never keep the Temple darshan completely closed. ie. The light and air should penetrate into the temple, hence keep the shutters open.\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• In order to enhance the energy of the zone, Keep the Divine Oorja Cube in the Temple shelf/drawer.\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• At home worship \"Sthir Laxmi ji\" ie. Goddess Mahalaxmi ji sitting on a lotus.\n\n• Do not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• Do not transact big and important deals on Amavasya and other inauspicious days.\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairuti\nSouth-West Ruled by: Rahu Planet\nColor: Black, Blackish Brown, Violet,\nMantra to be recited: 'Om Bhram Bhrim Bhroom Sah Rahvey Namah'.\nGemstone: Gomed(Zircon) Lead.\nElement: Earth(Prithvi Tatva).",
                    
                    
                    "• Ideally the Temple/Poojasthan should be created at the North-East zone, in case it is not possible, then ensure that the photos and idols of God should be installed on the Poorav disha(East side). The devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• At home worship \"Sthir Laxmi ji\" ie. Goddess Mahalaxmi ji sitting on a lotus.\n\n• Do not keep multiple temples/statues/pictures in different zones, hence create a single temple in the premises.\n\n•\tDo not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• Recite the \"Hanuman Chalisa\" in a routine.\n\n• General attributes of South zone(Dakshin disha):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars Planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: 'Om Kram Krim Kroom Sah Bhomaey Namah'.\nGemstone: Red Coral(Moonga / Mangal).",
                    
                    
                    "• Ideally the Temple/Poojasthan should be created at the North-East zone, in case it is not possible, then ensure that the photos and idols of God should be installed on the Poorav disha(East side). The devotee performing Puja should face Poorav disha(East side) or God's photo and moorti should face Poorav disha(East side).\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Play \"Vastu Shanti\" and other mantras in a daily routine.\n\n• Do not keep pictures of departed souls(ancestors) in the Temple and especially on the same platform with other pictures of God. Ideally the pictures of departed souls should be installed on the Dakshin walls.\n\n• Do not transact big and important deals on Amavasya and other inauspicious days.\n\n• Light a Diya in the temple(especially in the morning and at sunset time).\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(the God of Fire).\nSouth-East Ruled by: Venus Planet(Shukra).\nColor: Pink/White(Pinkish).\nMantra to be recited: 'Om Dram Drim Droom Sah Shukraey Namah'.\nGemstone: Diamond(Hira).\nElement: Fire(Agni Tatva)."
                ]
                
                
                
        } else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Kitchen" {
                
                array_Tips = ["• It is alright to create the Kitchen at the Vayu kona(North-West zone).\n\n• Ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona(North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom (\"jhadoo\") in a standing position.\n\n• General attributes of North-West zone(Vayu Kona).:\nNorth-West Ruled by: Lord Kuber(The Lord of Wealth)\nNorth-West Ruled by: Moon Planet(Chandra/Shashi/Chaand)\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: \"Om Shram Shrim Shrom Sah Chandramasey Namah\".\n.Gemstone: Pearl(Moti/Mukta)\nElement: Wind(Vayu Tatva).",
                    
                    
                    "• Kitchen should not be constructed at the Uttar disha(North direction). Ideally, the kitchen should be in the Agnisthaan(South-East zone) of the home. The second best position is the Vayu kona(North-West zone).\n\n• Incase it is not possible to relocate the Kitchen to the South-East zone, then atleast ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitche (\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona (North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of North zone(Uttar disha):\nNorth Ruled by: Lord Kuber(the Lord of Wealth) & Maa Durga.\nNorth Ruled by: Mercury Planet(Budh).\nColor: Green.\nMantra to be recited: \"Om Bram Brim Broom Sah Budhaey Namah\".\nGemstone: Green Emerald(Panna).",
                    
                    
                    "• Never construct a kitchen in the Eshanya Kona(North-East zone). Ideally, the kitchen should be in the Agnisthaan(South-East zone) of the home. The second best position is the Vayu kona(North-West zone).\n\n• Incase it is not possible to relocate the Kitchen to the South-East zone, then atleast ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona(North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of North-East zone(Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(the Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nMantra to be recited: \"Om Gram Grim Grom Sah Guruveh Namah\".\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva)",
                    
                    
                    "• Ideally, the kitchen should be in the Agnisthaan(South-East zone) of the home. The second best position is the Vayu kona(North-West zone).\n\n• Incase it is not possible to relocate the Kitchen to the South-East zone, then atleast ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha (North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona(North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of West zone (Paschim disha):\nWest Ruled by: Lord Varuna(The God of Rain and Water)\nWest Ruled by: Saturn Planet(Shani)\nColor: Black, Blue.\nMantra to be recited: \"Om Pram Prim Proom Sah Shanischarey Namah\".\nGemstone: Blue Sapphire(Neelam/Neelima).",
                    
                    
                    "• Incase it is not possible to relocate the Kitchen to the South-East zone, then atleast ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona (North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of East zone (Poorav disha):\nEast Ruled by\tLord: Soorya(The Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: \"Om Hram Hrim Hroom Sah Suryaey Namah\".\nGemstone: Ruby (Manik).",
                    
                    
                    "• Never construct a kitchen in the Nairuti Kona(South-West zone) of the home. Ideally, the kitchen should be in the Agnisthaan(South-East zone) of the home. The second best position is the Vayu kona(North-West zone).\n\n• Incase it is not possible to relocate the Kitchen to the South-East zone, then atleast ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona(North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairuti\nSouth-West Ruled by: Rahu Planet\nColor: Black, Blackish Brown, Violet,\nMantra to be recited: \"Om Bhram Bhrim Bhroom Sah Rahvey Namah\".\nGemstone: Gomed(Zircon) Lead.\nElement: Earth(Prithvi Tatva).",
                    
                    
                    "• Incase it is not possible to relocate the Kitchen to the South-East zone, then atleast ensure that the gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona(North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of South zone(Dakshin disha):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars Planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: \"Om Kram Krim Kroom Sah Bhomaey Namah\".\nGemstone: Red Coral(Moonga/Mangal).",
                    
                    
                    "• South-East direction is ruled by Lord Agni(The God of Fire). This zone is considered \"heated zone\" hence constructing a Kitchen at the South-East direction is most ideal.\n\n• The gas burner stove should be placed in the Agni kona(South-East zone) of the kitchen and the person faces Poorav disha(East zone) while doing cooking.\n\n• The sink, water filter or pitcher(\"matka\") should be installed in the Uttar disha(North zone), Eshanya kona(North-East zone) or Poorav disha(East zone) of the kitchen.\n\n• The heaters, conventional ovens, micro-waves ovens should be placed on the Agni kona(South-East zone) or Dakshin disha(South zone) of the kitchen. Never place gas burner, heaters, conventional ovens, micro-waves ovens etc. in the Eshanya Kona(North East zone).\n\n• Place heavy fridge, kitchen cabinets and other gadgets on the Dakshin disha(South zone) and Paschim disha(West zone).\n\n• Maintain maximum distance between the gas burner and sink/water matka(ie. fire and water). Also ensure that you do not keep water bottles near the gas burner.\n\n• Avoid black, grey shade granite kitchen platform. Prefer marble or maroon/brown granite.\n\n• Prefer light subtle Colored tiles(off white, peach, light pink, cream, light yellow).\n\n• Do not keep the broom(\"jhadoo\") in a standing position.\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(The God of Fire).\nSouth-East Ruled by: Venus Planet(Shukra).\nColor: Pink/White(Pinkish).\nMantra to be recited: \"Om Dram Drim Droom Sah Shukraey Namah\".\nGemstone: Diamond(Hira).\nElement: Fire(Agni Tatva)."
                ]
                
                
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Master's Bedroom" {
                
                
                array_Tips = ["• North-West is ruled by Lord Vayu(the Lord of Wind). Ideally the North-West bedroom should be allocated as the Daughter's bedroom, Guest Bedroom so that The Master bedroom should never be created at the North-West zone.\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• Install good pictures and posters which display happiness, bloom, liveliness etc.\n\n• It is advisable to keep the windows of this room open for maximum time.\n\n• In the couple's bedroom and unmarried children's bedroom(ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf.\n\n• Do not install mirror opposite the bed. Either remove the mirror or cover it with wall paper/curtain/fabric/roll down screen.\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stickin the centre of the headboard back).\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2' 'hooks'). Hang / place the Power Grid Stick between the 2' 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall.\n\n• General attributes of West zone(Paschim disha) :\nNorth-West Ruled by Lord Vayu(the God of Winds).\nNorth-West Ruled by: Lord Vayu(The God of Winds).\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: 'Om Shram Shrim Shrom Sah Chandramasey Namah'.\nGemstone: Pearl(Moti/Mukta).\nElement: Wind(Vayu Tatva).",
                    
                    
                    "• Master bedroom should not be at the North direction. This bedroom can be allocated as a Guest room.\n\n• Ensure that the toilet is not constructed at the North-East corner.\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• Keep the North, North-East and East side window open for maximum time.\n\n• Avoid grey, black, blue, red bed-spreads, curtains and wall paper. The curtains, bedspreads and wall paper in the bedrooms should be in lively subtle shades of pink, peach, ivory, beige, light(dull) green etc.\n\n• In the couple's bedroom and unmarried children's bedroom(ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/self.\n\n• Since the bedroom/bedroom door is not ideally positioned, Install the 'Sacred Symbol' of Om or Swastik above the Bedroom Door frame(install the symbols inside and outside).\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stickin the centre of the headboard back).\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang / place the Power Grid Stick between the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall\n\n• General attributes of North zone(Uttar disha):\nNorth Ruled by: Lord Kuber(the Lord of Wealth) & Maa Durga.\nNorth Ruled by: Mercury Planet(Budh).\nColor: Green.\nMantra to be recited: 'Om Bram Brim Broom Sah Budhaey Namah'.\nGemstone: Green Emerald (Panna).",
                    
                    
                    "• Ensure that the toilet is not constructed at the North-East corner.\n• It is not suggested to create the Master bedroom at the North-East direction.\n\n• While sleeping do not keep the mobile phone below the pillow or very close to your body.\n\n• Do not place a heavy cupboard at the North-East corner of the room.\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• Do not keep metal, valuables, books inside the bed storage.\n\n• Keep the North, North-East and East side window open for maximum time\n\n• In the couple's bedroom and unmarried children's bedroom(ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf\n\n• Since the bedroom/bedroom door is not ideally positioned, Install the 'Sacred Symbol' of Om or Swastik above the Bedroom Door frame(install the symbols inside and outside)\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stickin the centre of the headboard back).\no\tOption 1. Screw / fix 'white metal hooks' at the centre of the back of the bed head-board (keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2' 'hooks'.\no\tOption 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall.\no General attributes of North-East zone (Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(the Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nMantra to be recited: 'Om Gram Grim Grom Sah Guruveh Namah'.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva).",
                    
                    
                    "• Ideally the bedroom which is in the West direction should be allocated to the Son and Daughter-in-law(provided the South-West bedroom is occupied by the senior couple).\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• While sleeping do not keep the mobile phone below the pillow or very close to your body.\n\n• It is suggested to keep South, South-West and West side window closed for maximum time.\n\n• Avoid grey, black, blue, red bed-spreads, curtains and wall paper. The curtains, bedspreads and wall paper in the bedrooms should be in lively subtle shades of pink, peach, ivory, beige, lilac etc.\n\n• In the couple's bedroom and unmarried children's bedroom (ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf.\n\n• Do not install mirror opposite the bed. Either remove the mirror or cover it with wall paper/curtain/fabric/roll down screen.\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stick in the centre of the headboard back).\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall.\n\n• General attributes of West zone(Paschim disha):\nWest Ruled by: Lord Vayu(the God of Winds).\nWest Ruled by: Lord Vayu(the God of Winds).\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: 'Om Shram Shrim Shrom Sah Chandramasey Namah'.\nGemstone: Pearl(Moti/Mukta).\nElement: Wind(Vayu Tatva).",
                    
                    
                    "• East is ruled by Lord Soorya. It would be advisable to allocate this bedroom to the Son(s). Do not create Master bedroom at the East direction.\n\n• Avoid sleeping on the metal/wrought iron bed.\n\n• While sleeping do not keep the mobile phone below the pillow or very close to your body.\n\n• Ensure that the toilet is not constructed at the North-East corner.\n\n• Install good pictures and posters which display happiness, bloom, liveliness etc.\n\n• Keep the North, North-East and East windows open for maximum time.\n\n• Avoid grey, black, blue, red bed-spreads, curtains and wall paper. The curtains, bedspreads and wall paper in the bedrooms should be in lively subtle shades of pink, ivory, beige, light yellow etc.\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• In the couple's bedroom and unmarried children's bedroom(ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf.\n\n• Do not install mirror opposite the bed. Either remove the mirror or cover it with wall paper/curtain/fabric/roll down screen.\n\n• Since the bedroom/bedroom door is not ideally positioned, Install the 'Sacred Symbol' of Om or Swastikabove the Bedroom Door frame(install the symbols inside and outside).\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stickin the centre of the headboard back).\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2 'hooks'.\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2 'hooks'.\n\n• General attributes of East zone(Poorav disha):\nEast Ruled by: Lord Soorya(The Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Ruby(Manik).",
                    
                    
                    "• The most ideal location for Master bedroom is the South-West direction. This would help the couple to be decisive, powerful and stable.\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• While sleeping do not keep the mobile phone below the pillow or very close to your body.\n\n• Install good pictures and posters which display happiness, bloom, liveliness etc.\n\n• It is suggested to keep South, South-West and West window closed for maximum time.\n\n• Avoid grey, black, blue, red bed-spreads, curtains and wall paper. The curtains, bedspreads and wall paper in the bedrooms should be in lively subtle shades of pink, peach, ivory, beige, lilac etc.\n\n• In the couple's bedroom and unmarried children's bedroom(ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf.\n\n• Do not install mirror opposite the bed. Either remove the mirror or cover it with wall paper/curtain/fabric/roll down screen.\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stick in the centre of the headboard back).\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall (hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall.\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairuti.\nSouth-West Ruled by: Rahu Planet.\nColor: Black, Blackish Brown, Violet.\nMantra to be recited: 'Om Bhram Bhrim Bhroom Sah Rahvey Namah'.\nGemstone: Gomed(Zircon) Lead.\nElement: Earth(Prithvi Tatva).",
                    
                    
                    "• It is advisable to create the Master bedroom at the Dakshin disha(South direction).\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• While sleeping do not keep the mobile phone below the pillow or very close to your body.\n\n• Install good pictures and posters which display happiness, bloom, liveliness etc.\n\n• It is suggested to keep South, South-West and West side window closed for maximum time.\n\n• Avoid grey, black, blue, red bed-spreads, curtains and wall paper. The curtains, bedspreads and wall paper in the bedrooms should be in lively subtle shades of pink, peach, ivory, beige etc.\n\n• In the couple's bedroom and unmarried children's bedroom(ie. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf.\n\n• Do not install mirror opposite the bed. Either remove the mirror or cover it with wall paper/curtain/fabric/roll down screen.\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stick in the centre of the headboard back).\no Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall.\n\n• General attributes of South zone(Dakshin disha):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars Planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: 'Om Kram Krim Kroom Sah Bhomaey Namah'.\nGemstone: Red Coral(Moonga/Mangal).",
                    
                    
                    "• South-East direction is ruled by Lord Agni(the God of Fire). This zone is considered 'heated zone', hence avoid allocating this bedroom to young couples, hot tempered persons, ailing persons(person suffering from major illness).\n\n• It is suggested to sleep with head towards Dakshin(South) or Poorav(East) side.\n\n• Avoid sleeping on the metal/wrought iron bed.\n\n• Install good pictures and posters which display happiness, bloom, liveliness etc.\n\n• In the couple's bedroom and unmarried children's bedroom(i.e. marriageable age boy/girl) it is suggested to keep the Happy Relationship Yantra for abundance of peace, happiness, love, happy, contended life and a lasting relationship. Place the Happy Relationship Yantra on the bedside table/drawer/shelf.\n\n• Do not install mirror opposite the bed. Either remove the mirror or cover it with wall paper/curtain/fabric/roll down screen.\n\n• Since the bedroom/bedroom door is not ideally positioned, Install the 'Sacred Symbol' of Om or Swastik above the Bedroom Door frame(install the symbols inside and outside).\n\n• In-order to energize the bedroom and nullify the negativity/Vastu dosha, Install the Power Grid Stick behind the Bed headboard(install the Power Grid Stickin the centre of the headboard back).\n\n• Option 1: Screw/fix 2 'white metal hooks' at the centre of the back of the bed head-board(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stick between the 2 'hooks'.\n\n• Option 2: Embed the Power Grid Stick within the wall at the centre of the back of the bed head-board. Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall. Do not embed the Power Grid Stick in a toilet common wall.\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(The God of Fire).\nSouth-East Ruled by: Sun Planet(Sooya).\nColor: Pink/White(Pinkish).\nMantra to be recited: 'Om Dram Drim Droom Sah Shukraey Namah'.\nGemstone: Diamond(Hira).\nElement: Fire(Agni Tatva)."
                ]
                
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Safe/Vault" {
                
                array_Tips = ["• North-West is the zone of Vayu, hence anything kept there will move fast. If the 'Tijori'(Vault/Safe)/Cash Drawer is kept in this zone, then the outflow of funds could be fast.\n\n• The vault, cash drawer, cupboard which contains cash, valuables and important documents should be installed at the Nairuti kona(South-West zone) of the room.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times.\n\n• As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha(East zone).\n\n• Keep maximum Silver utensils etc in this North-West zone Tijori/Cupboard / Cash-Drawer.\n\n• Paint the locker in yellow or off white shade (from inside and outside). Avoid grey, black and blue painted vault (locker).\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of North-West zone(Vayu Kona):\nNorth-West Ruled by: Lord Vayu(The God of Winds)\nNorth-West Ruled by: Moon Planet(Chandra/Shashi/Chaand)\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: 'Om Shram Shrim Shrom Sah ChandramasevastuTip_btn.framey Namah'.\nGemstone: Pearl(Moti/Mukta)\nElement: Wind(Vayu Tatva).",
                    
                    
                    "• The best direction to place the vault, cash drawer, cupboard which contains cash, valuables and important documents is the North direction because Lord Kuber is the presiding Lord of the North direction(Uttar disha).\n\n• The vault, cash drawer, cupboard should be installed at the Nairuti kona(South-West zone) of the room.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times. As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha(East zone).\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault(locker).\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of North zone(Uttar disha):\nNorth Ruled by: Lord Kuber(The Lord of Wealth) & Maa Durga.\nNorth Ruled by: Mercury Planet(Budh).\nColor\tGreen.\nMantra to be recited: 'Om Bram Brim Broom Sah Budhaey Namah'.\nGemstone: Green Emerald(Panna).",
                    
                    
                    "•The 'Tijori'(Vault/Safe)/Cash Drawer should never open towards South or West direction because it could affect the flow of funds and create financial drains.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times.\n\n• As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha(East zone).\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault(locker).\n\n• Do not keep shoes below the Vault(Tijori).\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of North-East zone(Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(The Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nMantra to be recited: 'Om Gram Grim Grom Sah Guruveh Namah'.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva).",
                    
                    "• The 'Tijori'(Vault/Safe)/Cash Drawer should never open towards South or West direction because it could affect the flow of funds and create financial drains.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) or towards the Poorav disha(East zone).\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault(locker).\n\n• Do not keep shoes below the Vault(Tijori).\n\n• The cash drawer/vault(locker) should be never be kept empty. It is always advisable to keep some valuables and cash permanently in it.\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of West zone(Paschim disha):\nWest Ruled by: Lord Varuna(The God of Rain and Water)\nWest Ruled by: Saturn Planet(Shani)\nColor: Black, Blue.\nMantra to be recited: 'Om Pram Prim Proom Sah Shanischarey Namah'.\nGemstone: Blue Sapphire(Neelam/Neelima).",
                    
                    
                    "• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times. As a second best alternative the cash drawer/vault (locker) should open towards the Poorav disha(East zone).\n\n• The 'Tijori'(Vault/Safe)/Cash Drawer should never open towards South or West direction because it could affect the flow of funds and create financial drains.\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault(locker).\n\n• General attributes of East zone(Poorav disha):\nEast Ruled by: Lord Soorya (The Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Ruby (Manik).",
                    
                    
                    
                    "• For more stability of finances the vault, cash drawer, cupboard which contains cash, valuables and important documents should be installed at the Nairuti kona(South-West zone).\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) i.e the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times. As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha(East zone).\n\n• The 'Tijori'(Vault/Safe)/Cash Drawer should never open towards South or West direction because it could affect the flow of funds and create financial drains.\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault(locker).\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairuti\nSouth-West Ruled by: Rahu Planet\nColor: Black, Blackish Brown, Violet,\nMantra to be recited: 'Om Bhram Bhrim Bhroom Sah Rahvey Namah'.\nGemstone: Gomed(Zircon) Lead.\nElement: Earth(Prithvi Tatva).",
                    
                    
                    
                    "• Do not keep shoes below the Vault(Tijori).\n\n• The cash drawer/vault(locker) should be never be kept empty. It is always advisable to keep some valuables and cash permanently in it.\n\n• The 'Tijori'(Vault/Safe)/Cash Drawer should never open towards South or West direction because it could affect the flow of funds and create financial drains.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times. As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha(East zone).\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault(locker).\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of South zone(Dakshin disha):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars Planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: 'Om Kram Krim Kroom Sah Bhomaey Namah'.\nGemstone: Red Coral(Moonga/Mangal).",
                    
                    
                    
                    "• The 'Tijori'(Vault/Safe)/Cash Drawer should never open towards South or West direction because it could affect the flow of funds and create financial drains.\n\n• The vault, cash drawer, cupboard which contains cash, valuables and important documents should be installed at the Nairuti kona(South-West zone).\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times. As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha (East zone).\n\n• Paint the locker in yellow or off white shade(from inside and outside). Avoid grey, black and blue painted vault (locker).\n\n• Do not keep shoes below the Vault (Tijori).\n\n• The cash drawer/vault(locker) should be never be kept empty. It is always advisable to keep some valuables and cash permanently in it.\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(The God of Fire).\nSouth-East Ruled by: Venus Planet(Shukra).\nColor: Pink/White(Pinkish).\nMantra to be recited: 'Om Dram Drim Droom Sah Shukraey Namah'.\nGemstone: Diamond(Hira).\nElement: Fire(Agni Tatva)."
                ]
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Toilet" {
                
                array_Tips = ["• North-West zone is the most suited location for constructing the Toilets.\n\n• The outlet of the water should not be in the Agnisthaan(South-East zone) or the Nairuti kona(South-West zone).\n\n• You may construct the Septik Tank in the North-West zone.\n\n• Toilet seat should not installed in the Eshanya Kona(North-East zone) of the bathroom. The toilet seat should be placed in such a manner that the person sitting on it faces Uttar disha(North side). The person sitting on the WC pot should never face or back the rising Sun(Poorav disha - East side).\n\n• Pictures/statues, sacred symbols or murals of God should not be installed on toilet common wall.\n\n• The washbasin, shower and mirror should be installed on the Uttar disha(North side) or the Poorav disha(East side).\n\n• Prefer white, off white or beige shade tiles, WC pot and basin for all toilets.\n\n• The toilet door should be kept closed even when not in use, to avoid negative energies to spread in the property.\n\n• General attributes of North-West zone(Vayu Kona):\nNorth-West Ruled by:\tLord Vayu(The God of Winds)\nNorth-West Ruled by: Moon Planet(Chandra/Shashi/Chaand)\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: 'Om Shram Shrim Shrom Sah Chandramasey Namah'.\nGemstone: Pearl(Moti/Mukta)\nElement: Wind(Vayu Tatva).",
                    
                    
                    "• It is not advisable to construct the Toilet at North(Uttar disha), because this could affect the stability of finances and fund flow.\n\n• The toilet door should not be opposite the Bed or Pooja room.\n\n• The washbasin, shower and mirror should be installed on the Uttar disha(North side) or the Poorav disha(East side).\n\n• Toilet seat should not installed in the Eshanya Kona(North-East zone) of the bathroom. The toilet seat should be placed in such a manner that the person sitting on it faces Uttar disha(North side). The person sitting on the WC pot should never face or back the rising Sun(Poorav disha - East side).\n\n• In the toilet, keep a bowl containing 'white rock salt 'saindha namak'. Every week, throw the old salt in the basin / wc pot. Replace the salt every week.\n\n• The toilet door should be kept closed even when not in use, to avoid negative energies to spread in the property.\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• General attributes of North zone(Uttar disha):\nNorth Ruled by: Lord Kuber(The Lord of Wealth) & Maa Durga.\nNorth Ruled by: Mercury Planet(Budh).\nColor: Green.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Green Emerald(Panna).",
                    
                    
                    "• Never construct a Toilet in the Eshanya Kona(North-East zone) because it could create problems in all spheres of life.\n\n• Never construct a toilet below a staircase.\n\n• The toilet door should not be opposite the Bed or Pooja room.\n\n• Pictures/statues, sacred symbols or murals of God should not be installed on toilet common wall.\n\n• Sprinkle Holy Ganga Jal in the entire property in a routine.\n\n• In the toilet, keep a bowl containing 'white rock salt 'saindha namak'. Every week, throw the old salt in the basin/wc pot. Replace the salt every week.\n\n• Install the Divine Connect Vedic Yantra Frame(depicting ShreeYantra, Lord Vastu Devta Vedic Yantra, Lord Kuber Vedic Yantra and Nav Grah Vedic Yantra) in the temple and recite the mantras and worship regularly.\n\n• Recite the \"Vastu Shanti\" Mantra and Om Namo Shivay Mantra in a routine.\n\n• General attributes of North-East zone(Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(The Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nMantra to be recited: 'Om Gram Grim Grom Sah Guruveh Namah'.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva).",
                    
                    
                    "• Constructing a Toilet in the West zone is reasonably alright.\n\n• The washbasin, shower and mirror should be installed on the Uttar disha(North side) or the Poorav disha(East side).\n\n• The outlet of the water should not be in the Agnisthaan(South-East zone) or the Nairuti kona(South-West zone).\n\n• Toilet seat should not installed in the Eshanya Kona(North-East zone) of the bathroom. The toilet seat should be placed in such a manner that the person sitting on it faces Uttar disha(North side). The person sitting on the WC pot should never face or back the rising Sun(Poorav disha - East side).\n\n• Avoid installing orange or red shade wall or flooring tiles.\n\n• Prefer white, off white or beige shade tiles, WC pot and basin for all toilets.\n\n• The toilet door should be kept closed even when not in use, to avoid negative energies to spread in the property.\n\n• Install the mirror and wash basin on the Northern or Eastern wall.\n\n• Install the shower panel on the Northern or Eastern wall.\n\n• General attributes of West zone(Paschim disha):\nWest Ruled by: Lord Varuna(The God of Rain and Water)\nWest Ruled by: Saturn Planet(Shani)\nColor: Black, Blue.\nMantra to be recited: 'Om Pram Prim Proom Sah Shanischarey Namah'.\nGemstone: Blue Sapphire(Neelam/Neelima).",
                    
                    
                    "• Never construct a Toilet in the Poorav disha(East zone). It could affect the growth, knowledge and power.\n\n• The washbasin, shower and mirror should be installed on the Uttar disha(North side) or the Poorav disha(East side).\n\n• In the toilet, keep a bowl containing 'white rock salt 'saindha namak'. Every week, throw the old salt in the basin/wc pot. Replace the salt every week.\n\n• The outlet of the water should not be in the Agnisthaan(South-East zone) or the Nairuti kona(South-West zone).\n\n• Toilet seat should not installed in the Eshanya Kona(North-East zone) of the bathroom. The toilet seat should be placed in such a manner that the person sitting on it faces Uttar disha(North side). The person sitting on the WC pot should never face or back the rising Sun(Poorav disha - East side).\n\n• Prefer white, off white or beige shade tiles, WC pot and basin for all toilets.\n\n• The toilet door should be kept closed even when not in use, to avoid negative energies to spread in the property.\n\n• General attributes of East zone(Poorav disha):\nEast Ruled by: Lord Soorya(the Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Ruby(Manik).",
                    
                    
                    "• Never construct a Toilet in the Nairuti Kona(South-West zone) since it could affect the stability of life and business.\n\n• The outlet of the water should not be in the Agnisthaan(South-East zone) or the Nairuti kona(South-West zone).\n\n• The washbasin, shower and mirror should be installed on the Uttar disha(North side) or the Poorav disha(East side).\n\n• Toilet seat should not installed in the Eshanya Kona(North-East zone) of the bathroom. The toilet seat should be placed in such a manner that the person sitting on it faces Uttar disha(North side). The person sitting on the WC pot should never face or back the rising Sun(Poorav disha - East side).\n\n• Prefer white, off white or beige shade tiles, WC pot and basin for all toilets.\n\n• The toilet door should be kept closed even when not in use, to avoid negative energies to spread in the property.\n\n• Pictures/statues, sacred symbols or murals of God should not be installed on toilet common wall.\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairuti\nSouth-West Ruled by: Rahu Planet\nColor: Black, Blackish Brown, Violet,\nMantra to be recited: 'Om Bhram Bhrim Bhroom Sah Rahvey Namah'.\nGemstone: Ruby(Manik).",
                    
                    
                    "• Install the mirror and wash basin on the Northern or Eastern wall.\n\n• Install the shower panel on the Northern or Eastern wall.\n\n• Never construct a toilet below a staircase.\n\n• The toilet door should not be opposite the Bed or Pooja room.\n\n• Pictures/statues, sacred symbols or murals of God should not be installed on toilet common wall.\n\n• The outlet of the water should not be in the Agnisthaan(South-East zone) or the Nairuti kona(South-West zone).\n\n• Toilet seat should not installed in the Eshanya Kona(North-East zone) of the bathroom. The toilet seat should be placed in such a manner that the person sitting on it faces Uttar disha(North side). The person sitting on the WC pot should never face or back the rising Sun(Poorav disha - East side).\n\n• Prefer white, off white or beige shade tiles, WC pot and basin for all toilets.\n\n• General attributes of South zone(Dakshin disha):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars Planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: 'Om Kram Krim Kroom Sah Bhomaey Namah'.\nGemstone: Red Coral(Moonga/Mangal).",
                    
                    
                    "• Constructing a Toilet at the Agnisthaan(South-East zone) can create relationship troubles, litigations and mental unrest.\n\n• Never install over-head water tank or under-ground water tank in the Agnisthaan(South-East zone).\n\n• Never construct a toilet below a staircase.\n\n• The toilet door should not be opposite the Bed or Pooja room.\n\n• Pictures/statues, sacred symbols or murals of God should not be installed on toilet common wall.\n\n• The washbasin, shower and mirror should be installed on the Uttar disha(North side) or the Poorav disha (East side).\n\n• The outlet of the water should not be in the Agnisthaan(South-East zone) or the Nairuti kona(South-West zone).\n\n• Prefer white, off white or beige shade tiles, WC pot and basin for all toilets.\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(the God of Fire).\nSouth-East Ruled by: Venus Planet(Shukra).\nColor: Pink/White(Pinkish).\nMantra to be recited: 'Om Dram Drim Droom Sah Shukraey Namah'.\nGemstone: Diamond(Hira).\nElement: Fire(Agni Tatva)"
                ]
                
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Entrance Door" {
                
                array_Tips = ["• If the Main door is at the North of North-West direction(ie. if the door is facing the North side), then it is considered reasonably good.\n\n• If the Main door is at the West of North-West direction(ie. if the door is facing the West side), then it is considered a flaw(Vastu dosha).\n\n• The Main door should open inwards in a clockwise direction.\n\n• Install a light outside the main door and keep it switched on during the evening hours.\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).\n\n• Above the Main Door, Install a pure Silver Coin depicting Religious Symbols of Om/Swastik/Om-Swastik Trishul/Lord Ganeshaji/Ek-Onkar/Navkar.\n\n• Since the Main Door is not well positioned, Install the Power Grid Stickabove the Main Door Frame(at the inner side/inside the property).\no Option 1: Screw/fix 2 'white metal hooks' on the wall(above the main door frame)(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stickbetween the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall(above the main door frame). Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall.\n",
                    
                    
                    "• North direction is ruled by Lord Kuber(the Lord of Wealth). If the Main door is at the North direction, then it is considered very auspicious and would help to achieve financial gains and growth.\n\n• The Main door should open inwards in a clockwise direction.\n\n• Enter your home with your right leg in first.\n\n• Do not install the symbol of Swastik & Maa Laxmiji Charan on the floor level.\n\n• If you have installed a moorti of Lord Ganesha ji above the Main Door from outside, then install a moorti of Lord Ganesha ji above the Main Door from inside the home also(ie. the moorti/picture of Lord Ganesha ji should be installed back to back).\n\n• Install a light outside the main door and keep it switched on during the evening hours.\n\n•Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).",
                    
                    
                    "• North-East direction is the 'Dev Moola'(zone of the Gods and Goddesses). If the Main door is at the North-East direction, then it is considered very auspicious and beneficial in all spheres of life ie. health, wealth and relationships.\n\n• Ensure that any picture/statue of Lord Ganesha ji does not back your house. Always ensure that the picture/statue of Lord Ganesha ji is installed back to back.\n\n• The Main door should open inwards in a clockwise direction.\n\n• Enter your home with your right leg in first.\n\n• If you have installed a moorti of Lord Ganesha ji above the Main Door from outside, then install a moorti of Lord Ganesha ji above the Main Door from inside the home also(ie. the moorti/picture of Lord Ganesha ji should be installed back to back).\n\n• Install a light outside the main door and keep it switched on during the evening hours.\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).\n\n• General attributes of North-East zone(Eshanya Kona, Dev Moola):\nNorth-East Ruled by: Eshanya(the Supreme Lord).\nNorth-East Ruled by: Jupiter Planet(Brihaspati).\nColor: Yellow/Golden.\nMantra to be recited: 'Om Gram Grim Grom Sah Guruveh Namah'.\nGemstone: Yellow Sapphire(Pukhraj).\nElement: Water(Jal Tatva)",
                    
                    
                    "• Main door located at the West direction is considered reasonably acceptable.\n\n• Above the Main Door frame, Install a picture of Lord Hanumanji(inorder to gain Divine protection from the negativities).\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).\n\n• If you have installed a moorti of Lord Ganesha ji above the Main Door from outside, then install a moorti of Lord Ganesha ji above the Main Door from inside the home also(ie. the moorti/picture of Lord Ganesha ji should be installed back to back).\n\n• Since the Main Door is not well positioned, Install the Power Grid Stickabove the Main Door Frame (at the inner side/inside the property).\no Option 1:  Screw/fix 2 'white metal hooks' on the wall(above the main door frame)(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stickbetween the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall(above the main door frame). Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall.\n\n• General attributes of West zone(Paschim disha):\nWest Ruled by: Lord Varuna(The God of Rain and Water)\nWest Ruled by: Saturn Planet(Shani)\nColor: Black, Blue.\nMantra to be recited: 'Om Pram Prim Proom Sah Shanischarey Namah'.\nGemstone: Blue Sapphire(Neelam/Neelima).",
                    
                    
                    "• East direction is ruled by Lord Soorya. If the Main door is at the East direction, then it is considered very auspicious, lucky and helps to achieve knowledge, power and abundance.\n\n• The Main door should open inwards in a clockwise direction.\n\n• Enter your home with your right leg in first.\n\n• Do not install the symbol of Swastik & Maa Laxmiji Charan on the floor level.\n\n• Ensure that any picture/statue of Lord Ganesha ji does not back your house. Always ensure that the picture/statue of Lord Ganesha ji is installed back to back.\n\n• If you have installed a moorti of Lord Ganesha ji above the Main Door from outside, then install a moorti of Lord Ganesha ji above the Main Door from inside the home also(ie. the moorti/picture of Lord Ganesha ji should be installed back to back).\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).\n\n• General attributes of East zone(Poorav disha):\nEast Ruled by: Lord Soorya(The Sun God).\nEast Ruled by: Sun Planet(Sooya).\nColor: Yellow/Golden/Orange.\nMantra to be recited: 'Om Hram Hrim Hroom Sah Suryaey Namah'.\nGemstone: Ruby(Manik).",
                    
                    
                    "• Main door located at the South-West direction is considered a major flaw(Vastu dosha) and may prove inauspicious. Try to relocate the Main Door towards East/North/North-East side.\n\n• Above the Main Door frame, Install a picture of Lord Hanumanji(inorder to gain Divine protection from the negativities).\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside). Avoid sleeping on the metal/wrought iron bed.\n\n• Install the Temple at this zone and install our 'Divine Connect Yantra Frame'in the Poojasthaan(Temple). Recite the \"Hanuman Chalisa\" and \"Vastu Shanti\" jaap.Since the Main Door is not well positioned, Install the Power Grid Stick above the Main Door Frame(at the inner side/inside the property).\no Option 1: Screw/fix 2 'white metal hooks' on the wall(above the main door frame)(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stickbetween the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall(above the main door frame). Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall.\n\n• General attributes of South-West zone(Nairuti Kona):\nSouth-West Ruled by: Lord Nairut\nSouth-West Ruled by: Rahu Planet\nColor: Black, Blackish Brown, Violet\nMantra to be recited: 'Om Bhram Bhrim Bhroom Sah Rahvey Namah'.\nGemstone: Gomed(Zircon) Lead.\nElement: Earth(Prithvi Tatva).",
                    
                    
                    "• Main door located at the South direction is considered a major flaw(Vastu dosha).\n\n• Try to relocate the Main Door towards the East side.\n\n• Above the Main Door frame, Install a picture of Lord Hanumanji(inorder to gain Divine protection from the negativities).\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).\n\n• Install the Temple at this zone and install our 'Divine Connect Yantra Frame' in the Poojasthaan(Temple). Recite the \"Hanuman Chalisa\" and \"Vastu Shanti\" jaap.\n\n• Since the Main Door is not well positioned, Install the Power Grid Stick above the Main Door Frame(at the inner side/inside the property).\no Option 1: Screw/fix 2 'white metal hooks' on the wall(above the main door frame)(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stickbetween the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall(above the main door frame). Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall.\no General attributes of South-East zone(Agni Sthaan):\nSouth Ruled by: Lord Yama.\nSouth Ruled by: Mars Planet(Mangal).\nColor: Red, Deep Maroon.\nMantra to be recited: 'Om Kram Krim Kroom Sah Bhomaey Namah'.\nGemstone: Red Coral(Moonga/Mangal).",
                    
                    
                    "• If the Main door is at the East of South-East direction(ie. if the door is facing the East side), then it is considered reasonably good.\n\n• If the Main door is at the South of South-East direction(ie. if the door is facing the South side), then it is considered a flaw(Vastu dosha). Try to relocate the Main Door towards the East side.\n\n• The Main door should open inwards in a clockwise direction.\n\n• Enter your home with your right leg in first.\n\n• Install the 'Sacred Symbol' of Om or Swastik above the Entrance Door frame(install the symbols inside and outside).\n\n• Since the Main Door is not well positioned, Install the Power Grid Stick above the Main Door Frame(at the inner side/inside the property).\no Option 1: Screw/fix 2 'white metal hooks' on the wall(above the main door frame)(keep about 1.5 feet distance between the 2 'hooks'). Hang/place the Power Grid Stickbetween the 2 'hooks'.\no Option 2: Embed the Power Grid Stick within the wall(above the main door frame). Create a horizontal hole in the wall(hole should be measuring 25 inches long x 1.5 inches deep). Place the Power Grid Stick in it. Thereafter re-plaster the wall.\n\n• General attributes of South-East zone(Agni Sthaan):\nSouth-East Ruled by: Lord Agni(the God of Fire).\nSouth-East Ruled by: Venus Planet(Shukra).\nColor: Pink/White(Pinkish).\nMantra to be recited: 'Om Dram Drim Droom Sah Shukraey Namah'.\nGemstone: Diamond(Hira).\nElement: Fire(Agni Tatva)."
                ]
                
                
        }
        
        
    }
    
    @IBAction func tapMore_tips_btn(sender: AnyObject) {
        
     main_scrollView.userInteractionEnabled = false
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
    
            
            
            moreTipsPress = 1
            
            if tap_place_btn == 1 {
                
                if tap_place_btn_index == 0 {
                    
                    place_title = "Kitchen"
                    
                    array_Points = [8,4,0,5,5,3,8,10]
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index0", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index00", ofType:"html")!)
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 1 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index1", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index11", ofType:"html")!)
                        
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 2 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index2", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index22", ofType:"html")!)
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 3 {
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index3", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index33", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 4 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index4", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index4", ofType:"html")!)
                        
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 5 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index5", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index55", ofType:"html")!)
                        
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 6 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index6", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index66", ofType:"html")!)
                        
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 7 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index7", ofType:"html")!)
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index77", ofType:"html")!)
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                }
                
                lbl_infoHeader.text = "Kitchen "+directions
                
            }
            
            
            if tap_place_btn == 2 {
                
                if tap_place_btn_index == 0 {
                    
                    place_title = "Temple/Poojasthan"
                    
                    array_Points = [8,4,0,5,5,3,8,10]
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index0", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index00", ofType:"html")!)
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 1 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index1", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index11", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
    
                   // more_tips_btn.frame.size.width = self.view.frame.size.with
                    
                  
                    
                } else if tap_place_btn_index == 2 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index2", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index22", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 3 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index3", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index33", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 4 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index4", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index44", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 5 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index5", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index55", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 6 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index6", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index66", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 7 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index7", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index77", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                }
                
                lbl_infoHeader.text = "Temple "+directions
                
            }
            
            if tap_place_btn == 3 {
                
                if tap_place_btn_index == 0 {
                    
                    place_title = "Toilet"
                    
                    array_Points = [8,4,0,5,5,3,8,10]
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index0", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index00", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 1 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index1", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index11", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 2 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index2", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index22", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 3 {
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index3", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index33", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 4 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index4", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index44", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 5 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index5", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index55", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 6 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index6", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index66", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 7 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index7", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index77", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                }
                
                lbl_infoHeader.text = "Toilet "+directions
            }
            
            if tap_place_btn == 4 {
                
                if tap_place_btn_index == 0 {
                    
                    place_title = "Master's Bedroom"
                    
                    array_Points = [8,4,0,5,5,3,8,10]
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index0", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index00", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 1 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index1", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index11", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 2 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index2", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index22", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 3 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index3", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index33", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 4 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index4", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index44", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 5 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index5", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index55", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 6 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index6", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index66", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 7 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index7", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index77", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                }
                
                lbl_infoHeader.text = "Bed Room "+directions
            }
            
            
            if tap_place_btn == 5 {
                
                if tap_place_btn_index == 0 {
                    
                    place_title = "Entrance Door"
                    
                    array_Points = [8,4,0,5,5,3,8,10]
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index0", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index00", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 1 {
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index1", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index11", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 2 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index2", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index22", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 3 {
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index3", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index33", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 4 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index74", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index44", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 5 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index5", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index55", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 6 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index6", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index66", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 7 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index7", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index77", ofType:"html")!)
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                }
                
                lbl_infoHeader.text = "Entrance Door "+directions
            }
            
            if tap_place_btn == 6 {
                
                if tap_place_btn_index == 0 {
                    
                    place_title = "Director's Cabin"
                    
                    array_Points = [8,4,0,5,5,3,8,10]
                    
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index0", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index00", ofType:"html")!)
                        
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 1 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index1", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index11", ofType:"html")!)
                        
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 2 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index2", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index22", ofType:"html")!)
                        
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 3 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index3", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index33", ofType:"html")!)
                        
                    }
                    
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 4 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index4", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index44", ofType:"html")!)
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                } else if tap_place_btn_index == 5 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index5", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index55", ofType:"html")!)
                        
                    }
                    request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                } else if tap_place_btn_index == 6 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index6", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index66", ofType:"html")!)
                    }
                    let request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                    
                    
                } else if tap_place_btn_index == 7 {
                    
                    if interface == "iphone"{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index7", ofType:"html")!)
                        
                    }else{
                        
                        url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index7", ofType:"html")!)
                        
                    }
                    let request = NSURLRequest(URL: url!)
                    
                    moreTipesWebView.loadRequest(request)
                    
                }
                
                lbl_infoHeader.text = "Director's Cabin "+directions
            }
            
            if self.view.frame.size.height<568
            {
                
                info_View.frame.size.height = 400
                
            }
            
           // lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+2
            
    
            
            //infoApp_img.frame.origin.x = self.lbl_infoHeader.frame.origin.x-30
            
            
            
            
            navigation_view.userInteractionEnabled = false

            
            vastuTipes_View.userInteractionEnabled = false
            
            info_View.hidden = false
            
            moreTipesWebView.hidden = false
            
            lbl_info.hidden = true
            
            infoApp_img.frame.origin.x = 5
            
            moreTipesWebView.frame.size.height = info_back_view.frame.size.height-6
            
            moreTipesWebView.backgroundColor = UIColor.darkGrayColor()
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
            
            if self.view.frame.size.height<1024{
            
            lbl_infoHeader.frame.origin.x = info_headerView.frame.size.width/2-lbl_infoHeader.frame.size.width/2
            }
              if self.view.frame.size.height<568{
                    
                    info_View.frame.size.height =  380
                    
                    info_back_view.frame.size.height = 380
                    
                    info_scroll_View.frame.size.height =  331
                    
                    info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2+25
                
              }else if self.view.frame.size.width==375{
                    
                    info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
                    
                
                    
               }else{
                    
                    info_View.frame.origin.y = 68
                    
                }
        }
        if self.view.frame.size.width == 768 {
            
            infoApp_img.frame.origin.x = 15
        
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
    
            
        }

        
        
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        moreTipesWebView.sizeToFit()
        
        //moreTipesWebView.frame.origin.x = 10
        
        //moreTipesWebView.frame.size.width = info_back_view.frame.size.height-6
        
        // print(moreTipesWebView.frame.size.height)
        
        info_red_img.frame.origin.x = (info_View.frame.size.width-info_red_img.frame.size.width)/2
        
        info_red_img.frame.origin.y = moreTipesWebView.frame.origin.y+moreTipesWebView.frame.size.height+10
        
        info_ok_btn.frame.origin.x = (info_View.frame.size.width-info_ok_btn.frame.size.width)/2
        
        info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
        
        print(info_View.frame.size.height)
        print(info_back_view.frame.size.height)
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if moreTipsPress == 1{
            
            moreTipsPress = 2
            
            return true
            
        }else{
            
            
            
            let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("productVC")
            self.showViewController(vc as! UIViewController, sender: vc)
            
            
            return false
            
        }
        
        
    }
    
    
    
    @IBAction func tapInfo_Btn(sender: AnyObject) {
        
        
        main_scrollView.userInteractionEnabled = false
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            
            magnetic_view.hidden = true
            
            
            if self.view.frame.size.height<568
            {
                
                info_View.frame.size.height = 400
                
            } else if self.view.frame.size.width==375{
                
                //info_View.frame.size.height = 550
                
                // info_back_view.frame.size.height = 550-info_back_view.frame.origin.y-2
                
            }
            
            lbl_infoHeader.text = "How to use Vastu Calculator"
            
            var frame = info_View.frame
            
            frame.origin.y =  self.view.frame.size.height/2-info_View.frame.size.height/2
            
            
            lbl_info.text = "• Stand in the center of the  property (Brahmasthaan) and orient yourself with a fixed direction with the help of the compass. And please put the phone parallel to the earth axis.\n\n• Room/Space name is displayed at the top of each page (e.g. Director Cabin). Also you can see the score regarding the direction of the place.\n\n• When you are using the Vastu Calculator, please ensure that you are not close to any Magnetic Field like Iron Beams / Columns / Metallic Furniture / Electric Fans / Magnets / Metals because it could interfere with the Magnetic North Readings. Please check that while using this Vastu Calculator on our App..the Magnetic Field should be less than 50uT.\n\n• On top of the screen, You will see the Score and also the Level of Vastu compliance. The Score will ascertain the level of Vastu Doshas or Vastu Perfection of your property.\n\n• You can check the Vastu Tips for the particular place by clicking \"Tips for this direction\" button for particular direction using compass.\n\n• You can select different Vastu places by clicking \"Evaluate other vastu places\" button.\n\n• To Initialize the Sensors, point your phone up towards the sky and move it in a figure 8 motion.";
            
            lbl_info.sizeToFit()
            
            lbl_info.hidden = false
            
            moreTipesWebView.hidden = true
            
            if self.view.frame.size.width<768{
                
                info_View.frame=frame
                
                lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+2
                
                infoApp_img.frame.origin.x = 5
                
            }
            
            
            frame = info_red_img.frame
            
            frame.origin.x = (self.info_View.frame.size.width-info_red_img.frame.size.width)/2
            
            info_red_img.frame=frame
            
            info_red_img.frame.origin.y = self.lbl_info.frame.origin.y+self.lbl_info.frame.size.height+15
            
            frame = info_ok_btn.frame
            
            frame.origin.x = (self.info_View.frame.size.width-info_ok_btn.frame.size.width)/2
            
            info_ok_btn.frame=frame
            
            info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
            
            info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
            
            info_View.frame.origin.x = self.view.frame.size.width/2-info_View.frame.size.width/2
            
            
            //info_View.frame.origin.y = self.view.frame.size.height/2-info_View.frame.size.height/2
            info_View.frame.origin.y = 68
            
            navigation_view.userInteractionEnabled = false
            
            
            vastuTipes_View.userInteractionEnabled = false
            
            info_View.hidden = false
            
            
            if self.view.frame.size.width == 768 {
                
                infoApp_img.frame.origin.x = 10
                
                lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+10
                
                
            } else {
                
            }
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
            
        }
        if self.view.frame.size.height<568{
            
            
            info_View.frame.origin.y = self.view.frame.size.height/2-info_View.frame.size.height/2
            
            vastuTipes_View.userInteractionEnabled = true
            
        }else{
            
            info_View.frame.origin.y = 68
            
        }
    }
    
    
    
    
 @IBAction func info_hide_btn(sender: AnyObject) {
        
        main_scrollView.userInteractionEnabled = true
        
        moreTipesWebView.frame.size.height = 72
        
        info_View.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
        vastuTipes_View.userInteractionEnabled = true
    }
    
    @IBAction func tapKitchen_btn(sender: AnyObject) {
        
        let swVc = SWRevealViewController()
        
        swVc.rightRevealToggleAnimated(true)
        
        
        if tap_place_btn == 2 {
            
            kitchen_btn.backgroundColor = temple_btn.backgroundColor
            
            temple_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 3 {
            
            kitchen_btn.backgroundColor = toilet_btn.backgroundColor
            
            toilet_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 4 {
            
            kitchen_btn.backgroundColor = badroom_btn.backgroundColor
            
            badroom_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 5 {
            
            kitchen_btn.backgroundColor = door_btn.backgroundColor
            
            door_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 6 {
            
            kitchen_btn.backgroundColor = dirCabin_btn.backgroundColor
            
            dirCabin_btn.backgroundColor = UIColor.lightGrayColor()
        }
        
        tap_place_btn = 1
        
        
        place_title = "Kitchen"
        
        array_Points = [8,4,0,5,5,3,8,10]
        
        
        
        
        if showMagneticPopUp == 1  {
            
            print("")
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            print(magnetic)
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                main_scrollView.userInteractionEnabled  = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
            
        }
        
    }
    
    
    @IBAction func tapTemple_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            
            if tap_place_btn == 1 {
                
                temple_btn.backgroundColor = kitchen_btn.backgroundColor
                
                kitchen_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 3 {
                
                temple_btn.backgroundColor = toilet_btn.backgroundColor
                
                toilet_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 4 {
                
                temple_btn.backgroundColor = badroom_btn.backgroundColor
                
                badroom_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 5 {
                
                temple_btn.backgroundColor = door_btn.backgroundColor
                
                door_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 6 {
                
                temple_btn.backgroundColor = dirCabin_btn.backgroundColor
                
                dirCabin_btn.backgroundColor = UIColor.lightGrayColor()
            }
            
            tap_place_btn = 2
            
            
            place_title = "Temple/Poojasthan"
            
            array_Points = [5,8,10,3,9,0,1,6]
            
      if showMagneticPopUp == 1 {
                
                print("")
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
                print(magnetic)
                
                if magnetic == false{
                    
                    
                    magnetic_view.hidden = false
                    
                     main_scrollView.userInteractionEnabled  = false
                    
                    magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                    
                    navigation_view.userInteractionEnabled = false
                    
                  
                    
                    vastuTipes_View.userInteractionEnabled = false
                    
                }
                
            }
            
        }
        
    }
    
    @IBAction func tapToilet_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            if tap_place_btn == 1 {
                
                toilet_btn.backgroundColor = kitchen_btn.backgroundColor
                
                kitchen_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 2 {
                
                toilet_btn.backgroundColor = temple_btn.backgroundColor
                
                temple_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 4 {
                
                toilet_btn.backgroundColor = badroom_btn.backgroundColor
                
                badroom_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 5 {
                
                toilet_btn.backgroundColor = door_btn.backgroundColor
                
                door_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 6 {
                
                toilet_btn.backgroundColor = dirCabin_btn.backgroundColor
                
                dirCabin_btn.backgroundColor = UIColor.lightGrayColor()
            }
            
            tap_place_btn = 3
            
            
            place_title = "Toilet"
            
            array_Points = [10,2,0,8,2,2,6,4]
            
            
            
            if showMagneticPopUp == 1 {
                
                print("")
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
                print(magnetic)
                
                if magnetic == false{
                    
                    magnetic_view.hidden = false
                    
                     main_scrollView.userInteractionEnabled  = false
                    
                    magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                    
                    
                    navigation_view.userInteractionEnabled = false
                    
                    
                    vastuTipes_View.userInteractionEnabled = false
                    
                }
                
            }
            
        }
        
        
    }
    
    @IBAction func tapBedroom_btn(sender: AnyObject) {
        
        
        if tap_place_btn == 1 {
            
            badroom_btn.backgroundColor = kitchen_btn.backgroundColor
            
            kitchen_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 2 {
            
            badroom_btn.backgroundColor = temple_btn.backgroundColor
            
            temple_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 3 {
            
            badroom_btn.backgroundColor = toilet_btn.backgroundColor
            
            toilet_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 5 {
            
            badroom_btn.backgroundColor = door_btn.backgroundColor
            
            door_btn.backgroundColor = UIColor.lightGrayColor()
            
        } else if tap_place_btn == 6 {
            
            badroom_btn.backgroundColor = dirCabin_btn.backgroundColor
            
            dirCabin_btn.backgroundColor = UIColor.lightGrayColor()
        }
        
        tap_place_btn = 4
        
        place_title = "Master Bedroom"
        
        
        array_Points = [6, 5, 5, 9,4, 10,9,4]
        
       
        
        if showMagneticPopUp == 1 {
            
            print("")
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            print(magnetic)
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                 main_scrollView.userInteractionEnabled  = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                
                navigation_view.userInteractionEnabled = false
                
               
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
        }
        
    }
    
    
    @IBAction func tapDoor_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            
            if tap_place_btn == 1 {
                
                door_btn.backgroundColor = kitchen_btn.backgroundColor
                
                kitchen_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 2 {
                
                door_btn.backgroundColor = temple_btn.backgroundColor
                
                temple_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 3 {
                
                door_btn.backgroundColor = toilet_btn.backgroundColor
                
                toilet_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 4 {
                
                door_btn.backgroundColor = badroom_btn.backgroundColor
                
                badroom_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 6 {
                
                door_btn.backgroundColor = dirCabin_btn.backgroundColor
                
                dirCabin_btn.backgroundColor = UIColor.lightGrayColor()            }
            
            tap_place_btn = 5
            
            place_title = "Entrance Door"
            
            array_Points = [6,10,10,5,10,0,3,6]
            
            
            
            if showMagneticPopUp == 1 {
                
                print("")
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
                print(magnetic)
                
                if magnetic == false{
                    
                    magnetic_view.hidden = false
                    
                     main_scrollView.userInteractionEnabled  = false
                    
                    magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                    
                    
                    navigation_view.userInteractionEnabled = false
                    
                    
                    
                    vastuTipes_View.userInteractionEnabled = false
                    
                }
                
            }
            
        }
    }
    @IBAction func tapDirCabin_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
            
        }else{
            
            
            if tap_place_btn == 1 {
                
                dirCabin_btn.backgroundColor = kitchen_btn.backgroundColor
                
                kitchen_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 2 {
                
                dirCabin_btn.backgroundColor = temple_btn.backgroundColor
                
                temple_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 3 {
                
                dirCabin_btn.backgroundColor = toilet_btn.backgroundColor
                
                toilet_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 4 {
                
                dirCabin_btn.backgroundColor = badroom_btn.backgroundColor
                
                badroom_btn.backgroundColor = UIColor.lightGrayColor()
                
            } else if tap_place_btn == 5 {
                
                dirCabin_btn.backgroundColor = door_btn.backgroundColor
                
                door_btn.backgroundColor = UIColor.lightGrayColor()
            }
            
            
            tap_place_btn = 6
            
            place_title = "Director's Cabin"
            
            array_Points = [6,5,4,9,5,10,9,4]
            
                       
            if showMagneticPopUp == 1 {
                
                print("")
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
                print(magnetic)
                
                if magnetic == false{
                    
                    
                    magnetic_view.hidden = false
                    
                     main_scrollView.userInteractionEnabled  = false
                    
                    magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                    
                    
                    navigation_view.userInteractionEnabled = false
                    
                   
                    
                    vastuTipes_View.userInteractionEnabled = false
                    
                }
                
            }
        }
        
    }
    
    
    
    //  locationManager.startUpdatingHeading()
    
    @IBAction func tapMagnetic_ok_btn(sender: AnyObject) {
        
        magnetic_view.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
        main_scrollView.userInteractionEnabled  = true
        
        vastuTipes_View.userInteractionEnabled = true
        
        if scroll == 1{
            
            scroll = 0
            
        }
    }
    
    
    @IBAction func tapMag_dontShow_btn(sender: AnyObject) {
        
        navigation_view.userInteractionEnabled = true
        
        main_scrollView.userInteractionEnabled  = true
        
        vastuTipes_View.userInteractionEnabled = true
        
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            showMagneticPopUp = 0
            
            magnetic_view.hidden = true
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            defaults.setValue(1, forKey: "magnetic")
        }
        
    }
    
    @IBAction func tapVedio_btn(sender: AnyObject) {
        
        if scroll == 1{
            
            scroll = 0
            
        }else{
            
            
            UIApplication.sharedApplication().openURL(NSURL(string: "http://youtube.com")!)
            
            
        }
    }
    
    func scrollhide(){
      
        revealViewController().rightViewRevealWidth = 0.0
        
    }
    
    func rateMe() {
        
        let neverRate = NSUserDefaults.standardUserDefaults().boolForKey("neverRate")
        let numLaunches = NSUserDefaults.standardUserDefaults().integerForKey("numLaunches") + 1
        
        if (!neverRate)
        {
            showRateMe()
            
        }
        NSUserDefaults.standardUserDefaults().setInteger(numLaunches, forKey: "numLaunches")
    }
    
    func showRateMe() {
        
        let alert = UIAlertController(title: "App Rate", message: "Thanks for using Vastu Kripa", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Rate Now", style: UIAlertActionStyle.Default, handler: { alertAction in
            
            
         UIApplication.sharedApplication().openURL(NSURL(string :"https://play.google.com/store/apps/details?id=com.vastukripa")!);
        
            
            alert.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "Never", style: UIAlertActionStyle.Default, handler: { alertAction in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "neverRate")
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Later", style: UIAlertActionStyle.Default, handler: { alertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func downloadFile(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("getdetail")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)

    }
    
     
 
    @IBAction func tap_notification_ok_btn(sender: AnyObject) {
        
        notification_View.hidden = true
        
    }
    
  func checkLaunch(){
        
          if NSUserDefaults.standardUserDefaults().boolForKey("Notiction") == true{
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad){
                
                let story_Board = UIStoryboard(name:"Main_IPad", bundle:nil)
                
                let vc = story_Board.instantiateViewControllerWithIdentifier("tipsVC")
                
                self.presentViewController(vc, animated:true, completion:nil)
                
            }else{
                
                let story_Board = UIStoryboard(name:"Main_IPhone", bundle:nil)
                
                let vc = story_Board.instantiateViewControllerWithIdentifier("tipsVC")
            
                self.presentViewController(vc, animated: true, completion: nil)
                
            }
            
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "Notiction")
    
        
        }
    }
    
    func start(){
        
        indicator = IndicatorView(target:self.view, userEnable:true, message:"LOADING", backgroundColor:UIColor(colorLiteralRed:0.0/255.0, green:80.0/255.0, blue:0.0/255.0, alpha:1.0), fontColor:navigation_view.backgroundColor)
    
        indicator.start();
    }
    
    @IBAction func demo_videos(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://youtube.com")!)
        
    }
    
    @IBAction func usage_info(sender: AnyObject) {
        
           main_scrollView.userInteractionEnabled = false
        
           magnetic_view.hidden = true
        
           info_View.hidden = false
        
        
        
        if self.view.frame.size.height<568{
            
            info_View.frame.size.height =  380
            
            info_back_view.frame.size.height = 380
            
            info_scroll_View.frame.size.height =  331
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2+25
    
            
        }else if self.view.frame.size.width==375{
    
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
    
    
        }else{
    
            info_View.frame.origin.y = 68
    
        }

        lbl_infoHeader.text = "How to use Vastu Calculator"
        
        
        
        lbl_info.text = "• Stand in the center of the  property (Brahmasthaan) and orient yourself with a fixed direction with the help of the compass. And please put the phone parallel to the earth axis.\n\n• Room/Space name is displayed at the top of each page (e.g. Director Cabin). Also you can see the score regarding the direction of the place.\n\n• When you are using the Vastu Calculator, please ensure that you are not close to any Magnetic Field like Iron Beams / Columns / Metallic Furniture / Electric Fans / Magnets / Metals because it could interfere with the Magnetic North Readings. Please check that while using this Vastu Calculator on our App..the Magnetic Field should be less than 50uT.\n\n• On top of the screen, You will see the Score and also the Level of Vastu compliance. The Score will ascertain the level of Vastu Doshas or Vastu Perfection of your property.\n\n• You can check the Vastu Tips for the particular place by clicking \"Tips for this direction\" button for particular direction using compass.\n\n• You can select different Vastu places by clicking \"Evaluate other vastu places\" button.\n\n• To Initialize the Sensors, point your phone up towards the sky and move it in a figure 8 motion.";
        
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = NSTextAlignment.Justified
//        
//        let attributedString = NSAttributedString(string: sampleText,
//            attributes: [
//                NSParagraphStyleAttributeName: paragraphStyle,
//                NSBaselineOffsetAttributeName: NSNumber(float: 0)
//            ])
//
//        lbl_info.attributedText = attributedString
        
        lbl_info.sizeToFit()
        
        lbl_info.hidden = false
        
        moreTipesWebView.hidden = true
        
        if self.view.frame.size.width<768{
            
        
            
            lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+2
            
            infoApp_img.frame.origin.x = 5
            
          }
        
        
        info_red_img.frame.origin.x = (self.info_View.frame.size.width-info_red_img.frame.size.width)/2
        
        
        info_red_img.frame.origin.y = self.lbl_info.frame.origin.y+self.lbl_info.frame.size.height+15
        
        
        info_ok_btn.frame.origin.x = (self.info_View.frame.size.width-info_ok_btn.frame.size.width)/2
    
        info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
    
        
        navigation_view.userInteractionEnabled = false
        
        
        vastuTipes_View.userInteractionEnabled = false
        
        info_View.hidden = false
        
        
        if self.view.frame.size.width == 768 {
            
            infoApp_img.frame.origin.x = 15
            
            lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+10
        
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
            
        }
        
}
    
    func tapVstuKripa(){
        
         UIApplication.sharedApplication().openURL(NSURL(string: "http://www.vastukripa.com/")!)
        
    }

   func  register(){
        
        var passDict = [String:AnyObject]()
    
    if NSUserDefaults.standardUserDefaults().valueForKey("device_ID") != nil{
        
       var postString:String = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as! String
        
        postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
        
        let setUserID = NSUserDefaults.standardUserDefaults()
        
        setUserID.setValue(postString, forKey: "device_ID")
        
        let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as! String
        
         passDict = ["device_id":Device_id,"device_type":"IOS"]
    
        getConn.startConnectionWithString("pushDeviceId", httpMethodType:Post_Type, httpBodyType: passDict) { (recevedData) -> Void in
            
            
            if(self.getConn .responseCode() == 1){
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "register")
        
                
             }
        
         }

      }
    }
}

