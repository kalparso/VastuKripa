//  NewRevealViewController.swift
//  Created by promatics on 2/16/16.

import UIKit

class NewRevealViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
 
    var check:Bool = false
    
    var controller = homeViewController()
    
    @IBOutlet weak var tbl_view: UITableView!
    
    
    var viewContrl:UIViewController?
    
    var nav:UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NSUserDefaults.standardUserDefaults().setObject(1, forKey: "set")
      
        nav = self.revealViewController().frontViewController as? UINavigationController
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  viewWillAppear(animated: Bool) {
    
     tbl_view.userInteractionEnabled = true
        
        
    }
    override func  viewWillDisappear(animated: Bool) {
        
        //revealViewController().frontViewController.view.userInteractionEnabled = true
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        if self.view.frame.size.height>568
        {
            
            tbl_view.scrollEnabled = false
            
        }
        
        return 1

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if indexPath.row == 0{
            
            if self.view.frame.size.height == 1024{
                
                return 200
                
            }else{
                
                
                return 150;
                
            }
            
        } else {
            
            if self.view.frame.size.height == 1024{
                
                return 70
                
            }else{
                
                
                return 47;
                
            }
        }
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        if(indexPath.row == 0){
            
            var cell : userTableViewCell! = tableView.dequeueReusableCellWithIdentifier("userCell") as! userTableViewCell
            
            if(cell == nil)
            {
                cell = NSBundle.mainBundle().loadNibNamed("userCell", owner: self, options: nil)[0] as! userTableViewCell;
            }
            
            cell.user_img.layer.cornerRadius =  45
            
            cell.userImg_btn.layer.cornerRadius =  45.0
            
            cell.selectionStyle=UITableViewCellSelectionStyle.None
            
          //  cell.backgroundColor = navigation_view.backgroundColor
            //return cell as homeTableViewCell
            
            return cell
            
        } else {
            
            var cell : menuTableViewCell! = tableView.dequeueReusableCellWithIdentifier("menuCell") as! menuTableViewCell
            
            if(cell == nil)
            {
                cell = NSBundle.mainBundle().loadNibNamed("menuCell", owner: self, options: nil)[0] as! menuTableViewCell;
            }
            
            if indexPath.row == 1
            {
                
                cell.menuName_lbl.text = "About Vastu"
                
                //var image : UIImage = UIImage(named:"about_i")!
                
                cell.icon_img.image = UIImage(named: "logo")
                
                // cell.icon_img = UIImageView(image: image)
                
                
            } else if indexPath.row == 2 {
                
                cell.menuName_lbl.text = "Benefits"
                
                cell.icon_img.image = UIImage(named: "benefit_i")
                
                
                
            }else if indexPath.row == 3 {
                
                cell.menuName_lbl.text = "Check Your Property Vastu Score"
                cell.menuName_lbl.lineBreakMode = NSLineBreakMode.ByWordWrapping
                cell.menuName_lbl.numberOfLines = 2
                
                cell.menuName_lbl.sizeToFit()
                
                cell.icon_img.image = UIImage(named: "property_i")
                
                
                
            } else if indexPath.row == 4 {
                
                cell.menuName_lbl.text = "Online Vastu"
                
                cell.icon_img.image = UIImage(named: "online_i")
                
            } else if indexPath.row == 5 {
                
                cell.menuName_lbl.text = "Onsite Vastu"
                
                cell.icon_img.image = UIImage(named: "advance_i")
                
            } else if indexPath.row == 6 {
                
                cell.menuName_lbl.text = "Vastu Products"
                
                
                cell.icon_img.image = UIImage(named: "product_i")
                
                
            } else if indexPath.row == 7 {
                
                cell.menuName_lbl.text = "Vastu Tips"
                
                cell.icon_img.image = UIImage(named: "tips_i")
                
                
            } else if indexPath.row == 8 {
                
                cell.menuName_lbl.text = "Consult Now"
                
                cell.icon_img.image = UIImage(named: "cunsult_i")
                
                
            }else if indexPath.row == 9 {
                
                cell.menuName_lbl.text = "Contact us"
                
                cell.icon_img.image = UIImage(named: "contact_i")
                
                
            } else if indexPath.row == 10 {
                
                cell.menuName_lbl.text = "Share"
                
                cell.icon_img.image = UIImage(named: "share_i")
                
            } else if indexPath.row == 11 {
                
                cell.menuName_lbl.text = "Download Vastu Tips E-Booklet"
                
                cell.menuName_lbl.lineBreakMode = NSLineBreakMode.ByWordWrapping
                
                cell.menuName_lbl.numberOfLines = 2
                
                  cell.menuName_lbl.sizeToFit()
                
                cell.icon_img.image = UIImage(named: "filedownload" )
                
            }
            
            
            cell.selectionStyle=UITableViewCellSelectionStyle.None
            
            
            
            return cell
            
            
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
      //  locationManager.stopUpdatingHeading()
        
       // locationManager.stopUpdatingLocation()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        if indexPath.row == 0 {
            
           toProfileVC()
            
        } else if indexPath.row == 1 {
            
           toAboutVastu()
            
        } else if indexPath.row == 2 {
            
           toBenefits()
            
        }else if indexPath.row == 3 {
            
            toSelectPlace()
            
        } else if indexPath.row == 4 {
            
            toOnline()
            
        } else if indexPath.row == 5 {
            
            toAdvance()
            
        } else if indexPath.row == 6 {
            
            toProduct()
            
        } else if indexPath.row == 7 {
            
            toVastuTip()
            
        } else if indexPath.row == 8 {
            
           toConsult()
            
        } else if indexPath.row == 9 {
            
           toContact()
            
        } else if indexPath.row == 10 {
            
            
            let sharingItems = ["https://play.google.com/store/apps/details?id=com.vastukripa"]
            
            let activityViewController = UIActivityViewController(activityItems: sharingItems, applicationActivities: nil)
            
            //if iPhone
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone) {
                
                self.presentViewController(activityViewController, animated: true, completion: nil)
            } else {
                
                let popoverCntlr = UIPopoverController(contentViewController: activityViewController)
                popoverCntlr.presentPopoverFromRect(CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 0, 0), inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
                
            }
        }else if indexPath.row == 11 {
            
        
            
            todownloadFile()
            
            
        }

    }
    
        func toProfileVC() {
        
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(profileViewController) {
                    
                    viewContrl = viewController as! profileViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! profileViewController, animated:false)
            
        }else {
            
            let vc :profileViewController! = storyboard?.instantiateViewControllerWithIdentifier("profileVC") as? profileViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
    }
    
    
    
    func toAboutVastu()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(aboutVastuViewController) {
                    
                    viewContrl = viewController as! aboutVastuViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! aboutVastuViewController, animated:false)
            
        }else {
            
            let vc :aboutVastuViewController! = storyboard?.instantiateViewControllerWithIdentifier("aboutVC") as? aboutVastuViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
    }
    
    
    
    func toBenefits()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(benefitsViewController) {
                    
                    viewContrl = viewController as! benefitsViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! benefitsViewController, animated:false)
            
        }else {
            
            let vc :benefitsViewController! = storyboard?.instantiateViewControllerWithIdentifier("benefitVC") as? benefitsViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)

    }
    
    func toSelectPlace()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(selectPlacesViewController) {
                    
                    viewContrl = viewController as! selectPlacesViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! selectPlacesViewController, animated:false)
            
        }else {
            
            let vc :selectPlacesViewController! = storyboard?.instantiateViewControllerWithIdentifier("placeVC") as? selectPlacesViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        

    }
    
    
    func toOnline()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(onlineVastuViewController) {
                    
                    viewContrl = viewController as! onlineVastuViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! onlineVastuViewController, animated:false)
            
        }else {
            
            let vc :onlineVastuViewController! = storyboard?.instantiateViewControllerWithIdentifier("onlineVastuVC") as? onlineVastuViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
        
    }

    func toAdvance()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(advanceVastuViewController) {
                    
                    viewContrl = viewController as! advanceVastuViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! advanceVastuViewController, animated:false)
            
        }else {
            
            let vc :advanceVastuViewController! = storyboard?.instantiateViewControllerWithIdentifier("advanceVastuVC") as? advanceVastuViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
        
    }
    
    func toProduct()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(productsViewController) {
                    
                    viewContrl = viewController as! productsViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! productsViewController, animated:false)
            
        }else {
            
            let vc :productsViewController! = storyboard?.instantiateViewControllerWithIdentifier("productVC") as? productsViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
        
    }
    func toVastuTip()
    {
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(vastuTipsViewController) {
                    
                    viewContrl = viewController as! vastuTipsViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! vastuTipsViewController, animated:false)
            
        }else {
            
            let vc :vastuTipsViewController! = storyboard?.instantiateViewControllerWithIdentifier("vastuTipsVC") as? vastuTipsViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
        
    }

    func toConsult() {
        
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(consultNowViewController) {
                    
                    viewContrl = viewController as! consultNowViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! consultNowViewController, animated:false)
            
        }else {
            
            let vc :consultNowViewController! = storyboard?.instantiateViewControllerWithIdentifier("consultNowVC") as? consultNowViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
    }
    

    func toContact() {
        
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(contactUsViewController) {
                    
                    viewContrl = viewController as! contactUsViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! contactUsViewController, animated:false)
            
        }else {
            
            let vc :contactUsViewController! = storyboard?.instantiateViewControllerWithIdentifier("contactUsVC") as? contactUsViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
    }
    
    func todownloadFile() {
        
        check = false;
        
        if let vcs  = nav?.viewControllers {
            
            for viewController in (vcs) {
                
                if viewController.isKindOfClass(getDetailViewController) {
                    
                    viewContrl = viewController as! getDetailViewController
                    
                    check = true
                    
                    break
                }
                
            }
            
        }
        
        if(check) {
            
            nav!.popToViewController(viewContrl as! getDetailViewController, animated:false)
            
        }else {
            
            let vc :getDetailViewController! = storyboard?.instantiateViewControllerWithIdentifier("getdetail") as? getDetailViewController
            
            nav!.pushViewController(vc, animated:true)
            
        }
        
        self.revealViewController().revealToggleAnimated(true)
        
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
