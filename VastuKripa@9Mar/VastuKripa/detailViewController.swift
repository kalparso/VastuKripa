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
            "product_9_detail",
            "product_2_detail",
            
            "PlaceHolder",
            
            "product_4_detail",
            "product_6_detail",
            "product_7_detail",],
        
        
        
        "name":[
            "Divine Connect Vedic Yantra Frame",
            "Kuber Devta Yantra With Installation Kit",
            "Vastu Vitalizer Pyramid",
            "Power Grid Stick",
            "Vastu Energizer For Flooring",
            "Happy Relationship Yantra",
            
            "Product name heare",
            
            "Divine Oorja Cube",
            "Vastu Boundary Energy Strip",
            "Ek Onkar Symbol"],
        
        
        "desc":[
            "For all Home, Workpalce & Factories.",
            "Opens up new avenues & opportunities.",
            "For all Home, Workpalce & Factories.",
            "To create a powerful energy field.",
            "Energizes the environment.",
            "For peace, love, harmony.",
            
            "Product Description here",
            
            "For all Home, Workpalce & Factories.",
            "Symbol to Safeguard your permises.",
            "Symbol to Safeguard your permises."
        ],
        
        "price":[
            "2320.00",
            "1260.00",
            "880.00",
            "1960.00",
            "1114.00",
            "2150.00",
            
            "1560.00",
            
            "962.00",
            "900.00",
            "300.00",
    ]]

    
    var Desc = [
        
    "Benefits":    ["Optimizes your chances to gain:-\n * Helps to the environment and rectify the Vastu Doshas.\n * Experience peace, happiness, progress and success.\n * Minimize the negative effect of adverse Planetary positions.\n * Achieve Financial Growth and Stability of Finances",
        "* Rose Quartz Crystals is believed to enhance all forms of love: self-love, love, caring, kindness, platonic and romantic love. Rose Quartz Crystals encourages one to be tender, peaceful and gentle, emanates unconditional love and helps attract positive, gentle love.\n* It enhances forgiveness and tolerance.",
        "* Energizes the environment.\n* Neutralizes the Vastu Doshas.\n* Rectifies the energy imbalances.\n* Optimizes your chances to gain joy, progress and overall bliss.\n* Ideal for all homes, workplaces & factories.",
        "* Energizes the environment.\n* Neutralizes the Vastu Doshas.\n* Rectifies the energy imbalances.\n* Optimizes your chances to gain joy, progress and overall bliss.\n* Ideal for all homes, workplaces & factories.",
        "* Optimizes your chances to gain joy, progress and overall bliss.\n* Rectifies the energy imbalances.\n* Neutralizes the Vastu Doshas.\n* Energizes the environment.",
        "* Energizes the environment. Helps to rectify the Vastu Doshas and energy imbalances of irregular shaped plots and also irregular shaped rooms.",
        "* Sacred Symbol is a protective shield and helps to safeguard you and your premises from evil and negativity.\n* The Sacred Symbols attract beneficial powers which help to achieve peace, happiness, prosperity and reach your goals.\n* The Sacred SymbolsÂ  helps youÂ  in carrying your prayers to the Almighty and in effect brings you closer to Him.",
        "Optimizes your chances to gain:-\n* Monetary Benefits\n* Wealth Accumulation\n* Financial Growth\n* Stability of Finances",
        "* Energizes the environment.\n* Neutralizes the Vastu Doshas.\n* Optimizes your chances to gain joy, progress and overall bliss.\n* Ideal for all homes, workplaces & factories."],
        
        "install_head":["Where to Install :","How to Install :","Where to Install :","Where to Install :","Where to Install :","How to Install :","","Where to Install :","How to Install :"],
   
        "install_desc":["* Drill a screw / nail on the wall / cabinet. Install (hang) The Divine Connect Yantra Frame in the Poojasthan / Temple / North-East zone of the property.\n* Ideally install The Divine Connect Yantra Frame on the Eastern wall.\n* Install The Divine Connect Yantra Frame in the Home, Office, Shop and Factory.\n* Do not install on a toilet common wall or in an inauspicious zone.",
        
            "* Place the Happy Relationship Yantra on the Bedside Table or in the Cupboard / Drawer.",
            "* To enhance the energy level of rooms, place the Vastu Vitalizer Pyramid at the following zones:-\n* for better concentration and improved memory, Place the Vastu Vitalizer PyramidÂ on the Study Desk, Office Desk etc.\n* for enhancing the benefits from business and profession, Place the Vastu Vitalizer PyramidÂ on the Important Files, Documents, Billing Files, Collection Books, Filing Cabinets etc.\n* for improving the fund flow and for stability of finances, keep the Vastu Vitalizer PyramidÂ in the Tijori (Safety Vault).\n* for brisk sales, place the Vastu VitalizerÂ PyramidÂ on the Products / Merchandise",
            "* To enhance the energy level of rooms, Install the Divine Oorja Cube at the 4 corners of the rooms.\n* In-order to create a Divine Energy (Oorja) Grid within the property, we suggest to Install the Divine Oorja Cube at the 9 zones of the property ie. North-East, East, South-East, South, South-West, West, North-West, North and Brahmasthan (Center).\n* Install the Divine Oorja Cube on the â€˜Missing Corner / Cut Cornerâ€™ wall / zone.\n* Install the Divine Oorja Cube in the zones where you experience negativity, but, do not install on the toilet common wall, garbage area, bar, septic tank or in any inauspicious zones.",
            "* Install 1 Power Grid on each â€˜Missing Corner / Cut Cornerâ€™ wall / zone.\n* Install 1 Power Grid Stick above the Main Door Frame.\n* Install 1 Power Grid Stick behind (back) of the bed head-board (in the centre of the head-board). Install it at about 3 feet from floor level.\n* In-order to create a Supreme Power Energy (Oorja) Grid within the property, we suggest to Install the Power Grid Stick at the 9 zones of the property ie. North-East, East, South-East, South, South-West, West, North-West, North and Brahmasthan (Center).",
            "As per Vastushastra, it is suggested to have a rectangular shaped plot. Incase the Plot of Land is irregular shaped i.e. if any of the corners of the plot are extended or cut, it is suggested to create a ‘Physical Boundary Wall’ with bricks / stone (to separate/ cut off the extended corner of the plot). If it is not possible to create a ‘Physical ‘Vastu Boundary Wall’ then it is suggested to  create a ‘Virtual Vastu Boundary’ with the Vastu Boundary Energy Strips.\n\n*   Embed the Vastu Boundary Energy Strip beneath the ground level of the plot. Place it about 6 inches below the ground level.\n   * Install a Vastu Boundary Energy Strip after every 10 feet distance.\n   *Connect all the Vastu Boundary Energy Strip  with a Copper Patti or Copper Wire.*\n   At the Corners of the plot, install the Vastu Boundary Energy Strip at 90 degree so that it forms an’ L’ shape",
            "",
            "* Keep the Kuber Devta Yantra at Home, Office, Shop and Factory in the Tijori / Safe / Vault / Cash Drawer.",
            "* In order to virtually create a rectangular shaped plot, virtually create a rectangle and install 5 pieces of 'Vastu Energizer' at all the 4 virtual corners of the Plot.\n* At the Brahmasthaan (center of the plot), Install 9 pieces of 'Vastu Energizer' under the ground at a depth of about 1 feet.\n* Maintain a distance of about 12 inches between each 'Vastu Energizer for Flooring'.\n* Embed a Copper wire / strip beneath the ground level to create a virtual boundary wall in order to make a rectangular shape."]
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var i = index as Any
        
       
        
        
        
         passed_value = ["product_id" : [index],
            "productname":[product_data["name"]![index]],"productprice":[product_data["price"]![index]],"productimage":[product_data["Img"]![index]]]
        
        print(passed_value)
        
      //  dict.append(passed_value)
        
     //   addcart.frame.origin.x = self.view.frame.size.width-addcart.frame.size.width-10
        
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
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
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
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            

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
            
             description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
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
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
            
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
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuEnergizer", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("vastuEnergizer_ipad", ofType:"html")!)
                
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
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
            
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
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            

            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
        case 7:
            
            product_img.image = UIImage(named: product_data["Img"]![7])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![7]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![7]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
            
            
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("oorjaCube", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("oorjaCube_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
        case 8:
            
            
            product_img.image = UIImage(named: product_data["Img"]![8])
            
            name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
            
            name_lbl.text = product_data["name"]![8]
            
            name_lbl.numberOfLines = 2
            
            // name_lbl.sizeToFit()
            
            price_lbl.text = product_data["price"]![8]
            
            price_lbl.sizeToFit()
            
            price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
            
            price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
            
            line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
            
            description_webview.frame.origin.y = line_view.frame.origin.y + 20
        
            if self.view.frame.size.height<1024{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("boundryStrip", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
                
            }else{
                
                let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("boundryStrip_ipad", ofType:"html")!)
                
                let request = NSURLRequest(URL: url)
                description_webview.loadRequest(request)
            }

            
            break
            
         case 9:
        
        
        product_img.image = UIImage(named: product_data["Img"]![9])
        
        name_lbl.frame.origin.y = product_img.frame.origin.y + product_img.frame.size.height+10
        
        name_lbl.text = product_data["name"]![9]
        
        name_lbl.numberOfLines = 2
        
        // name_lbl.sizeToFit()
        
        price_lbl.text = product_data["price"]![9]
        
        price_lbl.sizeToFit()
        
        price_lbl.frame.origin.x = self.view.frame.size.width -  price_lbl.frame.size.width-10
        
        price_lbl.frame.origin.y =  name_lbl.frame.origin.y + name_lbl.frame.size.height+5
        
        line_view.frame.origin.y = price_lbl.frame.origin.y +  price_lbl.frame.size.height+10
        
        description_webview.frame.origin.y = line_view.frame.origin.y + 20
        
        
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
        
        default:
        
        break
        
        
    }
    

    

        // Do any additional setup after loading the view.
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        
        
        
        description_webview.frame.origin.y = line_view.frame.origin.y + line_view.frame.size.height 
        
        description_webview.sizeToFit()
        
        
       // buy_btn.frame.origin.y = description_webview.frame.origin.y + description_webview.frame.size.height + 5
        
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
