//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Abhinav Mathur on 7/14/16.
//  Copyright © 2016 Abhinav Mathur. All rights reserved.
//

import UIKit


class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts = [NSDictionary]()

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        let clientId = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
                                                                      completionHandler: { (dataOrNil, response, error) in
                                                                        if let data = dataOrNil {
                                                                            if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                                                                                data, options:[]) as? NSDictionary {
                                                                                //NSLog("response: \(responseDictionary)")
                                                                                if let resp =  responseDictionary["response"] as? NSDictionary {
                                                                                   // NSLog("resp:\(resp)")
                                                                                    if let temp = resp["posts"] as? [NSDictionary] {
                                                                                        self.posts = temp;
                                                                                        self.myTableView.reloadData()
                                                                                        //NSLog("posts:\(self.posts)")
                                                                                    }
                                                                                    
                                                                                }
                                                                            }
                                                                        }
                                                                       
                                                                        
                                                                        
        });
        task.resume()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCellWithIdentifier("TumblrViewCell", forIndexPath: indexPath) as! TumblrViewCell
       // NSLog("1\n: \(posts[indexPath.row])")
        if let temp = posts[indexPath.row] as? NSDictionary {
            //NSLog("temp:\(temp)")
            if let photos = temp["photos"] as? [AnyObject] {
                NSLog("photos:\(photos)")
                if let p = photos[0] as? NSDictionary {
                    if let orgImg = p["original_size"] as? NSDictionary {
                        if let url = orgImg["url"] as? String {
                           cell.tumblrImage.setImageWithURL(NSURL(fileURLWithPath: url))
                           cell.titleLabel.text = url
                        }
                    }
                 }
            }
        } else {
           NSLog("temp is null");
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var vc = segue.destinationViewController as! PhotoDetailsViewController
        if let indexPath = myTableView.indexPathForCell(sender as! UITableViewCell) {
            if let temp = posts[indexPath.row]["image_permalink"] as? String {
                vc.text = temp
            }
        }
    }
    

}
