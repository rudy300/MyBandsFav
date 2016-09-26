//
//  DetailViewController.swift
//  MyBands
//
//  Created by Charles Konkol on 2015-10-05.
//  Copyright © 2015 Chuck Konkol. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //Ignore Errors until you have complete code changes in DetailViewController.swift.txt
    
    //1) Comment out detailDescriptionLabel
    
    // @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var productimageView: UIImageView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            //2) Comment out self.configureView()
            //self.configureView()
        }
    }
    
    //Errors will start going away from MasterViewController
    //3) Add didSet for productName
    var productName: String? {
        didSet {
            
        }
    }
    
    //4) Add didSet for productURL
    var productURL: NSString? {
        didSet {
            // Update the view.
            // self.configureView()
        }
    }
    
    
    //5) Modify func configureView() Ignore warnings
    
    func configureView() {
        // Update the user interface for the detail item.
        // Update image if detailItem has been passed a value from MasterViewController Seque
        if let detail: AnyObject = self.detailItem {
            productimageView.image = UIImage(named:productURL! as String)
            
        }
    }
    
    //6) Modify override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        print("Product URL: \(productURL)")
        print("Product Name: \(productName)")
        if productName == nil
        {
            productimageView.image = UIImage(named:"Main.png")
        }
        title = productName
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//7) Set Constraints. Click on "ViewController" title bar in StoryBoard (until yellow circle is highlighted) and select from menu: "Editor > Resolve Layout Issues > Reset to Siggested Constraints"

//8) Save

//9) Compile (Command + R) & TEST
