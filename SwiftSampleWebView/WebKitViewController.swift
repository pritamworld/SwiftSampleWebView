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
        myWebKitView.allowsBackForwardNavigationGestures = true
        
        loadFromString()
        
    }
    
    func loadFromString()
    {
        let htmlStr = "<h1>Hello World</h1>"
        myWebKitView.loadHTMLString(htmlStr, baseURL: nil)
    }
    
    func loadFromFile()
    {
        let localfilePath = Bundle.main.url(forResource: "home", withExtension: "html")
        let myRequest = URLRequest(url: localfilePath!)
        myWebKitView.load(myRequest)
        
    }
    
    func loadFromUrl()
    {
        //let url = URL(string: "https://www.youtube.com/watch?v=xQmZSKxOYvs")
        let url = URL(string: "https://www.google.com")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
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
