 //
 //  productsViewController.swift
 //  VastuKripa
 //
 //  Created by promatics on 12/21/15.
 //  Copyright (c) 2015 promatics. All rights reserved.
 //
 
 import UIKit
 
 class productsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var quantity_data = [0,0,0,0,0,0,0,0,0]
    
    @IBOutlet weak var cartCount_lbl: UILabel!
    @IBOutlet weak var product_info_btn: UIButton!
    
    @IBOutlet weak var addToCart_btn: UIButton!
    @IBOutlet weak var cart_btn: UIButton!
    @IBOutlet weak var product_tblView: UITableView!
    
    @IBOutlet weak var product_activity_indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    
    let cartCountConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
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
            "Symbol to Safeguard your permises.","Energizes the environment."
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
        
        product_activity_indicator.frame.origin.x = self.view.frame.size.width/2 - product_activity_indicator.frame.size.width/2
        
        product_activity_indicator.frame.origin.y = self.view.frame.size.height/2 - product_activity_indicator.frame.size.height/2
  
        self.product_activity_indicator.hidden = true
        
       cartCount_lbl.layer.cornerRadius = cartCount_lbl.frame.size.width/2
        
       cartCount_lbl.layer.masksToBounds = true
        
       cartCount_lbl.backgroundColor = UIColor.redColor()
        
       navigation_title.frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
    
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
            
            
        }
        
        if self.view.frame.size.width == 414{
            
            contact_btn.frame.origin.x = self.view.frame.size.width-contact_btn.frame.size.width-15
            
            cartCount_lbl.frame.origin.x = cart_btn.frame.origin.x+12
            
            cart_btn.frame.origin.x = contact_btn.frame.origin.x-cart_btn.frame.size.width-5
        }
        
        if self.view.frame.size.height<1024{
        
           cart_btn.frame.origin.x = contact_btn.frame.origin.x - cart_btn.frame.size.width-20
            
            cartCount_lbl.frame.origin.x = cart_btn.frame.origin.x+12
            
         }else{
            
           cart_btn.frame.origin.x = contact_btn.frame.origin.x - cart_btn.frame.size.width-30
            
           cartCount_lbl.frame.origin.x = cart_btn.frame.origin.x+16
        }
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
        self.navigationController?.navigationBarHidden = false
        
        self.title = "Vastu Products"

        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.view.backgroundColor=UIColor.whiteColor()
    
        
        product_tblView.frame.size.width = self.view.frame.size.width
        
        product_activity_indicator.frame.origin.x = self.view.frame.size.width/2 - product_activity_indicator.frame.size.width
        
    }
    
    func getInfo(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("vastubuyVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
        
    }
    
    override   func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
override func viewWillAppear(animated: Bool) {
        
        navigation_title.text =  "Vastu Products"
        
        self.navigationController?.navigationBarHidden = true
        
         self.cartCount_lbl.hidden = true
        
          getCartCount()
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) ->Int
    {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int
    {
        
        return 8;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell
    {
        
        var cell : productTableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as! productTableViewCell
        
        if(cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! productTableViewCell;
            
        }
        
        let img_name = product_data["Img"]![indexPath.row]
        
        cell.product_img.setBackgroundImage(UIImage(named: img_name),forState: UIControlState.Normal)
       
        cell.product_img.layer.borderWidth = 1
        
        cell.product_img.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        cell.product_name.text = product_data["name"]![indexPath.row]
        
        cell.product_desc.text = product_data["desc"]![indexPath.row]
        
        cell.product_price.text = product_data["price"]![indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.addToCart_btn.addTarget(self, action: "addToCart:", forControlEvents:UIControlEvents.TouchUpInside)
        
        if self.view.frame.size.height==1024{
            
            cell.addToCart_btn.frame.origin.x = self.view.frame.size.width-cell.addToCart_btn.frame.size.width-20
        }else{
        
        cell.addToCart_btn.frame.origin.x = self.view.frame.size.width-cell.addToCart_btn.frame.size.width-10
        
        }
        
        cell.addToCart_btn.tag = indexPath.row
        
        cell.addToCart_btn.layer.cornerRadius = 5
        
        return cell
        
    }
    
    func addToCart(sender : UIButton) {
        
         product_tblView.userInteractionEnabled = false
        
        product_activity_indicator.hidden = false
        
        product_activity_indicator.startAnimating()
        
        let myurl = NSURL(string: "http://mars.promaticstechnologies.com/Vastukirpa/WebService/saveToCart")
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        let temporary = sender.tag
        
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
                            self.getCartCount()
                            
                            self.product_tblView.userInteractionEnabled = true
                            
                            self.product_activity_indicator.stopAnimating()
                               self.product_activity_indicator.hidden = true
                            
                            let alert = UIAlertController(title: "Added", message: "Product successfully added to Cart.", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            
                            self.presentViewController(alert, animated: true, completion: nil)
                        
                            
                        }else if msg == "This item is already add in this cart"{
                            
                            self.product_tblView.userInteractionEnabled = true
                            
                            let alert = UIAlertController(title: "Sorry", message:"This item is already added in this cart.", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            
                            self.presentViewController(alert, animated: true, completion: nil)
                        
                        }else if msg == "Something went wrong,Try again later"
                            {
                                
                                self.product_tblView.userInteractionEnabled = true
                                
                                self.product_activity_indicator.stopAnimating()
                                self.product_activity_indicator.hidden = true
                                
                                let alert = UIAlertController(title: "Sorry", message:" \(device) ", preferredStyle: UIAlertControllerStyle.Alert)
                                
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                        }
                        
                    }
                    else {
                        
                          self.product_tblView.scrollEnabled = true
                       
                    }
                }
               
                })

                
            }
            
            task.resume()
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row
        {
        case 0:
            
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 1:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 2:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            
            break
            
        case 3:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 4:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 5:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 6:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 7:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 8:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        case 9:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            NSUserDefaults.standardUserDefaults().setValue(indexPath.row, forKey: "zero")
            
            break
            
        default:
            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detailVC") as! detailViewController
            
            self.navigationController!.pushViewController(secondViewController, animated: true)
            
            break
            
        }
    }
    
    
    func getCartCount(){
        
        product_tblView.userInteractionEnabled = false
        
        self.product_activity_indicator.startAnimating()
        self.product_activity_indicator.hidden = false
        
        var passDict = [String:AnyObject]()
        
        if let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
        
            passDict = ["device_id":Device_id]
            
            cartCountConn.startConnectionWithString("cart_count", httpMethodType:Post_Type, httpBodyType:passDict) { (receivedData) -> Void in
            
                
                if self.cartCountConn.responseCode() == 1{
                    
                    self.product_tblView.userInteractionEnabled = true
                    
                    self.product_activity_indicator.stopAnimating()
                    self.product_activity_indicator.hidden = true
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData!
            
                    dispatch_async(dispatch_get_main_queue(),{
                        
                         self.product_tblView.userInteractionEnabled = true
                        
                        self.product_activity_indicator.stopAnimating()
                        self.product_activity_indicator.hidden = true
    
                            if let num = arr?.valueForKey("data") as? Int {
                            
                                if num>0{
                                    
                                    self.cartCount_lbl.hidden = false
                                    
                                    self.cartCount_lbl.text = String(num)
                                    
                                   NSUserDefaults.standardUserDefaults().setBool(true, forKey: "cartlist")
                                    
                                }else{
                
                                    
                                    self.cartCount_lbl.hidden = true
                                    NSUserDefaults.standardUserDefaults().setBool(false, forKey: "cartlist")
                            
                              }
                         
                        }
                    })
                }
            }

        }
    }
    @IBAction func cart_btn_prsd(sender: AnyObject) {
        
        let cartViewController = self.storyboard!.instantiateViewControllerWithIdentifier("cartPageVC") as! cartPageViewController
        
        self.navigationController!.pushViewController(cartViewController, animated: true)
        
    }
    
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func contact_btn_tuch(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }
 }
