//
//  vastuCompassViewController.swift
//  VastuKripa
//
//  Created by Promatics on 1/8/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class vastuCompassViewController: UIViewController,CLLocationManagerDelegate,UIImagePickerControllerDelegate,UIWebViewDelegate {
    
    @IBOutlet weak var magnetic_view: UIView!
    @IBOutlet weak var usage_Info: UIButton!
    @IBOutlet weak var demo_video: UIButton!
    @IBOutlet weak var kitchen_btn: UIButton!
    @IBOutlet weak var info_Btn: UIButton!
    @IBOutlet weak var temple_btn: UIButton!
    @IBOutlet weak var toilet_btn: UIButton!
    
    @IBOutlet weak var badroom_btn: UIButton!
    
    @IBOutlet weak var door_btn: UIButton!
    
    @IBOutlet weak var dirCabin_btn: UIButton!
    
    @IBOutlet weak var vastuTipes_View: UIView!
    
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var main_back_view: UIView!
    
    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var compass_img: UIImageView!
    
    @IBOutlet weak var score_lbl: UILabel!
    
    @IBOutlet weak var degree_lbl: UILabel!
    
    @IBOutlet weak var moreTips_btn: UIButton!
    
    @IBOutlet weak var useInfo_view: UIView!
    
    @IBOutlet weak var info_View: UIView!
    
    @IBOutlet weak var info_back_view: UIView!
    
    @IBOutlet weak var info_scroll_View: UIScrollView!
    
    @IBOutlet weak var infoApp_img: UIImageView!
    
    @IBOutlet weak var lbl_infoHeader: UILabel!
    
    @IBOutlet weak var info_lineView: UIView!
    
    @IBOutlet weak var info_red_img: UIImageView!
    
    @IBOutlet weak var lbl_info: UILabel!
    
    @IBOutlet weak var info_ok_btn: UIButton!
    
    var mHeading:Float!
    
    var place_btn_hieght = CGFloat(35)
    
    var moreTipsPress = 0
    
    let locationManager = CLLocationManager()
    
    let motionManager = CMMotionManager()
    
    let imagePicker = UIImagePickerController()
    
    var directions = ""
    
    var str_Score = 6
    
    var str_tips = ""
    
    var place_title = ""
    
    var array_Points = [0,0,0,0,0,0,0,0]
    
    var array_Tips = ["","","","","","","",""]
    
    var compassStart = 0
    
    var interface = ""
    
    var request: NSURLRequest!
    
    var url : NSURL!
    
    @IBOutlet weak var moreTipesWebView: UIWebView!
    var tap_place_btn = 0
    
    var tap_place_index = 0
    
    var showMagneticPopUp = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magnetic_view.hidden = true
        
        magnetic_view.frame.origin.x = self.view.frame.size.width/2-magnetic_view.frame.size.width/2
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            interface = "ipad"
            
            magnetic_view.layer.borderWidth = 3
            
            magnetic_view.layer.borderColor = UIColor.darkGrayColor().CGColor
            
        }else{
            
            interface = "iphone"
            
            magnetic_view.layer.borderWidth = 2
            
            magnetic_view.layer.borderColor = UIColor.darkGrayColor().CGColor
            
        }
        if self.view.frame.size.width == 414{
            
            //bellBtn.frame.origin.x = self.view.frame.size.width-bellBtn.frame.size.width - 20
            
            compass_img.frame.size.height = 380
            
            compass_img.frame.size.width = 380
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
            
            
            moreTips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+30
            
        }
        
        moreTipesWebView.delegate = self
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        
        title_lbl.text = "Temple/Poojasthan"
        
        title_lbl.frame.origin.x = (self.view.frame.size.width-title_lbl.frame.size.width)/2+2
        
        info_View.frame.origin.x = self.view.frame.size.width/2-info_View.frame.size.width/2
        
        if self.view.frame.size.width==375{
            
            compass_img.frame.size.width = 290
            
            compass_img.frame.size.height = 290
            
        }else if self.view.frame.size.height<568{
            
            compass_img.frame.size.width = 180
            
            compass_img.frame.size.height = 180
            
        }
        info_View.frame.origin.y = 68
        
        if self.view.frame.size.height<1024{
            
            main_back_view.frame.size.width = self.view.frame.size.width
            
            main_back_view.frame.size.height = self.view.frame.size.height
            
            navigation_view.frame.size.width = self.view.frame.size.width
            
            score_lbl.frame.origin.x = self.view.frame.size.width/2-score_lbl.frame.size.width/2
            
            degree_lbl.frame.origin.x = self.view.frame.size.width/2-degree_lbl.frame.size.width/2
            
            moreTips_btn.frame.origin.x = self.view.frame.size.width/2-moreTips_btn.frame.size.width/2
            
            compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
            
            
            compass_img.frame.origin.y = self.view.frame.size.height/2-compass_img.frame.size.height/2
            
        }
        
        moreTips_btn.backgroundColor = navigation_view.backgroundColor
        
        moreTips_btn.layer.borderWidth = 2.0
        
        moreTips_btn.layer.borderColor = UIColor.whiteColor().CGColor
        
        info_ok_btn.layer.cornerRadius = 5.0
        
        info_ok_btn.backgroundColor = navigation_view.backgroundColor
        
        if self.view.frame.size.width<=375{
            
            compass_img.frame.origin.y = degree_lbl.frame.origin.y + degree_lbl.frame.size.height+10
            
            moreTips_btn.frame.origin.y = compass_img.frame.origin.y + compass_img.frame.size.height+38
        }
        
        place_title = (NSUserDefaults.standardUserDefaults().valueForKey("place") as? String)!
        
        moreTips_btn.layer.cornerRadius = 5.0
        
        info_View.hidden = true
        
        if self.view.frame.size.width == 320{
            
            moreTips_btn.frame.origin.y =  moreTips_btn.frame.origin.y+5
            
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
            
        }
        
        if self.view.frame.size.width==375{
            
            
            compass_img.frame.origin.y = degree_lbl.frame.origin.y+degree_lbl.frame.size.height+20
            
            moreTips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+70
            
        }else if self.view.frame.size.height<568{
            
            moreTips_btn.frame.origin.y = compass_img.frame.origin.y+compass_img.frame.size.height+10
        }
        
        vastuTipes_View.frame.origin.y = self.view.frame.size.height-vastuTipes_View.frame.size.height
        
        if self.view.frame.size.height<568{
            
            demo_video.frame.origin.x = 20
            
            usage_Info.frame.origin.x = self.view.frame.size.width-demo_video.frame.size.width-20
            
            demo_video.frame.origin.y = moreTips_btn.frame.origin.y-demo_video.frame.size.height-10
            
            usage_Info.frame.origin.y = moreTips_btn.frame.origin.y-demo_video.frame.size.height-10
            
        }else{
            
            
            demo_video.frame.origin.x = moreTips_btn.frame.origin.x
            
            usage_Info.frame.origin.x = moreTips_btn.frame.origin.x+moreTips_btn.frame.size.width-usage_Info.frame.size.width
            
            if self.view.frame.size.height==1024{
                
                demo_video.frame.origin.y = moreTips_btn.frame.origin.y-demo_video.frame.size.height-20
                
                usage_Info.frame.origin.y = moreTips_btn.frame.origin.y-demo_video.frame.size.height-20
                
            }else{
                
                demo_video.frame.origin.y = moreTips_btn.frame.origin.y-demo_video.frame.size.height-12
                
                usage_Info.frame.origin.y = moreTips_btn.frame.origin.y-demo_video.frame.size.height-12
                
            }
        }
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        getVastuScore()
        
        main_back_view.backgroundColor = (UIColor .clearColor())
        
        locationManager.startUpdatingHeading()
        
        motionManager.startGyroUpdates()
        
        score_lbl.text = "Temple/Poojasthan\nScore:5/10\n (Major Vastu Dosha"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
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
            
            tap_place_index = 1
            
            str_Score = array_Points[1]
            
            str_tips = array_Tips[1] as String
            
            directions = "in North"
            
            degree_lbl.text = NSString(format: "%.0f° N", mHeading) as String
            
            
        } else if (mHeading > 23) && (mHeading <= 68) {
            
            tap_place_index = 2
            
            str_Score =  array_Points[2]
            
            str_tips = array_Tips[2] as String
            
            directions = "in North-East"
            
            degree_lbl.text = NSString(format: "%.0f° NE", mHeading) as String
            
            
        } else if (mHeading > 69) && (mHeading <= 113) {
            
            tap_place_index = 4
            
            str_Score = array_Points[4]
            
            str_tips = array_Tips[4] as String
            
            directions="in East"
            
            degree_lbl.text = NSString(format: "%.0f° E", mHeading) as String
            
        } else if (mHeading) > 114 && (mHeading) <= 158 {
            
            tap_place_index = 7
            
            str_Score =  array_Points[7]
            
            str_tips = array_Tips[7] as String
            
            directions = "in South-East"
            
            degree_lbl.text = NSString(format: "%.0f° SE", mHeading) as String
            
        } else if (mHeading > 159) && (mHeading <= 203) {
            
            tap_place_index = 6
            
            str_Score = array_Points[6]
            
            str_tips = array_Tips[6] as String
            
            directions = "in South"
            
            degree_lbl.text = NSString(format: "%.0f° S", mHeading) as String
            
        } else if (mHeading > 204) && (mHeading <= 248) {
            
            tap_place_index = 5
            
            str_Score = array_Points[5]
            
            str_tips = array_Tips[5] as String
            
            directions = "in South-West"
            
            degree_lbl.text = NSString(format: "%.0f° SW", mHeading) as String
            
        } else if (mHeading > 249) && (mHeading <= 293) {
            
            tap_place_index = 3
            
            str_Score = array_Points[3]
            
            str_tips = array_Tips[3] as String
            
            directions = "in Direction"
            
            degree_lbl.text = NSString(format: "%.0f° W", mHeading) as String
            
        } else if(mHeading > 294) && (mHeading <= 338){
            
            tap_place_index = 0
            
            str_Score = array_Points[0]
            
            str_tips = array_Tips[0] as String
            
            directions = "in North-West"
            
            degree_lbl.text = NSString(format: "%.0f° NW", mHeading) as String
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        } else if 6 == str_Score && str_Score == 7 {
            
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Minor Vastu Dosha) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        } else if str_Score == 8 {
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        } else if str_Score == 9 {
            
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        }else if str_Score == 10 {
            
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Excellent Vastu Compliance) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        }
        
        }
    }
    
    func getVastuScore() {
        
        tap_place_btn = 2
        
        place_title = "Temple/Poojasthan"
        
        array_Points = [5,8,10,3,9,0,1,6]
        
    }
    
    
    
    @IBAction func tapTips_btn(sender: AnyObject) {
        
        moreTipsPress = 1
        
        if tap_place_btn == 1 {
            
            if tap_place_index == 0 {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index00", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index11", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 2 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index22", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 3 {
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index33", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index44", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index55", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kitchen_index66", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 7 {
                
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
            
            if tap_place_index == 0 {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index00", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index11", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 2 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index22", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 3 {
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index33", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index44", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index55", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("temple_index66", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 7 {
                
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
            
            if tap_place_index == 0 {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index00", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index11", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 2 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index22", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 3 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index33", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index44", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index55", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("toilet_index66", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 7 {
                
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
            
            if tap_place_index == 0 {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index00", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index11", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 2 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index22", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 3 {
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index33", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index44", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index55", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("bedroom_index66", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 7 {
                
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
            
            if tap_place_index == 0 {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index00", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index11", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 2 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index22", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 3 {
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index33", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index44", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index55", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("door_index66", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 7 {
                
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
            
            
            
            if tap_place_index == 0 {
                
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index00", ofType:"html")!)
                }
                
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index11", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 2 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index22", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 3 {
                
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index33", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index44", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index55", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index66", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 7 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index7", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dircabin_index77", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            }
            
            lbl_infoHeader.text = "Director's Cabin "+directions
        }
        
        if tap_place_btn == 7 {
            
            
            if tap_place_index == 0 {
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index0", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index00", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 1 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index1", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index11", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 2 {
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index2", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index22", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 3 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index3", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index33", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 4 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index4", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index44", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
            } else if tap_place_index == 5 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index5", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index55", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
            } else if tap_place_index == 6 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index6", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index66", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                
                moreTipesWebView.loadRequest(request)
                
                
                
            } else if tap_place_index == 7 {
                
                if interface == "iphone"{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index7", ofType:"html")!)
                    
                }else{
                    
                    url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("safe:vault_index77", ofType:"html")!)
                }
                request = NSURLRequest(URL: url!)
                moreTipesWebView.loadRequest(request)
                
            }
            
            lbl_infoHeader.text = "Safe/Vastu "+directions
        }
        
        info_View.frame.origin.y = self.view.frame.size.height/2-info_View.frame.size.height/2
        
        lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+2
        
        lbl_info.text = str_tips
        
        lbl_info.sizeToFit()
        
        infoApp_img.frame.origin.x = 5
        
        info_lineView.frame.size.width = self.info_View.frame.width
        
        info_lineView.frame.origin.x = 0;
        
        info_red_img.frame.origin.x = (self.info_View.frame.size.width-info_red_img.frame.size.width)/2
        
        info_red_img.frame.origin.y = self.lbl_info.frame.origin.y+self.lbl_info.frame.size.height+15
        
        
        info_ok_btn.frame.origin.x = (self.info_View.frame.size.width-info_ok_btn.frame.size.width)/2
        
        info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
        
        if self.view.frame.size.width == 768{
            
            info_View.frame.origin.y = 68
            
            moreTipesWebView.backgroundColor = UIColor.lightGrayColor()
            
        }
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
        
        info_View.hidden = false
        
        lbl_info.hidden = true
        
        moreTipesWebView.hidden = false
        
        moreTipesWebView.backgroundColor = UIColor.darkGrayColor()
        
        if self.view.frame.size.height<568{
            
            info_View.frame.size.height =  380
            380
            info_back_view.frame.size.height = 330
            
            info_scroll_View.frame.size.height = 326
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2+25
            
            
        }else if self.view.frame.size.width==375{
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
            
        }else{
            
            info_View.frame.origin.y = 68
        }
        
        if self.view.frame.size.width == 768 {
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2-15
            
            infoApp_img.frame.origin.x = 15
            
            
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
    
    
    @IBAction func back_btn(sender: AnyObject) {
        
        
        locationManager.stopUpdatingHeading()
        
        locationManager.stopUpdatingLocation()
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    @IBAction func tap_info_btn(sender: AnyObject) {
        
        if self.view.frame.size.height<568
        {
            
            info_View.frame.size.height = 400
            
        }
        lbl_info.frame.size.width = info_scroll_View.frame.size.width-30
        
        info_View.hidden = false
        
        if self.view.frame.size.height<568{
            
            info_View.frame.size.height =  380
            
            380
            info_back_view.frame.size.height = 330
            
            info_scroll_View.frame.size.height = 326
            
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
            
            info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2-15
            
            infoApp_img.frame.origin.x = 15
            
            lbl_infoHeader.frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+10
            
        }
        
    }
    
    @IBAction func tapInfo_hide_btn(sender: AnyObject) {
        
        moreTipesWebView.frame.size.height = 72
        
        info_View.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
        vastuTipes_View.userInteractionEnabled = true
        
    }
    
    @IBAction func tapKitchen_btn(sender: AnyObject) {
        
        place_title = "Kitchen"
        
        updateLocation()
        
        
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
        
        
        title_lbl.text = "Kitchen"
        
        array_Points = [8,4,0,5,5,3,8,10]
        
        if showMagneticPopUp == 1 {
            
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                moreTips_btn.userInteractionEnabled = false
                
                usage_Info.userInteractionEnabled = false
                
                demo_video.userInteractionEnabled = false
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
        }
        
    }
    
    
    @IBAction func tapTemple_btn(sender: AnyObject) {
        
        place_title = "Temple/Poojasthan"
        
        updateLocation()
        
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
        
        
        title_lbl.text = "Temple/Poojasthan"
        
        array_Points = [5,8,10,3,9,0,1,6]
        
        if showMagneticPopUp == 1 {
            
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                moreTips_btn.userInteractionEnabled = false
                
                usage_Info.userInteractionEnabled = false
                
                demo_video.userInteractionEnabled = false
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
        }
        
        
        
    }
    
    @IBAction func tapToilet_btn(sender: AnyObject) {
        
        place_title = "Toilet"
        
        updateLocation()
        
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
        
        
        title_lbl.text = "Toilet"
        
        array_Points = [10,2,0,8,2,2,6,4]
        
        if showMagneticPopUp == 1 {
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                moreTips_btn.userInteractionEnabled = false
                
                usage_Info.userInteractionEnabled = false
                
                demo_video.userInteractionEnabled = false
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
        }
        
        
    }
    
    @IBAction func tapBedroom_btn(sender: AnyObject) {
        
        place_title = "Master Bedroom"
        
        updateLocation()
        
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
        
        title_lbl.text = "Master Bedroom"
        
        
        array_Points = [6, 5, 5, 9,4, 10,9,4]
        
        
        if showMagneticPopUp == 1 {
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                moreTips_btn.userInteractionEnabled = false
                
                usage_Info.userInteractionEnabled = false
                
                demo_video.userInteractionEnabled = false
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
        }
        
    }
    
    @IBAction func tapDoor_btn(sender: AnyObject) {
        
        place_title = "Entrance Door"
        
        updateLocation()
        
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
            
            dirCabin_btn.backgroundColor = UIColor.lightGrayColor()
        }
        
        tap_place_btn = 5
        
        title_lbl.text = "Entrance Door"
        
        array_Points = [6,10,10,5,10,0,3,6]
        
        if showMagneticPopUp == 1 {
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                moreTips_btn.userInteractionEnabled = false
                
                usage_Info.userInteractionEnabled = false
                
                demo_video.userInteractionEnabled = false
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
        }
        
        
    }
    
    @IBAction func tapDirCabin_btn(sender: AnyObject) {
        
        place_title = "Director's Cabin"
        
        updateLocation()
        
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
        
        title_lbl.text = "Director's Cabin"
        
        array_Points = [6,5,4,9,5,10,9,4]
        
        if showMagneticPopUp == 1 {
            
            let magnetic = NSUserDefaults.standardUserDefaults().boolForKey("magnetic")
            
            if magnetic == false{
                
                magnetic_view.hidden = false
                
                magnetic_view.frame.origin.y = self.view.frame.size.height/2-magnetic_view.frame.height/2
                
                navigation_view.userInteractionEnabled = false
                
                moreTips_btn.userInteractionEnabled = false
                
                usage_Info.userInteractionEnabled = false
                
                demo_video.userInteractionEnabled = false
                
                vastuTipes_View.userInteractionEnabled = false
                
            }
            
        }
    }
    
    
    @IBAction func tapMagnetic_ok_btn(sender: AnyObject) {
        
        magnetic_view.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
        vastuTipes_View.userInteractionEnabled = true
        
        moreTips_btn.userInteractionEnabled = true
        
        usage_Info.userInteractionEnabled = true
        
        demo_video.userInteractionEnabled = true
        
    }
    
    
    @IBAction func tapMag_dontShow_btn(sender: AnyObject) {
        
        navigation_view.userInteractionEnabled = true
        
        vastuTipes_View.userInteractionEnabled = true
        
        moreTips_btn.userInteractionEnabled = true
        
        usage_Info.userInteractionEnabled = true
        
        demo_video.userInteractionEnabled = true
        
        showMagneticPopUp = 0
        
        magnetic_view.hidden = true
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(1, forKey: "magnetic")
        
    }
    
    
    @IBAction func tap_video_btn(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://youtube.com")!)
        
    }
    
}
