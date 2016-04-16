//
//  AppDelegate.swift
//  VastuKripa
//
//  Created by promatics on 12/17/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var homeController = homeViewController()
    
    var m : Int! = 0
    
    var show :NSDictionary!
    
    var bages:Int = 0
    
    let getConn = WebServiceConnection.connectionManager() as! WebServiceConnection
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        IQKeyboardManager.sharedManager().enable = true
        
        let settings = UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: nil)
        
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        if let remoteNotification = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] as? NSDictionary {
            
            let data = remoteNotification.valueForKey("aps") as! NSDictionary

            NSUserDefaults.standardUserDefaults().setValue(data, forKey: "notification")
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Notiction")
        
           
        }
 
        return true
    }
    
    func application(
        application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData
        ) {
            
            let characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
            
            let deviceTokenString: String = ( deviceToken.description as NSString )
                .stringByTrimmingCharactersInSet( characterSet )
                .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
            
            var postString:String = deviceTokenString
            
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            let setUserID = NSUserDefaults.standardUserDefaults()
            
            
            setUserID.setValue(postString, forKey: "device_ID")
            
                    
            self.registerDevice()
            
    }
    
 func application(
        application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: NSError
        ) {

            
            
    }
    
func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
    
     UIApplication.sharedApplication().applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
    
    let data = userInfo["aps"] as! NSDictionary
    
       show  = data.valueForKey("alert") as! NSDictionary
    
        NSUserDefaults.standardUserDefaults().setValue(data, forKey: "notification")
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad){
        
        let story_Board = UIStoryboard(name:"Main_IPad", bundle:nil)
        
        let vc = story_Board.instantiateViewControllerWithIdentifier("tipsVC")
        
        self.window?.rootViewController?.presentViewController(vc, animated:true, completion:nil)
        
    }else{
        
        let story_Board = UIStoryboard(name:"Main_IPhone", bundle:nil)
        
        let vc = story_Board.instantiateViewControllerWithIdentifier("tipsVC")
        
        self.window?.rootViewController?.presentViewController(vc, animated:true, completion:nil)
        
        let bag:NSInteger = application.applicationIconBadgeNumber
        
        application.applicationIconBadgeNumber = bag-1
        
    }
    
    
 }
    
    
    func registerDevice(){
    
        
        var passDict = [String:AnyObject]()
        
    
        var postString:String = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as! String
        
        postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
        
        
        let setUserID = NSUserDefaults.standardUserDefaults()
        
        setUserID.setValue(postString, forKey: "device_ID")
        
        let Device_id = NSUserDefaults.standardUserDefaults().valueForKey("device_ID") as! String
        
        passDict = ["device_id":Device_id,"device_type":"IOS"]
        
        getConn.startConnectionWithString("pushDeviceId", httpMethodType:Post_Type, httpBodyType: passDict) { (recevedData) -> Void in
            
            print(recevedData)
            
            if(self.getConn .responseCode() == 1){
                
               
                
            }
            
        }
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
          }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
      // NSUserDefaults.standardUserDefaults().setBool(false, forKey: "checkNotiction")
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        }
    
    
    func applicationDidBecomeActive(application: UIApplication) {
        
        
        
    }
    

    
    func applicationWillTerminate(application: UIApplication) {
       

        
        self.saveContext()
    }
    lazy var applicationDocumentsDirectory: NSURL = {
        
       
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] 
        }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = NSBundle.mainBundle().URLForResource("DataModelName", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("ProjectName.sqlite")
        
        var error: NSError? = nil
        
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do{
        
         try coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        
        }catch{
        
            print("error")
        
        }
        
        return coordinator
        }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        
        
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
        }()
    
    func saveContext () {
        
        if let moc = self.managedObjectContext {
         
            do{
            
            try   moc.save()
                
            }catch{
                
                //abort()
                
            }
            }
        }
    }




