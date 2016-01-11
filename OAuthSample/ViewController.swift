//
//  ViewController.swift
//  OAuthSample
//
//  Created by sinsoku on 2016/01/10.
//  Copyright © 2016年 sinsoku. All rights reserved.
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signupWithOAuth(sender: AnyObject) {
        let oauthswift = OAuth2Swift(
            consumerKey:    "<Client ID>",
            consumerSecret: "<Client Secret>",
            authorizeUrl:   "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType:   "code"
        )
        oauthswift.authorizeWithCallbackURL(
            NSURL(string: "oauth-sample://oauth-callback")!,
            scope: "", state:"OAuthSample",
            success: { credential, response, parameters in
                print(credential.oauth_token)

                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setValue(credential.oauth_token, forKey: "oauth_token")

                let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("DashBoard")
                nextVC?.modalTransitionStyle = .CrossDissolve
                self.presentViewController(nextVC!, animated: true, completion: nil)
            },
            failure: { error in
                print(error.localizedDescription)
            }
        )
    }
}

