//
//  DashBoardViewController.swift
//  OAuthSample
//
//  Created by sinsoku on 2016/01/10.
//  Copyright © 2016年 sinsoku. All rights reserved.
//

import UIKit
import Alamofire

class DashBoardViewController: UIViewController {

    @IBOutlet weak var access_token: UILabel!
    
    @IBOutlet weak var apiResult: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        access_token.text = defaults.stringForKey("oauth_token")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickUser(sender: AnyObject) {
        apiResult.text = ""
        Alamofire.request(.GET, "https://api.github.com/user", parameters: ["access_token": access_token.text!])
            .responseJSON { response in
                if let json = response.result.value {
                    self.apiResult.text = json.description
                }
        }
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
