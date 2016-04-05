//
//  zeroNotificationViewController.swift
//  
//
//  Created by promatics on 2/24/16.
//
//

import UIKit

class zeroNotificationViewController: UIViewController {

    @IBOutlet weak var notification_lbl: UILabel!
    
    @IBOutlet weak var title_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     title_lbl.frame.origin.x = self.view.frame.size.width/2-title_lbl.frame.size.width/2
        
       notification_lbl.frame.origin.x = self.view.frame.size.width/2-notification_lbl.frame.size.width/2
        
       notification_lbl.frame.origin.y = self.view.frame.size.height/2-notification_lbl.frame.size.height/2

        // Do any additional setup after loading the view.
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
    @IBAction func back_btn_tuch(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }

}
