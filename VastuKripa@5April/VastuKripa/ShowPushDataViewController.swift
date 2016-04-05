//  ShowPushDataViewController.swift
//  VastuKripa
//
//  Created by promatics on 2/19/16.
//  Copyright (c) 2016 promatics. All rights reserved.


import UIKit

class ShowPushDataViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var popup_view: UIView!
    
    @IBOutlet weak var ok_btn: UIButton!
    @IBOutlet weak var notification_lbl: UILabel!
    
    
    @IBOutlet weak var notification_img: UIImageView!
    @IBOutlet weak var line_view: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var vastuListTable: UITableView!
    
    @IBOutlet weak var pendingIndicator: UIActivityIndicatorView!
    
    var img:String = ""
    
    var getData:NSMutableArray! = []
    
    var imageURl:NSString?
    
    var msg1:String = ""
    
    var id = ""
    
    var indicator:IndicatorView!
    
    let getConn:WebServiceConnection =  WebServiceConnection.connectionManager() as! WebServiceConnection

    override func viewDidLoad() {
        super.viewDidLoad()

        vastuListTable.tableFooterView = UIView()
        
        title_lbl.frame.origin.x = self.view.frame.size.width/2-title_lbl.frame.size.width/2

        
        popup_view.backgroundColor = UIColor.darkGrayColor()
        
        
        notification_img.frame.size.width = popup_view.frame.size.width
        
        popup_view.frame.origin.x = self.view.frame.size.width/2-popup_view.frame.size.width/2
        
        popup_view.frame.origin.y = self.view.frame.size.height/2-popup_view.frame.size.height/2
        
        
        notification_img.frame.origin.x = popup_view.frame.size.width/2-notification_img.frame.size.width/2
        
       // line_view.frame.origin.y = notification_img.frame.origin.y+notification_img.frame.size.height+15
        
       // notification_lbl.frame.origin.y = line_view.frame.origin.y+10
        
        ok_btn.frame.origin.x = popup_view.frame.size.width/2-ok_btn.frame.size.width/2
        
        ok_btn.frame.origin.y = popup_view.frame.size.height-ok_btn.frame.size.height-15
        
        ok_btn.layer.cornerRadius = 5
        
        notification_img.layer.borderWidth = 3
        
        popup_view.layer.borderWidth = 3
        
        popup_view.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        notification_img.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        popup_view.hidden = true
        
        vastuListTable.hidden = true
        
        notification_img.frame.origin.x = popup_view.frame.size.width/2-notification_img.frame.size.width/2
        
        
        backBtn.addTarget(self, action:"tapOnBackBtn", forControlEvents:UIControlEvents.TouchUpInside)
        
    }
    
    func tapOnBackBtn() {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func  viewWillAppear(animated: Bool) {
        
        notificatiionData()
        
    }
    
    func notificatiionData() {
        
        //self.view.addSubview(indicator!)
        
        
        
       
        
        start()
        
        var passDict = [String:AnyObject]()
        
        if let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            var postString = Device_id
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            passDict = ["device_id":postString,"status":"1"]
            
            getConn.startConnectionWithString("tipCountList", httpMethodType:Post_Type, httpBodyType:passDict) {(receivedData) -> Void in
                
               // print(receivedData)
                
                if self.getConn.responseCode() == 1{
                    
                    let haveList:NSDictionary? = receivedData
                    
                    
                    self.getData = haveList!.valueForKey("data_more")!.valueForKey("results") as? NSMutableArray
                    
                    if self.getData == nil{
                        
                        
                        
                    }
                    
                    NSUserDefaults.standardUserDefaults().setObject(self.getData, forKey: "data")
                    
                    self.imageURl =  haveList?.valueForKey("data_more")?.valueForKey("image_url")  as? String
                    
                    //self.pendingIndicator.hidden = true
                    
                     self.vastuListTable.userInteractionEnabled = true
                    
                     self.indicator.stop()
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                       // self.pendingIndicator.stopAnimating();
                        
                        self.vastuListTable.reloadData()
                        
                        self.indicator.stop()
                        
                    })
                    
                }else {
                    
                    
                    
                    self.getData = []
                    
                    self.indicator.stop()
                    
                    self.vastuListTable.reloadData()
                    
                }
            }
        }
        
    }
    
    // MARK: - Tableview Delegate&TadaSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    if getData == nil || getData.count<0{
            
        
        
        let Alert: UIAlertView = UIAlertView(title: "Vastu Kripa", message: "There are no notifications available",
            delegate: self, cancelButtonTitle: "Ok")
        
        Alert.show()
        
        return 0
            
        }else{
            
          return  getData.count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       
        
        let cell  = tableView.dequeueReusableCellWithIdentifier("Cell_id", forIndexPath:indexPath) as! ShowPushDataListTableViewCell
        
        if self.view.frame.size.height<1024{
            
            cell.vastuIcons.frame.origin.x = 5
            
            cell.vastuDeslbl.frame.size.width = self.view.frame.size.width-cell.vastuIcons.frame.size.width-10
            
            cell.vastuDeslbl.frame.origin.x = cell.vastuIcons.frame.origin.x+cell.vastuIcons.frame.size.width+5
            
            cell.vastuDeslbl.numberOfLines = 0
        
           cell.vastuDeslbl.text = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_message") as? String
            
             cell.vastuDeslbl.updateConstraints()
            
            cell.vastuDeslbl.sizeToFit()
            
        }else{
            
            cell.vastuIcons.frame.origin.x = 5
            
            cell.vastuDeslbl.frame.origin.x = cell.vastuIcons.frame.origin.x+cell.vastuIcons.frame.size.width+5
            
            cell.vastuDeslbl.numberOfLines = 0
            
            cell.vastuDeslbl.text = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_message") as? String
            
            cell.vastuDeslbl.sizeToFit()
            
           //cell.vastuDeslbl.frame.size.height = 45
           
            
        }
        
        cell.vastuIcons.layer.borderWidth = 2
        
         cell.vastuIcons.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        var imgname = (imageURl as? String)!
        
        let getImgName = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_image") as? String
        
        imgname = imgname + getImgName!
        
        cell.vastuIcons.setImageWithUrl(NSURL(string:imgname)!, placeHolderImage: UIImage(named:"PlaceHolder"))
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        vastuListTable.hidden = false
        
        
        return cell
        
    }
    
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    popup_view.hidden = false
    
    id = (getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("id") as? String)!
    
    popup_view.layer.borderWidth = 2
    
    popup_view.layer.borderColor = UIColor.lightGrayColor().CGColor
    
    notification_lbl.frame.size.width = popup_view.frame.size.width-20
    
    notification_lbl.numberOfLines = 0
    
    notification_lbl.text = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_message") as? String
    
    notification_lbl.sizeToFit()
    
    img = (imageURl as? String)!
    
    notification_lbl.frame.origin.x = popup_view.frame.size.width/2-notification_lbl.frame.size.width/2
    
    msg1 = (getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_message") as? String)!
    
    let getImgName = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_image") as? String
    
    img = img + getImgName!
    
    notification_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
    
  
    vastuListTable.scrollEnabled = true
    
    backBtn.userInteractionEnabled = true
    
    
    //self.performSegueWithIdentifier("", sender: self)
    
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    // MARK: - Navigation
    
    

    
    @IBAction func tapOk_button(sender: AnyObject) {
        
        
        vastuListTable.userInteractionEnabled = false
        
        self.popup_view.hidden = true
        
        self.vastuListTable.scrollEnabled = true
        
        self.backBtn.userInteractionEnabled = true
        
        var passDict = [String:AnyObject]()
    
    
        //pendingIndicator.hidden = false
        
        //pendingIndicator.startAnimating();
        
         start()
            
            passDict = ["tip_id":id]
            
            getConn.startConnectionWithString("update_tip", httpMethodType:Post_Type, httpBodyType:passDict) { (receivedData) -> Void in
                
                print(receivedData)
                
                if self.getConn.responseCode() == 1{
                    
                    var arr:NSDictionary?
                    
                    arr = receivedData!
                    
                    let msg = arr?.valueForKey("msg") as! String
                    
                 if msg != "successfully updated"{
                    
                    
                    let Alert: UIAlertView = UIAlertView(title: "", message: msg,
                        delegate: self, cancelButtonTitle: "Ok")
                    
                    Alert.show()
                    
                    }
                    
               
                 
                self.getnotifications()
                
                self.vastuListTable.reloadData()
               
//                self.pendingIndicator.hidden = true
//                    
//                self.pendingIndicator.stopAnimating();
                  
                self.indicator.stop()
                    
                self.vastuListTable.userInteractionEnabled = true
                    
                }else{
                    
                  self.indicator.stop()
                    
                  self.vastuListTable.userInteractionEnabled = true
                    
                }
                
                
            
            }

    }

    func getView(mes:String,imgurl:String){
        
        popup_view.hidden = false
        
        notification_lbl.text = mes
        
        var img:String = (imageURl as? String)!
        
        let getImgName = imageURl
        
        img = img + (getImgName! as String)
        
        notification_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
        
        
    }
    
    func getnotifications() {
        
        
        var passDict = [String:AnyObject]()
        
        if let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            var postString = Device_id
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            passDict = ["device_id":postString,"status":"1"]
            
            getConn.startConnectionWithString("tipCountList", httpMethodType:Post_Type, httpBodyType:passDict) {(receivedData) -> Void in
                
                // print(receivedData)
                
                if self.getConn.responseCode() == 1{
                    
                    let haveList:NSDictionary? = receivedData
                    
                    
                    self.getData = haveList!.valueForKey("data_more")!.valueForKey("results") as? NSMutableArray
                    
                    if self.getData == nil{
                        
                        
                        
                    }
                    
                    NSUserDefaults.standardUserDefaults().setObject(self.getData, forKey: "data")
                    
                    self.imageURl =  haveList?.valueForKey("data_more")?.valueForKey("image_url")  as? String
                    
                    //self.pendingIndicator.hidden = true
                    
                    self.vastuListTable.userInteractionEnabled = true
                    

                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        
                        self.vastuListTable.reloadData()
                        
                    })
                    
                }else {
                
                   
                    self.indicator.stop()
                    
                    //self.vastuListTable.reloadData()
                    
                }
            }
        }
        
    }

    
    func start(){
        
        indicator = IndicatorView(target:self.view, userEnable:true, message:"LOADING", backgroundColor:nil, fontColor:navigation_view.backgroundColor)
        
        indicator.start();
        
    }
}
