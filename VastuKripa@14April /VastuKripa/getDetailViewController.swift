//
//  getDetailViewController.swift
//  
//
//  Created by promatics on 3/3/16.
//
//

import UIKit

class getDetailViewController: UIViewController,NSURLSessionDelegate, NSURLSessionDownloadDelegate,UIDocumentInteractionControllerDelegate,UIScrollViewDelegate {
    
    
    @IBOutlet weak var e_booklet_btn: UIButton!
    @IBOutlet weak var activity_indicator: UIActivityIndicatorView!
    @IBOutlet weak var star_bages: UIButton!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var ebook_tips_lbl: UILabel!
    
    @IBOutlet weak var bedroom_lbl: UILabel!
    
    @IBOutlet weak var livingroom_lbl: UILabel!
    
    @IBOutlet weak var tips_ebook_scrollView: UIScrollView!
    @IBOutlet weak var vastu_ebook_cover: UIImageView!
    
    @IBOutlet weak var progress_lbl: UILabel!

    @IBOutlet weak var navigation_View: UIView!
    
    @IBOutlet weak var line_view: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btn_view: UIView!
    @IBOutlet weak var title_lbl: UILabel!
   
    @IBOutlet weak var submit_btn: UIButton!
    @IBOutlet weak var name_txt: UITextField!
    
    @IBOutlet weak var email_txt: UITextField!
    
    @IBOutlet weak var mobile_txt: UITextField!
    
     @IBOutlet weak var city_txt: UITextField!
    
    var download = 0.00
    
    let vastuValidation:Validation = Validation.validationManager() as! Validation
   
    let vastuTipsConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    var downloadTask: NSURLSessionDownloadTask!
    
    var backgroundSession: NSURLSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField .appearance().tintColor = UIColor.lightGrayColor()
        
        if self.view.frame.size.height==1024{
            
          name_txt.frame.size.height = 45
            
          name_txt.frame.origin.y = name_txt.frame.origin.y+10
            
          email_txt.frame.size.height = 45
            
          email_txt.frame.origin.y = email_txt.frame.origin.y+20
            
          city_txt.frame.size.height = 45
            
          city_txt.frame.origin.y = city_txt.frame.origin.y+30
          
          mobile_txt.frame.size.height = 45
            
          mobile_txt.frame.origin.y = mobile_txt.frame.origin.y+40
           
          submit_btn.frame.size.height = 45
            
          submit_btn.frame.origin.y = submit_btn.frame.origin.y+50
            
        }
        
        e_booklet_btn.layer.cornerRadius = 5
        
        activity_indicator.hidden = true
        
        activity_indicator.frame.origin.x = self.view.frame.size.width/2 - activity_indicator.frame.size.width/2
        
        activity_indicator.frame.origin.y = self.view.frame.size.height/2 - activity_indicator.frame.size.height/2
        
        progressView.frame.origin.y = 100
        
        btn_view.frame.origin.x =  (self.view.frame.size.width-btn_view.frame.size.width)/2
       
        
        progressView.frame.origin.x = self.view.frame.size.width/2-progressView.frame.size.width/2
            
        progress_lbl.frame.origin.x = navigation_View.frame.size.width/2-progress_lbl.frame.size.width/2
        
        progress_lbl.frame.origin.y =   progressView.frame.origin.y-progress_lbl.frame.size.height+10
    
        
        bedroom_lbl.text = "• Bedroom\n• Kitchen\n• main Door\n• Tijori"
        
        livingroom_lbl.text = "• Living Room\n• Poojasthaan\n• Office Factory\n• Vastu Rectification"
        
        livingroom_lbl.sizeToFit()
        
        bedroom_lbl.sizeToFit()
        
        vastu_ebook_cover.layer.borderWidth = 2.0
        
        vastu_ebook_cover.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        submit_btn.layer.cornerRadius = 5.0
        
        tips_ebook_scrollView.frame.size.height = self.view.frame.size.height
        

        progressView.hidden = true
        
        progress_lbl.hidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        title_lbl.frame.origin.x = (navigation_View.frame.size.width - title_lbl.frame.size.width)/2
        
       progressView.transform = CGAffineTransformScale(progressView.transform, 1, 6)
        
        if self.view.frame.size.height==1024{
        
      tips_ebook_scrollView.contentSize = CGSize(width: self.view.frame.size.width,height: btn_view.frame.origin.y+btn_view.frame.size.height+85)
            
        }else{
            
            tips_ebook_scrollView.contentSize = CGSize(width: self.view.frame.size.width,height:btn_view.frame.origin.y+btn_view.frame.size.height+85)
    
            
        }
        if self.view.frame.size.width == 414{
            
           star_bages.frame.origin.x = self.view.frame.size.width-star_bages.frame.size.width-15
            
        }
        
        if self.view.frame.width<375{
            
            
        title_lbl.frame.origin.x = back_btn.frame.origin.x +  back_btn.frame.size.width+2
        
        star_bages.frame.origin.x = self.view.frame.size.width-star_bages.frame.size.width-3

        }else if self.view.frame.width==375{
            
        star_bages.frame.origin.x = self.view.frame.size.width-star_bages.frame.size.width-15
            
        }
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func URLSession(session: NSURLSession,
        downloadTask: NSURLSessionDownloadTask,
        didFinishDownloadingToURL location: NSURL){
            
            progressView.hidden = true
    
            let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            let documentDirectoryPath:String = path[0] 
            let fileManager = NSFileManager()
            let destinationURLForFile = NSURL(fileURLWithPath: documentDirectoryPath.stringByAppendingString("/file.pdf"))
            
            if fileManager.fileExistsAtPath(destinationURLForFile.path!){
                
                showFileWithPath(destinationURLForFile.path!)
            
            }
            else{
                
                do{
                
               try fileManager.moveItemAtURL(location, toURL: destinationURLForFile)
                
                
            }catch{
                
            
            }
                
            }
            
            showFileWithPath(destinationURLForFile.path!)

                
//                let Alert: UIAlertView = UIAlertView(title: "", message: "An error occurred while moving file to destination url",
//                    delegate: self, cancelButtonTitle: "Ok")
//                
//                Alert.show()
            
            
    }
    // 2
    func URLSession(session: NSURLSession,
        downloadTask: NSURLSessionDownloadTask,
        didWriteData bytesWritten: Int64,
        totalBytesWritten: Int64,
        totalBytesExpectedToWrite: Int64){
            
            
         
            
         let   download = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
            
          let totalSize = NSByteCountFormatter.stringFromByteCount(totalBytesExpectedToWrite, countStyle: NSByteCountFormatterCountStyle.Binary)
            
    
            progress_lbl.text =  String(format: "%.1f%% of %@",  download * 100, totalSize)
            
            
            progressView.setProgress(Float(totalBytesWritten)/Float(totalBytesExpectedToWrite), animated: true)
    
    
               }
    
func showFileWithPath(path: String){
        
        let isFileFound:Bool? = NSFileManager.defaultManager().fileExistsAtPath(path)
        if isFileFound == true{
            let viewer = UIDocumentInteractionController(URL: NSURL(fileURLWithPath: path))
            
            viewer.delegate = self
            
            viewer.presentPreviewAnimated(true)
            
        }
    }
    
    
    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController{
        
        return self

        
    }
    
    func URLSession(session: NSURLSession,
        task: NSURLSessionTask,
        didCompleteWithError error: NSError?){
            
            downloadTask = nil
            
            progressView.setProgress(0.0, animated: true)
            if (error != nil) {
                
                let Alert: UIAlertView = UIAlertView(title: "", message: error?.description,
                    
                    delegate: self, cancelButtonTitle: "Ok")
                
                Alert.show()
                
            }else{
                
                 progressView.hidden = true
                
                 progress_lbl.hidden = true
        
                let Alert: UIAlertView = UIAlertView(title: "", message: "File downloding completed.",
                    delegate: self, cancelButtonTitle: "Ok")
                
                 Alert.show()
                
                
            }
    }


    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    

    @IBAction func Submit(sender: AnyObject) {
        
        var msg = ""
        
        
        let email = email_txt.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        let mobile = mobile_txt.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if name_txt.text==""{
            
           msg = "Please enter name."
            
        }else if email==""{
            
            msg = "Please enter email id."
            
        }else if !vastuValidation.validateEmail(email) {
            
            msg = "Please enter valid email id."
            
        }else if city_txt.text==""{
            
            msg = "Please enter City."
            
        }else if mobile==""{
            
           msg = "Please enter  mobile number."
            
        }else if !vastuValidation.validatePhoneNumber(mobile) {
            
            msg = "please enter 10-digit mobile number."
            
        }
    
        if msg != ""{
            
            let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
    
        }else{
        
           var passDict = [String:AnyObject]()
        
        if let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as? String {
            
            activity_indicator.hidden = false
            
            activity_indicator.startAnimating()
            
            passDict = ["name":name_txt.text!,"email":email_txt.text!,"city":city_txt.text!,"mobile_no":mobile_txt.text!,"device_id":Device_id]
            
            vastuTipsConn.startConnectionWithString("user_info", httpMethodType:Post_Type, httpBodyType:passDict) { (receivedData) -> Void in
            
                
                if self.vastuTipsConn.responseCode() == 1{
                    
                    self.name_txt.text = ""
                    self.email_txt.text = ""
                    self.city_txt.text = ""
                    self.mobile_txt.text = ""

                    var arr:NSDictionary?
                    
                    arr = receivedData
                    
                    msg = ( arr?.valueForKey("msg") as? String)!
                    
                  if msg=="successfully"{
                    
                    
                  let Alert: UIAlertView = UIAlertView(title: "", message: "File downloding started.",
                        delegate: self, cancelButtonTitle: "Ok")
                    
                    Alert.show()
                    
                    
                    self.progressView.hidden = false
                    
                     self.progress_lbl.hidden = false
                    
                    let backgroundSessionConfiguration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("backgroundSession")
                    
                    self.backgroundSession = NSURLSession(configuration: backgroundSessionConfiguration,delegate: self, delegateQueue: NSOperationQueue.mainQueue())
                    
                   self.progressView.setProgress(0.0, animated: false)
                    
                    
                    let url = NSURL(string: "http://mars.promaticstechnologies.com/Vastukirpa/files/Tips_on_Vastushastra_by_www.vastukripa.com.pdf")!
                    
                    self.downloadTask = self.backgroundSession.downloadTaskWithURL(url)
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),{
                        
                        self.downloadTask.resume()
                        
                    })
                    
                    
                  }else {
                    
                    let alert = UIAlertController(title: " ", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                      }
                  }
                
                self.activity_indicator.hidden = true
                
                self.activity_indicator.startAnimating()

              }

            }
            
        }
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    @IBAction func tapstar_bages(sender: AnyObject) {
        
        let Alert: UIAlertView = UIAlertView(title: "Vastu Kripa", message: "Fill the details to Download this 10 page Vastu Tips E-Booklet instantly.",
            delegate: self, cancelButtonTitle: "Ok")
        
        Alert.show()
        
    }
}
