//  ShowPushDataViewController.swift
//  VastuKripa
//
//  Created by promatics on 2/19/16.
//  Copyright (c) 2016 promatics. All rights reserved.


import UIKit

class ShowPushDataViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var popup_view: UIView!
    
    @IBOutlet weak var ok_btn: UIButton!
    @IBOutlet weak var notification_lbl: UILabel!
    
    
    @IBOutlet weak var notification_img: UIImageView!
    @IBOutlet weak var line_view: UIView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var vastuListTable: UITableView!
    
    @IBOutlet weak var pendingIndicator: UIActivityIndicatorView!
    
    let getConn:WebServiceConnection =  WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var getData:NSMutableArray! = []
    
    var imageURl:NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title_lbl.frame.origin.x = self.view.frame.size.width/2-title_lbl.frame.size.width/2

        pendingIndicator.frame.origin.x = self.view.frame.size.width/2-pendingIndicator.frame.size.width/2
    
        
        popup_view.backgroundColor = UIColor.whiteColor()
        
        popup_view.frame.origin.x = self.view.frame.size.width/2-popup_view.frame.size.width/2
        
        popup_view.frame.origin.y = self.view.frame.size.height/2-popup_view.frame.size.height/2
        
        
        notification_img.frame.origin.x = popup_view.frame.size.width/2-notification_img.frame.size.width/2
        
        line_view.frame.origin.y = notification_img.frame.origin.y+notification_img.frame.size.height+15
        
        notification_lbl.frame.origin.y = line_view.frame.origin.y+10
        
        ok_btn.frame.origin.x = popup_view.frame.size.width/2-ok_btn.frame.size.width/2
        
        notification_lbl.frame.origin.x  = notification_img.frame.origin.x
        
        ok_btn.frame.origin.y = popup_view.frame.size.height-ok_btn.frame.size.height-15
        
        ok_btn.layer.cornerRadius = 5
        
        notification_img.layer.borderWidth = 3
        
        popup_view.layer.borderWidth = 3
        
        popup_view.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        notification_img.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        popup_view.hidden = true
        
        vastuListTable.hidden = true
        
        backBtn.addTarget(self, action:"tapOnBackBtn", forControlEvents:UIControlEvents.TouchUpInside)
        
    }
    
    func tapOnBackBtn() {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func  viewWillAppear(animated: Bool) {
        
        notificatiionData()
        
    }
    
    func notificatiionData() {
        
        pendingIndicator.hidden = false
        
        pendingIndicator.startAnimating();
        
        var passDict = [String:AnyObject]()
        
        if let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            var postString = Device_id
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            passDict = ["device_id":postString,"status":"1"]
            
            getConn.startConnectionWithString("tipCountList", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                
               // print(receivedData)
                
                if self.getConn.responseCode() == 1{
                    
                    let haveList:NSDictionary? = receivedData
                    
                    print(receivedData)
                    print(haveList)
                    
                    
                    self.getData = haveList!.valueForKey("data_more")!.valueForKey("results") as? NSMutableArray
                    
                    if self.getData == nil{
                        
                        
                        
                    }
                    
                    NSUserDefaults.standardUserDefaults().setObject(self.getData, forKey: "data")
                    
                    self.imageURl =  haveList?.valueForKey("data_more")?.valueForKey("image_url")  as? String
                    
                    self.pendingIndicator.hidden = true
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.pendingIndicator.stopAnimating();
                        
                        self.vastuListTable.reloadData()
                        
                    })
                    
                }else {
                    
                    self.getData = []
                    
                    self.pendingIndicator.hidden = true
                    
                    self.pendingIndicator.stopAnimating();
                    
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
            
        
        
        let Alert: UIAlertView = UIAlertView(title: "", message: "There are No Notifications Available",
            delegate: self, cancelButtonTitle: "Ok")
        
        Alert.show()
        
        return 0
            
        }else{
            
          return  getData.count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       
        
        let cell  = tableView.dequeueReusableCellWithIdentifier("Cell_id", forIndexPath:indexPath) as! ShowPushDataListTableViewCell
        
        cell.vastuDeslbl.text = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_message") as? String
        
        var img:String = (imageURl as? String)!
        
        let getImgName = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_image") as? String
        
        img = img + getImgName!
        
        cell.vastuIcons.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        vastuListTable.hidden = false
        
        return cell
        
    }
    
func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
   popup_view.hidden = false

   notification_lbl.text = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_message") as? String
    
    var img:String = (imageURl as? String)!
    
    let getImgName = getData.objectAtIndex(indexPath.row).valueForKey("SendTip")?.valueForKey("tips_image") as? String
    
    img = img + getImgName!
    
    notification_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
  
    vastuListTable.scrollEnabled = false
    
    backBtn.userInteractionEnabled = false
    
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func tapOk_button(sender: AnyObject) {
        
       popup_view.hidden = true
        
       vastuListTable.scrollEnabled = true
        
       backBtn.userInteractionEnabled = true

        
    }

    func getView(mes:String,imgurl:String){
        
        popup_view.hidden = false
        
        notification_lbl.text = mes
        
        var img:String = (imageURl as? String)!
        
        let getImgName = imageURl
        
        img = img + (getImgName! as String)
        
        notification_img.setImageWithUrl(NSURL(string:img)!, placeHolderImage: UIImage(named:"PlaceHolder"))
        
        
    }
}
