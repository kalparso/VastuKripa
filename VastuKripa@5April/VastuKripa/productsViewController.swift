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
    
    
    
    
    var product_data  = [
        
        "Img":[
            "product_1_detail",
            "product_8_detail",
            "product_3_detail",
            "product_5_detail",
            "product_2_detail",
            "product_10_detail",
            "product_7_detail",],

           
        
        "name":[
            "Divine Connect Vedic Yantra Frame",
            "Kuber Devta Yantra Kit",
            "Vastu Vitalizer Pyramid",
            "Power Grid Stick",
            "Happy Relationship Yantra",
            "Vastu Rectification Kit",
            "Ek Onkar Symbol"],
           
        
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
            ]]
    
    var products  = [
        
        "Img":["product_1_detail","product_2_detail","product_3_detail","product_4_detail","product_5_detail","product_6_detail","product_7_detail","product_8_detail","product_9_detail",],
        "name":["Divine Connect Vedic Yantra Frame","Happy Relationship Yantra","Vastu Vitalizer Pyramid","Divine Oorja Cube","Power Grid Stick","Vastu Boundary Energy Strip","Ek Onkar Symbol","Kuber Devta Yantra With Installation Kit","Vastu Energizer For Flooring"],
        "desc":["For all Home, Workpalce & Factories.","For peace, love, harmony.","For all Home, Workpalce & Factories.","For all Home, Workpalce & Factories.","To create a powerful energy field.","Symbol to Safeguard your permises.","Symbol to Safeguard your permises.","Opens up new avenues & opportunities.","Energizes the environment."],
        "price":["Rs.2320.00","Rs.2150.00","Rs.880.00","Rs.962.00","Rs.1960.00","Rs.900.00","Rs.300.00","Rs.1260.00","Rs.1114.00"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        product_activity_indicator.frame.origin.x = self.view.frame.size.width/2 - product_activity_indicator.frame.size.width/2
        
        product_activity_indicator.frame.origin.y = self.view.frame.size.height/2 - product_activity_indicator.frame.size.height/2
        
        self.product_activity_indicator.hidden = true
        
        var frame = navigation_title.frame
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
    
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
            
        }
        
        if self.view.frame.size.height<1024{
        
           cart_btn.frame.origin.x = contact_btn.frame.origin.x - cart_btn.frame.size.width-20
            
        }else{
            
           cart_btn.frame.origin.x = contact_btn.frame.origin.x - cart_btn.frame.size.width-30
        }
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        NSUserDefaults.standardUserDefaults().setValue("1", forKey: "OpenCamera")
        
        self.navigationController?.navigationBarHidden = false
        
        self.title = "Vastu Products"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        self.view.backgroundColor=UIColor.whiteColor()
        
        //product_info_btn.addTarget(self, action:"getInfo:", forControlEvents:  UIControlEvents.TouchUpInside)
        
        
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
        
        // info_btn.hidden = false
        
        //contact_btn.hidden = true
        
        navigation_title.text =  "Vastu Products"
        
        
        self.navigationController?.navigationBarHidden = true
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
            
            print("ipad == \(device)")
            
            let trimmedProdPrice = prodPrice.stringByReplacingOccurrencesOfString("Rs.", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            let againTrimmedProdPrice = trimmedProdPrice.stringByReplacingOccurrencesOfString(".00", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
             print(againTrimmedProdPrice)
            
            let postString = "name="+prodName+"&price="+againTrimmedProdPrice+"&device_id="+device
            
             print(postString)
            
            
            print("post string === \(postString)")
            
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
                        
                        let alert = UIAlertController(title: "", message: "error", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        
                        self.presentViewController(alert, animated: true, completion: nil)
                        
                    }
                    
                    
                    if let parseJSON = json {
                        
                        let msg = parseJSON["msg"]as! String
                        
                        print("msg == \(msg)\n")
                        
                        if msg == "success"
                        {
                            self.product_activity_indicator.stopAnimating()
                               self.product_activity_indicator.hidden = true
                            
                            let alert = UIAlertController(title: "Added", message: "The item has been added to your Cart list", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            
                            self.presentViewController(alert, animated: true, completion: nil)
                            
                        }else if msg == "This item is already add in this cart"{
                            
                            let alert = UIAlertController(title: "Sorry", message:msg, preferredStyle: UIAlertControllerStyle.Alert)
                            
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
                    else {
                       
                        let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        
                        print("Error could not parse JSON: \(jsonStr)\n")
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
    
    @IBAction func cart_btn_prsd(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("cartPageVC") as! cartPageViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
    }
    
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func contact_btn_tuch(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsVC")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }
 }
