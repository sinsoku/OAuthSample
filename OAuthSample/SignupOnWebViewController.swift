//
//  SignupOnWebViewController.swift
//  OAuthSample
//
//  Created by sinsoku on 2016/01/10.
//  Copyright © 2016年 sinsoku. All rights reserved.
//

import UIKit
import OAuthSwift

class SignupOnWebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        webView.delegate = self
//        if let url = NSURL(string: "https://www.google.co.jp/") {
//            let application = UIApplication.sharedApplication()
//            if application.canOpenURL(url) {
//                application.openURL(url)
//            }
//        }
//        if let url = NSURL(string: "https://little-maid.herokuapp.com/") {
//            let urlReq = NSURLRequest(URL: url)
//            webView.loadRequest(urlReq)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request.URL)
        return true
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
