//
//  detailViewController.swift
//  
//
//  Created by Apple on 04/02/16.
//
//

import UIKit
import CoreData


class detailViewController: UIViewController , UIWebViewDelegate{

    @IBOutlet weak var addcart: UIButton!
   
    @IBOutlet weak var buy_btn: UIButton!
    
    @IBOutlet weak var add2cart_btn: UIButton!
    
    @IBOutlet weak var scrool_view: UIScrollView!
    
    @IBOutlet weak var description_webview: UIWebView!
    @IBOutlet weak var subdetail: UILabel!
    @IBOutlet weak var line_view: UIView!
    
    @IBOutlet weak var product_img: UIImageView!
    
    @IBOutlet weak var info_btn: UIButton!
    @IBOutlet weak var contact_btn: UIButton!
    
    @IBOutlet weak var navigation_title: UILabel!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var navigation_view: UIView!
    
    @IBOutlet weak var name_lbl: UILabel!
    
    @IBOutlet weak var desc_lbl: UILabel!
    
    @IBOutlet weak var detail_lbl: UILabel!
    
    @IBOutlet weak var price_lbl: UILabel!
    
     var index = 0
    
    var numberArray:[Int] = []
    
    var quantity_data = [0,0,0,0,0,0,0,0,0]
    
    
       var passed_value_array  = []
    
    var passed_value = [String():[]]
    
    var product_id : Int!
    
    var product_data  = [
        
        "Img":[
            "product_1_detail",
            "product_8_detail",
            "product_3_detail",
            "product_5_detail",
            "product_2_detail",
            "product_10_detail",
            "product_7_detail",],
        
        
        
        "name":[
            "Divine Connect Vedic Yantra Frame",
            "Kuber Devta Yantra Kit",
            "Vastu Vitalizer Pyramid",
            "Power Grid Stick",
            "Happy Relationship Yantra",
            "Vastu Rectification Kit.",
            "Ek Onkar Symbol"],
        
        
        "desc":[
            "For all Home, Workpalce & Factories.",
            "Opens up new avenues & opportunities.",
            "For all Home, Workpalce & Factories.",
            "To create a powerful energy field.",
            "For peace, love, harmony.",
            "Product Description here",
            "Symbol to Safeguard your permises."
        ],
        
        "price":[
            "2320.00",
            "1260.00",
            "880.00",
            "1960.00",
            "2150.00",
            "1560.00",
            "300.00",
        ]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         passed_value = ["product_id" : [index],
            "productname":[product_data["name"]![index]],"productprice":[product_data["price"]![index]],"productimage":[product_data["Img"]![index]]]
        
        print(passed_value)
        
        
        product_img.layer.borderWidth = 2
        
        product_img.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        navigation_view.frame.size.width = self.view.frame.size.width
        
        navigation_title.text = "Vastu Product Detail"
        
        navigation_title.frame.origin.x = (self.view.frame.size.width - navigation_title.frame.size.width)/2
        
        
        
        if self.view.frame.size.height<=568{
            
            
            product_img.frame.size.width = 170
            
            product_img.frame.size.height = 170
            
        }
        
        product_img.frame.origin.x = (self.view.frame.size.width - product_img.frame.size.width)/2
        
        name_lbl.frame.origin.x = (self.view.frame.size.width - name_lbl.frame.size.width)/2+3
    
        
        line_view.frame.size.width = self.view.frame.width
        
        index = NSUserDefaults.standardUserDefaults().valueForKey("zero") as! Int

        
     //   buy_btn.frame.origin.x = ((self.view.frame.size.width - buy_btn.frame.size.width)/2)-60

        
        
        //passed_value_array.addObject(passed_value)
        
        switch index{
        
        case 0 :
 
            
            product_img.image = UIImage(named: product_data["Img"]![0])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10

            name_lbl.text = product_data["name"]![0]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![0]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            if self.view.frame.size.height<1024{
            
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("divineConnect", ofType:"html")!)
            
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
           
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("divineConnect_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                

            }
            
            
            break
            
            
        case 1 :
            
            product_img.image = UIImage(named: product_data["Img"]![1])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![1]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![1]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            

            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kit", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("kit_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
        case 2 :
            
            product_img.image = UIImage(named: product_data["Img"]![2])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![2]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![2]
            
            price_lbl.sizeToFit()
            
             price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
           
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuVitalizer", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuVitalizer_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            

            break
            
        case 3 :
            
            
            product_img.image = UIImage(named: product_data["Img"]![3])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![3]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![3]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("gridStick", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("gridStick_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            
            break
            
        case 4:
            
            product_img.image = UIImage(named: product_data["Img"]![4])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![4]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![4]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("happyRelationshipYantra", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("happyRelationshipYantra_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }


            
            
            break
            
        case 5:
            
            product_img.image = UIImage(named: product_data["Img"]![5])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![5]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            
            price_lbl.text = product_data["price"]![5]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
             description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height+10
            
            
            if self.view.frame.size.height<1024{
                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
                
            }else{
                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
            }

            
            
            break
            
        case 6:
            
            product_img.image = UIImage(named: product_data["Img"]![6])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![6]
            
            name_lbl.numberOfLines = 2
            
            //name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![6]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10

            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
//        case 7:
//            
//            product_img.image = UIImage(named: product_data["Img"]![7])
//            
//            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
//            
//            name_lbl.text = product_data["name"]![7]
//            
//            name_lbl.numberOfLines = 2
//            
//            // name_lbl.sizeToFit()
//            
//            price_lbl.text = product_data["price"]![7]
//            
//            price_lbl.sizeToFit()
//            
//            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
//            
//            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
//            
//            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
//            
//            description_webview.frame.origin.y = line_view.frame.origin.y + 20
//            
//            
//            if self.view.frame.size.height<1024{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//                
//            }else{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar_ipad", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//            }
//
//            
//            break
//            
//        case 8:
//            
//            
//            product_img.image = UIImage(named: product_data["Img"]![8])
//            
//            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
//            
//            name_lbl.text = product_data["name"]![8]
//            
//            name_lbl.numberOfLines = 2
//            
//            // name_lbl.sizeToFit()
//            
//            price_lbl.text = product_data["price"]![8]
//            
//            price_lbl.sizeToFit()
//            
//            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
//            
//            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
//            
//            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
//            
//            description_webview.frame.origin.y = line_view.frame.origin.y + 20
//        
//            if self.view.frame.size.height<1024{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("boundryStrip", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//                
//            }else{
//                
//                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("boundryStrip_ipad", ofType:"html")!)
//                
//                let request = NSURLRequest(URL: url)
//                description_webview.loadRequest(request)
//            }
//
//            
//            break
//            
//         case 9:
//        
//        
//        product_img.image = UIImage(named: product_data["Img"]![9])
//        
//        name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
//        
//        name_lbl.text = product_data["name"]![9]
//        
//        name_lbl.numberOfLines = 2
//        
//        // name_lbl.sizeToFit()
//        
//        price_lbl.text = product_data["price"]![9]
//        
//        price_lbl.sizeToFit()
//        
//        price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
//        
//        price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
//        
//        line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
//        
//        description_webview.frame.origin.y = line_view.frame.origin.y + 20
//        
//        
//        if self.view.frame.size.height<1024{
//            
//            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar", ofType:"html")!)
//            
//            let request = NSURLRequest(URL: url)
//            description_webview.loadRequest(request)
//            
//        }else{
//            
//            let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("ekOnkar_ipad", ofType:"html")!)
//            
//            let request = NSURLRequest(URL: url)
//            description_webview.loadRequest(request)
//        }
//        
//
//        
//        break
        
        default:
        
        break
        
        
    }
    

    

        // Do any additional setup after loading the view.
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        
        if self.view.frame.size.height==1024{
            
        description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height+15
            
        }else{
            
             description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height+10
            
        }
        description_webview.sizeToFit()
        
        
        scrool_view.contentSize = CGSize(width:self.view.frame.width, height:  description_webview.frame.size.height+description_webview.frame.origin.y)
        
        if scrool_view.contentSize.height < scrool_view.frame.size.height{
            
            description_webview.scrollView.userInteractionEnabled = false
        }
        
        
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
    
    
    @IBAction func cart_btn_prsd(sender: AnyObject) {
        
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("cartPageVC") as! cartPageViewController
        
        self.navigationController!.pushViewController(secondViewController, animated: true)
        
        
    }
    
@IBAction func AddtoCart_btn_prsd(sender: AnyObject) {
    
    
    let temp = NSUserDefaults.standardUserDefaults().valueForKey("zero") as! Int
  
   // NSUserDefaults.standardUserDefaults().setValue(temp, forKey:"inde")
    
    var indexArr : [Int] = []
    
    
    
    if NSUserDefaults .standardUserDefaults().boolForKey("setIndex"){
        
        NSUserDefaults.standardUserDefaults().setObject(product_data, forKey: "product_data")
        
        
        indexArr = NSUserDefaults .standardUserDefaults() .valueForKey("indexArr") as! [Int]
        
     quantity_data = NSUserDefaults .standardUserDefaults().valueForKey("quantity_data") as! [Int]
        
        

        
            
            
        //quantity_data[temp] =  quantity_data[temp]+1

    
            
        indexArr.append(temp)
            
        NSUserDefaults .standardUserDefaults().setObject(indexArr, forKey: "indexArr")
            
        quantity_data = NSUserDefaults .standardUserDefaults().valueForKey("quantity_data") as! [Int]
            
        quantity_data[temp] = 1

            
        
      NSUserDefaults.standardUserDefaults().setObject(quantity_data, forKey: "quantity_data")
        
        print(temp)
        
        print("  arr ")
        
        print(quantity_data)
       
    }else {
        
        
        quantity_data[temp] = 1
        
        NSUserDefaults.standardUserDefaults().setObject(quantity_data, forKey: "quantity_data")
        
        NSUserDefaults.standardUserDefaults().setObject(product_data, forKey: "product_data")
        
        indexArr.append(temp)
        
        NSUserDefaults .standardUserDefaults().setBool(true, forKey: "setIndex")
        
       NSUserDefaults .standardUserDefaults().setObject(indexArr, forKey: "indexArr")
 
    }
    
    let alert = UIAlertController(title: "Added", message: "Item Saved to Cart", preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func buy_btn_prsd(sender: AnyObject) {
    }
}
