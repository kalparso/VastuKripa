
//  EnquiryViewController.swift
//  VastuKripa
//
//  Created by Promatics on 1/9/16.
//  Copyright © 2016 promatics. All rights reserved.


import UIKit

class EnquiryViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,UIAlertViewDelegate {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var contact_btn: UIButton!
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var navigation_view: UIView!
    @IBOutlet weak var detail_View: UIView!
    @IBOutlet weak var submit_btn: UIButton!
    @IBOutlet weak var quary_textview: UITextView!
    @IBOutlet weak var details_textview: UITextView!
    @IBOutlet weak var property_textview: UITextView!
    @IBOutlet weak var city_text: UITextField!
    @IBOutlet weak var street_text: UITextField!
    @IBOutlet weak var contact_text: UITextField!
    @IBOutlet weak var company_text: UITextField!
    @IBOutlet weak var name_text: UITextField!
    @IBOutlet weak var scroll_View: UIScrollView!
    
    let submitQueryConn:WebServiceConnection = WebServiceConnection.connectionManager() as! WebServiceConnection
    
     let vastuValidation:Validation = Validation.validationManager() as! Validation
    
    var activeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        indicator.frame.origin.x = self.view.frame.size.width/2 - indicator.frame.size.width/2
        
        indicator.frame.origin.y = self.view.frame.size.height/2 - indicator.frame.size.height/2
        
        indicator.hidden = true
        
        UITextField .appearance().tintColor = UIColor.lightGrayColor()
        
        if self.view.frame.size.height==1024{
            
            name_text.frame.size.height = 45
            
            name_text.frame.origin.y = name_text.frame.origin.y+10
            
            email_text.frame.size.height = 45
            
            email_text.frame.origin.y = email_text.frame.origin.y+20
            
            company_text.frame.size.height = 45
            
            company_text.frame.origin.y = company_text.frame.origin.y+30
            
            contact_text.frame.size.height = 45
            
            contact_text.frame.origin.y = contact_text.frame.origin.y+40
            
            street_text.frame.size.height = 45
            
            street_text.frame.origin.y = street_text.frame.origin.y+50
            
            city_text.frame.size.height = 45
            
            city_text.frame.origin.y = city_text.frame.origin.y+60
            
            property_textview.frame.origin.y = property_textview.frame.origin.y+70
            
            details_textview.frame.origin.y = details_textview.frame.origin.y+60
            
            quary_textview.frame.origin.y = quary_textview.frame.origin.y+42
            
            submit_btn.frame.size.height = 45
            
            submit_btn.frame.origin.y = submit_btn.frame.origin.y+60
            
        }
        
         navigation_title.frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        }
        
        submit_btn.layer.cornerRadius = 5.0
        
        scroll_View.frame.size.width = self.view.frame.size.width

        detail_View.frame.origin.x = (self.view.frame.size.width-detail_View.frame.size.width)/2
        
        submit_btn.backgroundColor = navigation_view.backgroundColor
        
        scroll_View.contentSize = CGSize(width:self.view.frame.size.width, height:submit_btn.frame.origin.y+submit_btn.frame.size.height+20)
        
        details_textview.layer.borderWidth = 1.0
        
        details_textview.textColor = UIColor.lightGrayColor()
        
        details_textview.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        property_textview.layer.borderWidth = 1.0
        
        property_textview.textColor = UIColor.lightGrayColor()
        
        property_textview.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        quary_textview.layer.borderWidth = 1.0
        
        quary_textview.textColor = UIColor.lightGrayColor()
        
        quary_textview.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        details_textview.layer.cornerRadius = 5
        
        property_textview.layer.cornerRadius = 5
        
        quary_textview.layer.cornerRadius = 5
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        //navigation_view.hidden = false
        
        contact_btn.hidden = true
        
        navigation_title.text = "Enquiry"
        
        self.navigationController?.navigationBarHidden = true
        
    
    }

    @IBAction func SubmitDetails(sender: AnyObject) {
        
        var msg = ""
        
        let name = name_text.text
        
        let fromRecipents = email_text.text
    
        
        if name==""{
            
              msg = "Name is required."
            
            
            
        }else if fromRecipents==""{
           
              msg = "Email id is required."
            
            
        }else if !vastuValidation.validateEmail(fromRecipents) {
            
              msg = "Please enter valid Email id."
            
        }
        
        if msg != ""{
          
            let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{

        
            indicator.hidden = false
            
            indicator.startAnimating()
            
            var passDict = [String:AnyObject]()
            
                
            passDict = ["name":name_text.text!,"email":email_text.text!,"company":company_text.text!,"contact_no":contact_text.text!,"address":street_text.text!,"city":city_text.text!,"property":property_textview.text!,"details":details_textview.text!,"message":quary_textview.text!]
            
                submitQueryConn.startConnectionWithString("save_message", httpMethodType:Post_Type, httpBodyType:passDict) { [unowned self] (receivedData) -> Void in
                    
                    if self.submitQueryConn.responseCode() == 1{
                        
                        self.indicator.hidden = true
                        
                        self.indicator.stopAnimating()
                        
                        var arr:NSDictionary?
                        
                        arr = receivedData!
                        
                        self.name_text.text = ""
                        
                        self.company_text.text = ""
                        
                        self.contact_text.text = ""
                        
                        self.street_text.text = ""
                        
                        self.city_text.text = ""
                        
                        self.property_textview.text = ""
                        
                        self.details_textview.text = ""
                        
                        self.quary_textview.text = ""
                        
                        self.email_text.text = ""
                        
                        msg = arr?.valueForKey("msg") as! String
                        
                         if msg == "successfully"{
                            
                            let alert = UIAlertController(title: "Vastu Kripa", message: "Enquiry submit successfully.", preferredStyle: UIAlertControllerStyle.Alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                        }
                    }
                
                    self.indicator.hidden = true
                    
                    self.indicator.stopAnimating()
            }
        }
}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        

        
    }
    
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if textView == details_textview{
            
            if details_textview.textColor == UIColor.lightGrayColor() {
                
                details_textview.text = nil
                
                details_textview.textColor = UIColor.blackColor()
            }
        }else if textView == property_textview{
            
            if  property_textview.textColor == UIColor.lightGrayColor() {
                
                property_textview.text = nil
                
                property_textview.textColor = UIColor.blackColor()
            }
        
        }else if textView == quary_textview{
            
            if  quary_textview.textColor == UIColor.lightGrayColor() {
                
                quary_textview.text = nil
                
                quary_textview.textColor = UIColor.blackColor()
            }
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if details_textview.text.isEmpty {
            
            details_textview.text = "Size and details of Property"
            
            details_textview.textColor = UIColor.lightGrayColor()
            
        }else if quary_textview.text.isEmpty {
            
            quary_textview.text = "Your Query"
            
            quary_textview.textColor = UIColor.lightGrayColor()
            
        }else if property_textview.text.isEmpty {
            
            property_textview.text = "Property to be assessed"
            
            property_textview.textColor = UIColor.lightGrayColor()
        }
    }
    

    func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        
        activeField = textField
    
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        
        activeField = nil
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true;
    }
    
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func contact_btn_tuch(sender: AnyObject) {
        
        let subAdvancevastuView : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("contactUsViewController")
        
        self.showViewController(subAdvancevastuView as! UIViewController, sender: subAdvancevastuView)
    }
    
    
}