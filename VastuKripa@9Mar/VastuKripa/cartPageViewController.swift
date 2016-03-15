
import UIKit

class cartPageViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navigation_back_btn: UIButton!
    
    @IBOutlet weak var navigation_lbl: UILabel!

    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet weak var cartPage_tableView: UITableView!
    
    var cell : cartPageTableViewCell!
    
        let getConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    let getConnForTrash:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    @IBOutlet weak var cartPage_activity_indicator: UIActivityIndicatorView!
    
    var cart_listArr: NSArray!
    var bynow:UIButton!
    var bybtn_width:CGFloat!
    var bybtn_height:CGFloat!
    var img_size:CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cartPage_activity_indicator.frame.origin.x = self.view.frame.size.width/2 - cartPage_activity_indicator.frame.size.width
        
        navigation_lbl.frame.origin.x = navigation_view.frame.size.width/2-navigation_lbl.frame.size.width/2
        
         cartPage_tableView.hidden = true
        
        cartPage_tableView.frame.size.width = self.view.frame.size.width
        
        // Do any additional setup after loading the view.
        cart_listArr = []
        
        if self.view.frame.size.height==1024 {
            
            bybtn_width = 250
            
            bybtn_height = 44
            
            img_size = 150
            
        } else {
            
            bybtn_width = 200
            
            bybtn_height = 35

             img_size = 88
        }

        cartPage_activity_indicator.hidden = false
        cartPage_activity_indicator.startAnimating()
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        cartPage_tableView.frame.size.height = self.view.frame.size.height-65
        
        cartPage_tableView.frame.size.width = self.view.frame.size.width
        
    }
    
    func parsedJson(){
        
         let err : NSError?
    
        let myurl = NSURL(string: "http://mars.promaticstechnologies.com/Vastukirpa/WebService/cartList")
        
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        if let device = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            var postString = "device_id="+device
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            print("post string === \(postString)\n")
            
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
           
            
            var json : NSDictionary!
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
                {
                    (data, response, err)  in
                
                if err != nil{
                    print("\(err)")
                    return
                }
                print("response === \(response)\n")
                
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                print("\n\n\nResponse data === \(responseString)\n\n\n")
                
                do{
                
              try  json = NSJSONSerialization.JSONObjectWithData(data!, options:.MutableContainers) as? NSDictionary
                 
                }catch{
                    
                    
                }
                
                if(( json["status"]! ) as! Int !=  0) {
                    
                    
                    do{
                    
                  try  json = NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                    
                    //var statusCode =
                    }catch{
                        
                    }
                    
                    
                    
                    if(err != nil) {
                        
                        print(err!.localizedDescription)
                        let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        print("Error could not parse JSON: \(jsonStr)\n")
                        
                    }
                    else
                    {
                        if let parseJSON = json {
                            // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                            let msg = parseJSON["msg"]as! String
                            
                            if let receiveData = parseJSON["data"] as? NSArray {
                                print("\n\nmsg == \(msg)\n\n")
                                
                                print("\n\nRecieved == \(receiveData)\n\n")
                                
                                self.cart_listArr = receiveData
                                
                                dispatch_async(dispatch_get_main_queue(),{
                                    
                                    self.cartPage_activity_indicator.hidden = true
                                    
                                    self.cartPage_activity_indicator.stopAnimating()
                                    
                                    self.cartPage_tableView.reloadData()
                                })
                            }
                            
                        }
                        else {
                            // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                            
                            print("Error could not parse JSON: \(jsonStr)\n")
                        }
                    }
                    
                }else {
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        self.cartPage_activity_indicator.hidden = true
                        
                        self.cartPage_activity_indicator.stopAnimating()
                        
                        let alert = UIAlertView(title:"", message:"There is no any product in your cart", delegate: nil, cancelButtonTitle:"OK")
                        
                        alert.show()
                        
                        self.cart_listArr = []
                        
                        self.cartPage_tableView.hidden = true
                        
                    })
                    
                }
            }
            
            task.resume()
            
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        
        parsedJson()
        
    }

    
    func callWebservice(index:Int,quantity:String){
        
        var passDict = [String:AnyObject]()
        
        if let device =  NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            var postString = device
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            let name:String = (cart_listArr.objectAtIndex(index).valueForKey("Cart")!.valueForKey("name") as? String)!
            
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            
            
            passDict = ["device_id":postString,"name":name,"quantity":quantity]
            
            
            self.cartPage_activity_indicator.hidden = false
            
            self.cartPage_activity_indicator.startAnimating()
            
            getConn.startConnectionWithString("editCartItem", httpMethodType:Post_Type, httpBodyType: passDict) { (recevedData) -> Void in
                
                print(recevedData)
                
                if(self.getConn .responseCode() == 1){
                    
                    print("Your device register successfully")
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        self.cartPage_activity_indicator.hidden = true
                        
                        self.cartPage_activity_indicator.stopAnimating()
                        
                        self.parsedJson()
                    })
                    
                }else {
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        
                        self.cartPage_activity_indicator.hidden = true
                        
                        self.cartPage_activity_indicator.stopAnimating()
                        
                    })
                }
  
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        footerView.backgroundColor = UIColor.whiteColor()
        
        
        let proceed = UIButton()
        
         proceed.backgroundColor = navigation_view.backgroundColor
        
        proceed.setTitle("Proceed", forState: UIControlState.Normal)
        
        proceed.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    
        
        proceed.frame = CGRectMake(self.view.frame.size.width/2-bybtn_width/2, 40, bybtn_width,  bybtn_height)
        
        
        proceed.layer.cornerRadius = 5
        
       proceed.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        
        footerView.addSubview(proceed)
        
        // bynow.hidden = true
        
        return footerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 100.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(cart_listArr)
        
        if cart_listArr == nil {
            
            return 0;
            
        }else {
           
            return cart_listArr.count;
        }
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         cell = tableView.dequeueReusableCellWithIdentifier("cartPageCell")as! cartPageTableViewCell
        
       // print(cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("price") as? String)
        
        cell.product_name_lbl.text = cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("name") as? String
        
        cell.line_view.frame.size.width = self.view.frame.size.height
        
        cell.product_name_lbl.numberOfLines = 0
        
        cell.product_name_lbl.sizeToFit()
        
        if cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("total_price") as! String=="0"{
        
        
             cell.product_price_lbl.text = cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("price") as? String
        
        }else{
            
            cell.product_price_lbl.text = cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("total_price") as? String
            
        }
        
        cell.product_imageView.layer.borderWidth = 3
        
        cell.product_imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        let image = cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("image") as? String
        
        if image != nil{
        
        cell.product_imageView.image = UIImage(named: image!)!
            
        }else{
            
            cell.product_imageView.image = UIImage(named: "PlaceHolder")!
            
        }
        cell.product_quantity_lbl.text = cart_listArr.objectAtIndex(indexPath.row).valueForKey("Cart")?.valueForKey("quantity") as? String
        
        cell.quantityBtn.tag = indexPath.row;
        
        cell.quantity_btn.layer.borderWidth = 2.0
        cell.quantity_btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        cell.quantityBtn.addTarget(self, action:"tapOnQuatity:", forControlEvents:UIControlEvents.TouchUpInside)
        
        cell.trashBtn.tag = indexPath.row;
        
        cell.trashBtn.addTarget(self, action:"TapOnTrash:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        cell.selectionStyle=UITableViewCellSelectionStyle.None
        
        cartPage_tableView.hidden = false
        
        return cell
        
    }
    
    func TapOnTrash(btn:UIButton) {
        
        var passDict = [String:AnyObject]()
        
        let index:Int = btn.tag
        
        let device = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as! String
        
        var postString = device
        
        postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
        
        
        let name:String = (cart_listArr.objectAtIndex(index).valueForKey("Cart")!.valueForKey("name") as? String)!
        
        passDict = ["device_id":postString,"name":name]
        
        self.cartPage_activity_indicator.hidden = false
        
        self.cartPage_activity_indicator.startAnimating()
        
        getConnForTrash.startConnectionWithString("deleteCartItem", httpMethodType:Post_Type, httpBodyType: passDict) { (recevedData) -> Void in
            
            print(recevedData)
            
            if(self.getConnForTrash .responseCode() == 1){
                
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    self.cartPage_activity_indicator.hidden = true
                    
                    self.cartPage_activity_indicator.stopAnimating()
                    
                    self.parsedJson()
                })
                
            }else {
                
                dispatch_async(dispatch_get_main_queue(),{
                    
                    self.cartPage_activity_indicator.hidden = true
                    
                    self.cartPage_activity_indicator.stopAnimating()
                    
                })
            }
     
        }
   
    }
    
    func tapOnQuatity( btn:UIButton) {
        
        print(btn.tag)
        
        let index:Int = btn.tag
        
        let viewWithText = UIAlertController(title:"Quantity", message:"", preferredStyle:.Alert)
        
        viewWithText.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            textField.keyboardType = UIKeyboardType.NumberPad
            
            textField.placeholder = "Please enter quantity"
        }
        
        viewWithText.addAction(UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            
        }))
        
        viewWithText.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            let textField = viewWithText.textFields![0]
            
            if(textField.text != nil){
                
                self.callWebservice(index,quantity:textField.text!)
            }
            
        }))
        
        
        self.presentViewController(viewWithText, animated: true, completion:nil)
        
    }
    
    func callWebservices(index:Int,quantity:String){
        
         cartPage_activity_indicator.hidden = false
        
        cartPage_activity_indicator.startAnimating()
        
        let myurl = NSURL(string: "http://mars.promaticstechnologies.com/Vastukirpa/WebService/editCartItem")
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        // 573B2169-2403-44C3-B266-A2584B6C929F
        // E947C358-75CB-4EBD-8FC9-8662E1DBBE95
        
        if var device = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            device = device.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            print("ipad == \(device)")
            
            let name:String = (cart_listArr.objectAtIndex(index).valueForKey("Cart")!.valueForKey("name") as? String)!
            
            let postString = "device_id="+device+"&name="+name+"&quantity="+quantity
            
            print(postString)
            
            // let tfmail :String = mail.text!
            // let tfpass : String = paswd.text!
            // let postString = "email="+tfmail+" & password="+tfpass
            
            print("post string === \(postString)")
            
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error)  in
                
                dispatch_barrier_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.cartPage_activity_indicator.hidden = true
                    
                    self.cartPage_activity_indicator.stopAnimating()
                    
                })
                
                
                
                if error != nil{
                    print("\(error)")
                    return
                    
                }
                print("response === \(response)\n")
                
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                print("Response data === \(responseString)\n")
                
               
                do{
                    
                    let json : NSDictionary!
                
              try  json = NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
                
                }catch{
                    
                }
                
              self.parsedJson()
                
            }
            
            task.resume()
            
        }
    }


    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func back_btn_prsd(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    func buttonTouched(sender:UIButton!){
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("BuyVC") as! BuyViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }

    
}
