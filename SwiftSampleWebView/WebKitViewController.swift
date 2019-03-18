//
//  WebKitViewController.swift
//  SampleWebView
//
//  Created by moxDroid on 2019-03-18.
//  Copyright © 2019 MoxDroid. All rights reserved.
//

import UIKit
import WebKit
//https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview
class WebKitViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myWebKitView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebKitView.navigationDelegate = self
        //self.view = myWebKitView

        let url = URL(string: "https://www.youtube.com/watch?v=xQmZSKxOYvs")
        myWebKitView.load(URLRequest(url: url!))
        
        myWebKitView.allowsBackForwardNavigationGestures = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
