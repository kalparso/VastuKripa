//
//  vastuCompassViewController.swift
//  VastuKripa
//
//  Created by Promatics on 1/8/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit
import CoreLocation
import QuartzCore
import Foundation
import CoreData
import CoreMotion

class vastuCompassViewController: UIViewController,CLLocationManagerDelegate,UIImagePickerControllerDelegate,UIWebViewDelegate {
    

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad) {
            
            interface = "ipad"
            
        }else{
            
            interface = "iphone"
        }
        
        moreTipesWebView.delegate = self
       
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        title_lbl.text = "Vastu Calculator Compass"
        
        title_lbl.frame.origin.x = (self.view.frame.size.width-title_lbl.frame.size.width)/2
        
        info_View.frame.origin.x = (self.view.frame.size.width - info_View.frame.size.width)/2
        
        if self.view.frame.size.height<1024{
        
        main_back_view.frame.size.width = self.view.frame.size.width
        
        main_back_view.frame.size.height = self.view.frame.size.height

        navigation_view.frame.size.width = self.view.frame.size.width
        
        score_lbl.frame.origin.x = self.view.frame.size.width/2-score_lbl.frame.size.width/2
       
        degree_lbl.frame.origin.x = self.view.frame.size.width/2-degree_lbl.frame.size.width/2
        
        moreTips_btn.frame.origin.x = self.view.frame.size.width/2-moreTips_btn.frame.size.width/2
        
        compass_img.frame.origin.x = self.view.frame.size.width/2-compass_img.frame.size.width/2
        
        
        compass_img.frame.origin.y = self.view.frame.size.height/2-compass_img.frame.size.height/2
            
        info_btn.frame.origin.x = self.navigation_view.frame.size.width-45
            
        }
        
        moreTips_btn.backgroundColor = navigation_view.backgroundColor
        
        moreTips_btn.layer.borderWidth = 2.0
        
        moreTips_btn.layer.borderColor = UIColor.whiteColor().CGColor
        
        info_ok_btn.layer.cornerRadius = 5.0
        
        info_ok_btn.backgroundColor = navigation_view.backgroundColor
        
        if self.view.frame.size.width<=375{
            
        compass_img.frame.origin.y = degree_lbl.frame.origin.y + degree_lbl.frame.size.height+10
            
           moreTips_btn.frame.origin.y = compass_img.frame.origin.y + compass_img.frame.size.height+30
        }
        

        place_title = (NSUserDefaults.standardUserDefaults().valueForKey("place") as? String)!
        
        moreTips_btn.layer.cornerRadius = 5.0
        
        info_View.hidden = true
        
//        if UIImagePickerController.isCameraDeviceAvailable(   UIImagePickerControllerCameraDevice.Front){
//            
//            // place_lbl.text = NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
//            
//            
//            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
//            
//           // imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Video
//            
//            
//            imagePicker.cameraOverlayView = main_back_view
//            
//            self.presentViewController(imagePicker, animated: true, completion: nil)
//        }
        
        
       
        // Do any additional setup after loading the view.
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
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        //var oldRad =  -manager.heading.trueHeading * M_PI / 180.0f
        
        //var newRad =  -newHeading.trueHeading * M_PI / 180.0f;
        
        let  M_PI = 3.14159265358979323846264338327950288
        
        let oldRad = manager.heading!.trueHeading*M_PI/180.0
        
        let newRad = newHeading.trueHeading * M_PI/180.0
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotateAnimation.fromValue = NSNumber(double: oldRad)
        
        rotateAnimation.toValue = NSNumber(double: newRad)
        
        rotateAnimation.duration = 0.01
        
        // compass_img.layer.addAnimation(rotateAnimation, forKey:"transform.rotation")
        
        //  let rotation_angle = CGFloat(newRad)
        
        // compass_img.transform = CGAffineTransformMakeRotation(rotation_angle)
        
        let mHeading = Float(newHeading.magneticHeading)
        
        //
        //valAccuracy =  motionManager.deviceMotion.magneticField.accuracy.value
        
        if motionManager.deviceMotionAvailable {
            
            // motionManager.deviceMotionUpdateInterval = 0.01
            
            motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
                data, error in
                
                let rotation = atan2(data!.gravity.x, data!.gravity.y) - M_PI
                self.compass_img.transform = CGAffineTransformMakeRotation(CGFloat(rotation))
                
//                var magnitude = self!.magnitudeFromAttitude(data.attitude)
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
//                self!.magneticField_lbl.text = NSString(format: "Magnetic Field %.0f µT", magnitude) as String
           
            
            
            })
        }
        
        let point = array_Points.count
        
        let tips = array_Points.count
        
        print(array_Points)
        
        print("point ")
        
        print(point)
        
        print(" tips ")

        print(tips)

        
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
            
            score_lbl.textColor = (UIColor .redColor())
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        }
        
        if 0<=str_Score && str_Score <= 3 {
            
            score_lbl.textColor = UIColor(red: 255, green: 150, blue: 50, alpha: 1)
            
            score_lbl.textColor = (UIColor .redColor())
            
            score_lbl.textColor = (UIColor .redColor())
            
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Very Major Vastu Dosha) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        } else if 6 == str_Score && str_Score == 7 {
            
            score_lbl.textColor = (UIColor .redColor())
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Minor Vastu Dosha) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        } else if str_Score == 8 {
            
            score_lbl.textColor = UIColor(red: 8, green: 103, blue: 13, alpha: 1)
            
            score_lbl.textColor = (UIColor .greenColor())
            
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        } else if str_Score == 9 {
            
            
            score_lbl.textColor = UIColor(red: 8, green: 103, blue: 13, alpha: 1)
            
            score_lbl.textColor = (UIColor .greenColor())
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Good Vastu Compliance) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        }else if str_Score == 9 {
            
            
            score_lbl.textColor = UIColor(red: 8, green: 103, blue: 13, alpha: 1)
            
            score_lbl.textColor = (UIColor .greenColor())
            
            score_lbl.text =  NSString(format: "Score: %d/10 \n(Excellent Vastu Compliance) ",str_Score ) as String
            
            score_lbl.text = place_title+"\n"+score_lbl.text!
            
            
        }
        
        score_lbl.text =  NSString(format: "Score: %d/10 \n(Excellent Vastu Compliance) ",str_Score ) as String
        
        score_lbl.text = place_title+"\n"+score_lbl.text!
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getVastuScore(){
        
        print("call")
        
        //Director's Cabin Temple/Poojasthan Kitchen Master's Bedroom Safe/Vault
        //Toilet Entrance Door
        
        
        if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Director's Cabin" {
                
                tap_place_btn = 6
                
                title_lbl.text = "Director's Cabin"
                
                score_lbl.text = "Director's Cabin"
                
                array_Points = [6,5,4,9,5,10,9,4]
                
        } else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Temple/Poojasthan" {
          
                tap_place_btn = 3
                
                title_lbl.text = "Temple/Poojasthan"
                
                  score_lbl.text = "Temple/Poojasthan"
                
                array_Points = [5,8,10,3,9,0,1,6]
                
        } else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Kitchen" {
                
                 tap_place_btn = 1
               
                title_lbl.text = "Kitchen"

                score_lbl.text = "Kitchen"
                
                array_Points = [8,4,0,5,5,3,8,10]
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Master's Bedroom" {
                
                
                tap_place_btn = 4
               
                 title_lbl.text = "Master's Bedroom"
                
                score_lbl.text = "Master's Bedroom"
                
                array_Points = [6, 5, 5, 9,4, 10,9,4]
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Safe/Vault" {
                
                 tap_place_btn = 7
                
                title_lbl.text = "Safe/Vault"

                score_lbl.text = "Safe/Vault"
                
                array_Points = [5,10,9,6,8,9, 5, 5]
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Toilet" {
                
                 tap_place_btn = 3
                
                title_lbl.text = "Toilet"

                score_lbl.text = "Toilet"
                
                array_Points = [10,2,0,8,2,2,6,4]
                
                
        }else if NSUserDefaults.standardUserDefaults().valueForKey("place") as? String
            == "Entrance Door" {
                
                 tap_place_btn = 5
                
                title_lbl.text = "Entrance Door"

                
                score_lbl.text = "Entrance Door"
                
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
                
                array_Tips = ["• North-West is the zone of Vayu, hence anything kept there will move fast. If the 'Tijori'(Vault/Safe)/Cash Drawer is kept in this zone, then the outflow of funds could be fast.\n\n• The vault, cash drawer, cupboard which contains cash, valuables and important documents should be installed at the Nairuti kona(South-West zone) of the room.\n\n• The cash drawer/vault(locker) should open towards the Uttar disha(North zone) ie. the direction of Lord Kuber Devtaji, so that Lord Kuber Devtaji aspects the locker at all times.\n\n• As a second best alternative the cash drawer/vault(locker) should open towards the Poorav disha(East zone).\n\n• Keep maximum Silver utensils etc in this North-West zone Tijori/Cupboard / Cash-Drawer.\n\n• Paint the locker in yellow or off white shade (from inside and outside). Avoid grey, black and blue painted vault (locker).\n\n• Install 'Lord Kuber's Divine Treasure Box' in your cash drawer/vault(locker). Lord Kuber Devta is the Lord of Wealth and He is the presiding Lord of the Uttar disha(Northern direction). It is believed that when Lord Kuber Devta is pleased, He showers His blessings on the Devotee and this comes in the shape of growth in business, finances and wealth. Lord Kuber Devta also opens up new avenues and opportunities leading to more sources of income. Lord Kuber Devta helps in removing the existing hindrances and speeds up the growth to 'Income' and 'Wealth'.\n\n• General attributes of North-West zone(Vayu Kona):\nNorth-West Ruled by: Lord Vayu(The God of Winds)\nNorth-West Ruled by: Moon Planet(Chandra/Shashi/Chaand)\nColor: White/Ivory White/Light Yellow.\nMantra to be recited: 'Om Shram Shrim Shrom Sah Chandramasey Namah'.\nGemstone: Pearl(Moti/Mukta)\nElement: Wind(Vayu Tatva).",
                    
                    
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
                
               // place_title = "Temple/Poojasthan"
                
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
                
                //place_title = "Toilet"
                
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
                
                //place_title = "Master's Bedroom"
                
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
                
               // place_title = "Entrance Door"
                
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
                
                //place_title = "Kitchen"
                
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
        
        
        if self.view.frame.size.height<568
        {
            
            info_View.frame.size.height = 400
            
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
            
        info_View.frame.origin.y = 65
        
        info_back_view.frame.size.height = info_View.frame.size.height-info_back_view.frame.origin.y
            
        moreTipesWebView.backgroundColor = UIColor.lightGrayColor()
            
        }
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
        
        info_View.hidden = false
        
        navigation_view.userInteractionEnabled = false
        
        lbl_info.hidden = true
        
        moreTipesWebView.hidden = false
        
        moreTipesWebView.backgroundColor = UIColor.darkGrayColor()
       
         info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
 
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
      
      // self.dismissViewControllerAnimated(false, completion: nil)
        
       self.navigationController?.popViewControllerAnimated(true)
    }
    
   
    @IBAction func tap_info_btn(sender: AnyObject) {
        
        if self.view.frame.size.height<568
        {
            
            info_View.frame.size.height = 400
            
        }
        
        lbl_infoHeader.text = "How to use Vastu Calculator"
        
        lbl_info.text = "• Stand in the center of the  property (Brahmasthaan) and orient yourself with a fixed direction with the help of the compass. And please put the phone parallel to the earth axis.\n\n• Room/Space name is displayed at the top of each page (e.g. Director Cabin). Also you can see the score regarding the direction of the place.\n\n• When you are using the Vastu Calculator, please ensure that you are not close to any Magnetic Field like Iron Beams / Columns / Metallic Furniture / Electric Fans / Magnets / Metals because it could interfere with the Magnetic North Readings. Please check that while using this Vastu Calculator on our App..the Magnetic Field should be less than 50uT.\n\n• On top of the screen, You will see the Score and also the Level of Vastu compliance. The Score will ascertain the level of Vastu Doshas or Vastu Perfection of your property.\n\n• You can check the Vastu Tips for the particular place by clicking \"Tips for this direction\" button for particular direction using compass.\n\n• You can select different Vastu places by clicking \"Evaluate other vastu places\" button.\n\n• To Initialize the Sensors, point your phone up towards the sky and move it in a figure 8 motion.";
        
        var frame = info_View.frame
        
        frame.origin.y = self.view.frame.size.height/2-info_View.frame.size.height/2
        
        info_View.frame=frame
        
        frame = lbl_infoHeader.frame
        
        frame.origin.x = (self.info_View.frame.size.width-lbl_infoHeader.frame.size.width)/2+2
        
        
        lbl_infoHeader.frame=frame
        
        
        lbl_info.sizeToFit()
        
        infoApp_img.frame.origin.x = 5
        
        info_lineView.frame.size.width = self.info_View.frame.width
        
        frame = info_lineView.frame
        
        frame.origin.x = 0;
        
        info_lineView.frame = frame
        
        frame = info_red_img.frame
        
        frame.origin.x = (self.info_View.frame.size.width-info_red_img.frame.size.width)/2
        
        info_red_img.frame=frame
        
        info_red_img.frame.origin.y = self.lbl_info.frame.origin.y+self.lbl_info.frame.size.height+15
        
        frame = info_ok_btn.frame
        
        frame.origin.x = (self.info_View.frame.size.width-info_ok_btn.frame.size.width)/2
        
        info_ok_btn.frame=frame
        
        info_ok_btn.frame.origin.y = self.info_red_img.frame.origin.y+self.info_red_img.frame.size.height+15
        
        
        info_back_view.frame.size.height = info_View.frame.size.height-info_back_view.frame.origin.y
        
        
        info_scroll_View.contentSize = CGSize(width:self.info_View.frame.size.width, height:info_ok_btn.frame.origin.y+info_ok_btn.frame.size.height+10)
        
        info_View.hidden = false
        
       navigation_view.userInteractionEnabled = false
        
        lbl_info.hidden = false
        
        moreTipesWebView.hidden = true
        
        moreTipesWebView.backgroundColor = UIColor.darkGrayColor()
       
        info_View.frame.origin.y = (self.view.frame.size.height - info_View.frame.size.height)/2
        
    }
    
    @IBAction func tapInfo_hide_btn(sender: AnyObject) {
        
        moreTipesWebView.frame.size.height = 72
        
        info_View.hidden = true
        
        navigation_view.userInteractionEnabled = true
        
    }
}
