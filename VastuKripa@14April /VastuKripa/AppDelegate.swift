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
        
        
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        
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
            
            print(deviceTokenString)
            
            
            postString = postString.stringByReplacingOccurrencesOfString("-", withString: "", options:NSStringCompareOptions.LiteralSearch, range:nil)
            
            let setUserID = NSUserDefaults.standardUserDefaults()
            
            
            setUserID.setValue(postString, forKey: "device_ID")
            
                    
            self.registerDevice()
            
    }
    
    func application(
        application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: NSError
        ) {
            
            NSLog("Failed to get token; error: %@", error)
            
            
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
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "register")
                
                print("Your device register successfully")
                
            }
            
        }
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
        
        //NSUserDefaults.standardUserDefaults().setBool(false, forKey: "checkNotiction")
        
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
      // NSUserDefaults.standardUserDefaults().setBool(false, forKey: "checkNotiction")
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
       //  NSUserDefaults.standardUserDefaults().setBool(true, forKey: "checkNotiction")
    }
    
    
    func applicationDidBecomeActive(application: UIApplication) {
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
         // UIApplication.sharedApplication().applicationIconBadgeNumber = bages--
        

        
    }
    
//    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
//        
//        UIApplication.sharedApplication().applicationIconBadgeNumber = 3
//        
//        
//        //UIApplication.sharedApplication().applicationIconBadgeNumber = 0
//    }
//    
    
    func applicationWillTerminate(application: UIApplication) {
       
//        if NSUserDefaults.standardUserDefaults().boolForKey("cartlist") == true{
//            
//            let Alert: UIAlertView = UIAlertView(title: "Vastu Kripa", message: "",
//                delegate: self, cancelButtonTitle: "Ok")
//            
           // Alert.show()

            
        // }
        
        self.saveContext()
    }
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.xxxx.ProjectName" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] 
        }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("DataModelName", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
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
        
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        
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
                
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                abort()
            }
            }
        }
    }




