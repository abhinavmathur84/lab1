//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Abhinav Mathur on 7/14/16.
//  Copyright © 2016 Abhinav Mathur. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = text
        detailImgView.setImageWithURL(NSURL(string : text)!)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var detailImgView: UIImageView!

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

}
