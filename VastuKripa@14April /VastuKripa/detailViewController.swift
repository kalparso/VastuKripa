//
//  detailViewController.swift
//  
//
//  Created by Apple on 04/02/16.
//
//

import UIKit
import CoreData


class detailViewController: UIViewController , UIWebViewDelegate{

    @IBOutlet weak var addtoCard_btn: UIButton!
    @IBOutlet weak var scrool_view: UIScrollView!
    
    @IBOutlet weak var description_webview: UIWebView!
    @IBOutlet weak var subdetail: UILabel!
    @IBOutlet weak var line_view: UIView!
    
    @IBOutlet weak var product_img: UIImageView!
    
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var name_lbl: UILabel!
    
    @IBOutlet weak var desc_lbl: UILabel!
    
    @IBOutlet weak var detail_lbl: UILabel!
    
    @IBOutlet weak var price_lbl: UILabel!
    
    @IBOutlet weak var product_activity_indicator: UIActivityIndicatorView!
    
     var index = 0
    
    var numberArray:[Int] = []
    
    var quantity_data = [0,0,0,0,0,0,0,0,0]
    
    var passed_value_array  = []
    
    var passed_value = [String():[]]
    
    var product_id : Int!
    
    var tag = 0
    
    var product_data  = [
        
        "Img":[
            "product_1_detail",
            "product_8_detail",
            "product_3_detail",
            "product_5_detail",
            "product_2_detail",
            "product_10_detail",
            "product_7_detail",
            "product_9_detail"],
        
        "name":[
            "Divine Connect Vedic Yantra Frame",
            "Kuber Devta Yantra Kit",
            "Vastu Vitalizer Pyramid",
            "Power Grid Stick",
            "Happy Relationship Yantra",
            "Toilet Rectifier Kit",
            "Ek Onkar Symbol","Vastu Energizer For Flooring"],
        
        
        "desc":[
            "Exceptional Wooden Frame with Shree Yantra, Kuber Yantra, Navgrah Yantra & Vastu Yantra.",
            "Powerful Kuber Yantra, Ganga Jal Spray bottle, Key Chain in complete kit",
            "Energizes the Environment and reduces the Vastu doshas negativity.",
            "Helps to rectify 'missing corner' Vastu doshas and also energize the bedroom.",
            "For peace, love, harmony.",
            "Rectifies the Vastu Doshas of Toilets which are not correctly located as per Vastu.",
            "Symbol to Safeguard your permises."
        ],
        
        "price":[
            "2320.00",
            "1260.00",
            "880.00",
            "1960.00",
            "2150.00",
            "1560.00",
            "300.00",
            "Rs.1114.00"
        ]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addtoCard_btn.hidden = true
        
        product_activity_indicator.hidden = true
    
        product_activity_indicator.frame.origin.x = self.view.frame.size.width/2 - product_activity_indicator.frame.size.width/2
        
        product_activity_indicator.frame.origin.y = self.view.frame.size.height/2 - product_activity_indicator.frame.size.height/2
        
        product_img.layer.borderWidth = 2
        
        product_img.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        navigation_title.text = "Vastu Products"
        
        navigation_title.frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        addtoCard_btn.frame.origin.x = (self.view.frame.size.width - addtoCard_btn.frame.size.width)/2
        
        addtoCard_btn.layer.cornerRadius = 5
        
        if self.view.frame.size.height<=568{
            
            product_img.frame.size.width = 170
            
            product_img.frame.size.height = 170
            
        }
        
        product_img.frame.origin.x = (self.view.frame.size.width - product_img.frame.size.width)/2
        
        name_lbl.frame.origin.x = (self.view.frame.size.width - name_lbl.frame.size.width)/2+3
    
        
        line_view.frame.size.width = self.view.frame.width
        
        index = NSUserDefaults.standardUserDefaults().valueForKey("zero") as! Int
        
        tag = index

        switch index{
        
        case 0 :
 
            product_img.image = UIImage(named: product_data["Img"]![0])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10

            name_lbl.text = product_data["name"]![0]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![0]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            if self.view.frame.size.height<1024{
            
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("divineConnect", ofType:"html")!)
            
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
           
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("divineConnect_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                

            }
            
            
            break
            
            
        case 1 :
            
            product_img.image = UIImage(named: product_data["Img"]![1])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![1]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![1]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            

            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kit", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kit_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
        case 2 :
            
            product_img.image = UIImage(named: product_data["Img"]![2])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![2]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![2]
            
            price_lbl.sizeToFit()
            
             price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
           
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuVitalizer", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuVitalizer_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            

            break
            
        case 3 :
            
            
            product_img.image = UIImage(named: product_data["Img"]![3])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![3]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![3]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("gridStick", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("gridStick_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            
            break
            
        case 4:
            
            product_img.image = UIImage(named: product_data["Img"]![4])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![4]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![4]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("happyRelationshipYantra", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("happyRelationshipYantra_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }


            
            
            break
            
        case 5:
            
            product_img.image = UIImage(named: product_data["Img"]![5])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![5]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            
            price_lbl.text = product_data["price"]![5]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
             description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height+10
            
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("Toilet Rectifier Kit", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("Toilet Rectifier Kit_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            
            break
            
        case 6:
            
            product_img.image = UIImage(named: product_data["Img"]![6])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![6]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![6]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10

            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
                     case 7:
            
            
                    product_img.image = UIImage(named: product_data["Img"]![7])
            
                    name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
                    name_lbl.text = product_data["name"]![7]
            
                    name_lbl.numberOfLines = 2
            
                    price_lbl.text = product_data["price"]![7]
            
                    price_lbl.sizeToFit()
            
                    price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
                    price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
                    line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
                    description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
                    if self.view.frame.size.height<1024{
            
                        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuEnergizer", ofType:"html")!)
            
                        let request = NSURLRequest(URL: url)
                        description_webview.loadRequest(request)
                        
                    }else{
                        
                        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuEnergizer_ipad", ofType:"html")!)
                        
                        let request = NSURLRequest(URL: url)
                        description_webview.loadRequest(request)
                    }
                    
            
                    
                    break

            
//        case 7:
//            
//            product_img.image = UIImage(named: product_data["Img"]![7])
//            
//            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
//            
//            name_lbl.text = product_data["name"]![7]
//            
//            name_lbl.numberOfLines = 2
//            
//            // name_lbl.sizeToFit()
//            
//            price_lbl.text = product_data["price"]![7]
//            
//            price_lbl.sizeToFit()
//            
//            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
//            
//            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
//            
//            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
//            
//            description_webview.frame.origin.y = line_view.frame.origin.y + 20
//            
//            
//            if self.view.frame.size.height<1024{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//                
//            }else{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar_ipad", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//            }
//
//            
//            break
//            
//        case 8:
//            
//            
//            product_img.image = UIImage(named: product_data["Img"]![8])
//            
//            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
//            
//            name_lbl.text = product_data["name"]![8]
//            
//            name_lbl.numberOfLines = 2
//            
//            // name_lbl.sizeToFit()
//            
//            price_lbl.text = product_data["price"]![8]
//            
//            price_lbl.sizeToFit()
//            
//            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
//            
//            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
//            
//            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
//            
//            description_webview.frame.origin.y = line_view.frame.origin.y + 20
//        
//            if self.view.frame.size.height<1024{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("boundryStrip", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//                
//            }else{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("boundryStrip_ipad", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//            }
//
//            
//            break
           
        
        default:
        
        break
        
        
      }

    }

    func webViewDidFinishLoad(webView: UIWebView) {
        
        if self.view.frame.size.height==1024{
            
        description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height+15
            
        }else{
            
             description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height+10
            
        }
        description_webview.sizeToFit()
        
        addtoCard_btn.frame.origin.y = description_webview.frame.origin.y+description_webview.frame.size.height-10
        
        
        scrool_view.contentSize = CGSize(width:self.view.frame.width, height:  addtoCard_btn.frame.size.height+addtoCard_btn.frame.origin.y+10)
        
        if scrool_view.contentSize.height < scrool_view.frame.size.height{
            
            description_webview.scrollView.userInteractionEnabled = false
        }
        
       addtoCard_btn.hidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func cart_btn_prsd(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("cartPageVC") as! cartPageViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
        
    }
    
    
    @IBAction func tap_addtoCard(sender: AnyObject) {
       
        product_activity_indicator.hidden = false
        
        product_activity_indicator.startAnimating()
        
        let myurl = NSURL(string: "http://mars.promaticstechnologies.com/Vastukirpa/WebService/saveToCart")
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        let temporary = tag
        
        let prodName = product_data["name"]![temporary]
        
        let prodPrice = product_data["price"]![temporary]
        
        if var device = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            device = device.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            let trimmedProdPrice = prodPrice.stringByReplacingOccurrencesOfString("Rs.", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            let againTrimmedProdPrice = trimmedProdPrice.stringByReplacingOccurrencesOfString(".00", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            let postString = "name="+prodName+"&price="+againTrimmedProdPrice+"&device_id="+device
            
        
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error)  in
                
                
                dispatch_barrier_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.product_activity_indicator.hidden = true
                    
                    self.product_activity_indicator.stopAnimating()
                    
                    
                    if error != nil{
                        
                        return
                        
                    }else{
                        
                        var json : NSDictionary!
                        
                        do{
                            
                            json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                            
                        }catch{
                            
                            let alert = UIAlertController(title: "Vastu Kripa", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            
                            self.presentViewController(alert, animated: true, completion: nil)
                            
                        }
                        
                        
                        if let parseJSON = json {
                            
                            let msg = parseJSON["msg"]as! String
                
                            
                            if msg == "success"
                            {
                                self.product_activity_indicator.stopAnimating()
                                self.product_activity_indicator.hidden = true
                                
                                let alert = UIAlertController(title: "Added", message: "The item has been added to your Cart list.", preferredStyle: UIAlertControllerStyle.Alert)
                                
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                            }else if msg == "This item is already add in this cart"{
                                
                                self.product_activity_indicator.stopAnimating()
                                self.product_activity_indicator.hidden = true
                                
                                let alert = UIAlertController(title: "Sorry", message:"This item is already add in this cart.", preferredStyle: UIAlertControllerStyle.Alert)
                                
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                            }else if msg == "Something went wrong,Try again later"
                            {
                                
                                self.product_activity_indicator.stopAnimating()
                                self.product_activity_indicator.hidden = true
                                
                                let alert = UIAlertController(title: "Sorry", message:" \(device) ", preferredStyle: UIAlertControllerStyle.Alert)
                                
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                            }
                            
                        }

                    }
                    
                })
                
                
            }
            
            task.resume()
            
        }
        
    }
    
    
   }
