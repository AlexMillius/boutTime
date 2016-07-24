//
//  InfosViewController.swift
//  boutTime
//
//  Created by Mohamed Lee on 25.07.16.
//  Copyright © 2016 TumTum. All rights reserved.
//

import UIKit

class InfosViewController: UIViewController {
    
    
    @IBOutlet weak var infosWebView: UIWebView!

    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        if let requestURL = NSURL(string: url){
            let request = NSURLRequest(URL: requestURL)
            infosWebView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonTapped() {
        dismissViewControllerAnimated(true, completion: nil)
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
