//
//  homeViewController.swift
//  VastuKripa
//
//  Created by promatics on 12/17/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//CoreLocation/CoreLocation.h

import UIKit
import CoreLocation
import CoreMotion


class homeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,NSURLConnectionDelegate, NSXMLParserDelegate,CLLocationManagerDelegate,UIImagePickerControllerDelegate,UIWebViewDelegate,UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var main_magnatic_view: UIView!
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
    
    var mHeading:Float!
    
    var documentPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         //print(self.view.frame.size.width)
        
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "checkNotiction")
        
        pushCountLbl.hidden = true
        
        pushCountLbl.layer.cornerRadius = pushCountLbl.frame.size.width/2
        
        pushCountLbl.layer.masksToBounds = true
        
        pushCountLbl.backgroundColor = UIColor.redColor()
        
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
            
            magnetic_view.layer.borderWidth = 3
            
            magnetic_view.layer.borderColor = UIColor.darkGrayColor().CGColor
            
            
        } else {
            
            size = -245
            
            interface = "iphone"
            
            magnetic_view.layer.borderWidth = 2
            
            magnetic_view.layer.borderColor = UIColor.darkGrayColor().CGColor
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
        
        print(success)
        
        let fileManager = NSFileManager.defaultManager()
        
        success = (fileManager.fileExistsAtPath(databasePath))
        
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        info_lineView.frame.size.width = info_scroll_View.frame.size.width-1
        
        info_lineView.frame.origin.x = info_scroll_View.frame.origin.x+1
        
        
        if self.view.frame.size.width == 414{
            
            bellBtn.frame.origin.x = self.view.frame.size.width-bellBtn.frame.size.width - 20
            
            pushCountLbl.frame.origin.x = bellBtn.frame.origin.x+10
            
            compass_img.frame.size.height = 380
            
            compass_img.frame.size.width = 380
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
            
        }
        
        if self.view.frame.width == 375{
            
            
            bellBtn.frame.origin.x =  self.view.frame.size.width-bellBtn.frame.size.width-18
            
            pushCountLbl.frame.origin.x = bellBtn.frame.origin.x+10
            
            
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
            
            compass_img.frame.size.height = 300
            
            compass_img.frame.size.width = 300
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
            
            place_btn_hieght = CGFloat(35)
            
            more_tips_btn.frame.size.height = 38
            
            more_tips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+13
            
            vastuTipes_View.frame.origin.y = more_tips_btn.frame.origin.y+more_tips_btn.frame.size.height+10
            
        }else if self.view.frame.size.height < 568{
            
            place_btn_hieght = CGFloat(30)
            
        }
        
        if  (self.view.frame.size.width != 768){
            
            main_scrollView.frame.origin.y = 55
            
            main_scrollView.frame.size.height = self.view.frame.size.height-55
            
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
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBarHidden = true
        
      
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
            
            if UIImagePickerController.isCameraDeviceAvailable(   UIImagePickerControllerCameraDevice.Front){
                
            }
            
            main_back_view.backgroundColor = (UIColor .clearColor())
            
            vastuTipes_View.backgroundColor = (UIColor .clearColor())
            
            
            degree_lbl.hidden = false
            
            more_tips_btn.hidden = false
            
            locationManager.startUpdatingHeading()
            
            motionManager.startGyroUpdates()
            
        }
        
        locationManager.startUpdatingHeading()
        
        motionManager.startGyroUpdates()
        
    }
    
    @objc func getRemoteDict(getNoti:NSNotification) {
        
        
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
            
            passDict = ["device_id":Device_id,"status":"0"]
            
            vastuTipsConn.startConnectionWithString("tipCountList", httpMethodType:Post_Type, httpBodyType:passDict) { (receivedData) -> Void in
                
                
                if self.vastuTipsConn.responseCode() == 1{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData!
                    
                    self.pushCountLbl.hidden = false
                    
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
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
    }
    
    func magnitudeFromAttitude(attitude: CMAttitude) -> Double {
        
        return sqrt(pow(attitude.roll, 2) + pow(attitude.yaw, 2) + pow(attitude.pitch, 2))
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        let  M_PI = 3.14159265358979323846264338327950288
        
        let oldRad:Float = Float(-manager.heading!.trueHeading*M_PI/180.0)
        
        let newRad:Float =  Float(-newHeading.trueHeading * M_PI/180.0)
        
        
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotateAnimation.fromValue = NSNumber(float: oldRad)
        
        rotateAnimation.toValue = NSNumber(float: newRad)
        
        rotateAnimation.duration = 0.5
        
        self.compass_img.layer.addAnimation(rotateAnimation, forKey: "animateMyRotation")
        
        self.compass_img.transform = CGAffineTransformMakeRotation(CGFloat(newRad))
        
        mHeading = Float(newHeading.magneticHeading)
        
        updateLocation()
        
    }
    
    func updateLocation(){
        
        if mHeading != nil{
        
        if (mHeading >= 339) || (mHeading <= 22){
            
            tap_place_btn_index = 1
            
            str_Score = array_Points[1]
            
            str_tips = array_Tips[1] as String
            
            directions = "in North"
            
            degree_lbl.text = NSString(format: "%.0f° N", mHeading) as String
            
            
        } else if (mHeading > 23) && (mHeading <= 68) {
            
            tap_place_btn_index = 2
            
            str_Score =  array_Points[2]
            
            str_tips = array_Tips[2] as String
            
            directions = "in North-East"
            
            degree_lbl.text = NSString(format: "%.0f° NE", mHeading) as String
            
            
        } else if (mHeading > 69) && (mHeading <= 113) {
            
            tap_place_btn_index = 4
            
            str_Score = array_Points[4]
            
            str_tips = array_Tips[4] as String
            
            directions="in East"
            
            degree_lbl.text = NSString(format: "%.0f° E", mHeading) as String
            
        } else if (mHeading) > 114 && (mHeading) <= 158 {
            
            tap_place_btn_index = 7
            
            str_Score =  array_Points[7]
            
            str_tips = array_Tips[7] as String
            
            directions = "in South-East"
            
            degree_lbl.text = NSString(format: "%.0f° SE", mHeading) as String
            
        } else if (mHeading > 159) && (mHeading <= 203) {
            
            tap_place_btn_index = 6
            
            str_Score = array_Points[6]
            
            str_tips = array_Tips[6] as String
            
            directions = "in South"
            
            degree_lbl.text = NSString(format: "%.0f° S", mHeading) as String
            
        } else if (mHeading > 204) && (mHeading <= 248) {
            
            tap_place_btn_index = 5
            
            str_Score = array_Points[5]
            
            str_tips = array_Tips[5] as String
            
            directions = "in South-West"
            
            degree_lbl.text = NSString(format: "%.0f° SW", mHeading) as String
            
        } else if (mHeading > 249) && (mHeading <= 293) {
            
            tap_place_btn_index = 3
            
            str_Score = array_Points[3]
            
            str_tips = array_Tips[3] as String
            
            directions = "in Direction"
            
            degree_lbl.text = NSString(format: "%.0f° W", mHeading) as String
            
        } else if(mHeading > 294) && (mHeading <= 338){
            
            tap_place_btn_index = 0
            
            str_Score = array_Points[0]
            
            str_tips = array_Tips[0] as String
            
            directions = "in North-West"
            
            degree_lbl.text = NSString(format: "%.0f° NW", mHeading) as String
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        } else if 6 == str_Score && str_Score == 7 {
            
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Minor Vastu Dosha) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        } else if str_Score == 8 {
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        } else if str_Score == 9 {
            
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
        }else if str_Score == 10 {
            
            
            scope_lbl.text =  NSString(format: "Score: %d/10 \n(Excellent Vastu Compliance) ",str_Score ) as String
            
            scope_lbl.text = place_title+"\n"+scope_lbl.text!
            
            
         }
        
        }
    }
    
    
    @IBAction func tapMenu_list_btn(sender: AnyObject) {
        
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
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
                
                cell.icon_img.image = UIImage(named: "logo")
                
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
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2-40
            
            //info_View.frame.origin.y = scope_lbl.frame.origin.y
            
        }
        
        
        
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        moreTipesWebView.sizeToFit()
        
        info_red_img.frame.origin.x = (info_View.frame.size.width-info_red_img.frame.size.width)/2
        
        info_red_img.frame.origin.y = moreTipesWebView.frame.origin.y+moreTipesWebView.frame.size.height+10
        
        info_ok_btn.frame.origin.x = (info_View.frame.size.width-info_ok_btn.frame.size.width)/2
        
        info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
        
        
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
    
    
    @IBAction func info_hide_btn(sender: AnyObject) {
        
        main_scrollView.userInteractionEnabled = true
        
        moreTipesWebView.frame.size.height = 72
        
        info_View.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
        vastuTipes_View.userInteractionEnabled = true
    }
    
    @IBAction func tapKitchen_btn(sender: AnyObject) {
        
        
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
        
        updateLocation()
        
        if showMagneticPopUp == 1  {
            
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                main_scrollView.userInteractionEnabled  = false
                
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
            
            updateLocation()
            
            array_Points = [5,8,10,3,9,0,1,6]
            
            if showMagneticPopUp == 1 {
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
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
            
            updateLocation()
            
            array_Points = [10,2,0,8,2,2,6,4]
            
            
            
            if showMagneticPopUp == 1 {
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
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
        
        updateLocation()
        
        array_Points = [6, 5, 5, 9,4, 10,9,4]
        
        
        
        if showMagneticPopUp == 1 {
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
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
            
            updateLocation()
            
            array_Points = [6,10,10,5,10,0,3,6]
            
            
            
            if showMagneticPopUp == 1 {
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
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
            
            updateLocation()
            
            array_Points = [6,5,4,9,5,10,9,4]
            
            
            if showMagneticPopUp == 1 {
                
                let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
                
                
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
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2-40
            
            // info_View.frame.origin.y = scope_lbl.frame.origin.y+5
            
        }
        
    }
    
    func tapVstuKripa(){
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.vastukripa.com/")!)
        
    }
    
}

