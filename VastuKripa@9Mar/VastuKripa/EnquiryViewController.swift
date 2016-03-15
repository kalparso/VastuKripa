//
//  EnquiryViewController.swift
//  VastuKripa
//
//  Created by Promatics on 1/9/16.
//  Copyright © 2016 promatics. All rights reserved.
//

import UIKit
import MessageUI

class EnquiryViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,UIAlertViewDelegate,MFMailComposeViewControllerDelegate  {
    
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
    
    var activeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        var frame = navigation_title.frame
        
        UITextField .appearance().tintColor = UIColor.lightGrayColor()

        
      //UITextField.appearance setTintColor:UIColor redColor
        
        frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        navigation_title.frame = frame
        
        if self.view.frame.size.width==375{
            
            contact_btn.frame.origin.x = navigation_title.frame.origin.x+navigation_title.frame.size.width+50
        }
        
        submit_btn.layer.cornerRadius = 5.0
        
        scroll_View.frame.size.width = self.view.frame.size.width
        
        frame = detail_View.frame
        
        frame.origin.x = (self.view.frame.size.width-detail_View.frame.size.width)/2
        
        detail_View.frame = frame;
        
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
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        //navigation_view.hidden = false
        
        contact_btn.hidden = true
        
        navigation_title.text = "Enquiry"
        
        self.navigationController?.navigationBarHidden = true
    }
    
    
    
    @IBAction func SubmitDetails(sender: AnyObject) {
        
        let name = name_text.text
        
        let company = company_text.text
        
        let contact = contact_text.text
        
        let street = street_text.text
        
        let city = city_text.text
        
        let property = property_textview.text
        
        let detail = details_textview.text
        
        let query = quary_textview.text
        
        
        if name==""{
            
            let  msg = "Name is required"
            
            let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        var all_data = "Name-"+name!
        
        if !company!.isEmpty{
            
            all_data  = all_data+"\nCompany-"+company!
            
        }
        if !street!.isEmpty{
            
            all_data  = all_data+"\nStreet-"+street!
            
        }
        if !contact!.isEmpty{
            
            all_data  = all_data+"\nContact-"+contact!
        }
        if !city!.isEmpty{
            
            all_data  = all_data+"\nCity-"+city!
        }
        if (property != "Property to be assessed" && !property.isEmpty){
            
            all_data  = all_data+"\nProperty-"+property
            
        }
        if (detail != "Size and details of Property" && !detail.isEmpty){
            
            all_data  = all_data+"\nDetail-"+detail
            
        }
        if (query != "Your Query" && !query.isEmpty){
            
            all_data  = all_data+"\nQuery-"+query
            
        }
 
        let emailTitle = "Enquiry"
        
        let messageBody = all_data
        
        let toRecipents = ["vastu.kripa@gmail.com"]
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        
        mc.setSubject(emailTitle)
        
        mc.setMessageBody(messageBody, isHTML: false)
        
        mc.setToRecipients(toRecipents)
        
        self.presentViewController(mc, animated: true, completion: nil)
        
        
    }
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        
         var msg = "";
        
        switch result.rawValue{
            
        case MFMailComposeResultCancelled.rawValue:
            
            print("Mail cancelled")
            
            msg = "Mail cancelled"
            
        case MFMailComposeResultSaved.rawValue:
            
            print("Mail saved")
            
            msg = "Mail saved"
            
            
        case MFMailComposeResultSent.rawValue:
            
            print("Mail sent")
            
            msg = "Mail sent"
            
            
        case MFMailComposeResultFailed.rawValue:
            
            print("Mail sent failure: %@", [error!.localizedDescription])
            
            
        default:
            break
        }
        
        if (!msg.isEmpty){
            
            let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK: MFMailComposeViewControllerDelegate
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
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