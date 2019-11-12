//
//  WebKitViewController.swift
//  SampleWebView
//
//  Created by moxDroid on 2019-11-12.
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
        
        //self.loadFromString()
        self.loadFromUrl()
        //self.loadFromFile()
        
    }
    
    //
    func loadFromString()
    {
        let htmlStr = """
                            <h1>Hello World</h1>
                            <h2>Hello World</h2>
                            <h3>Hello World</h3>
                            <h4>Hello World</h4>
                            <h5>Hello World</h5>
                            <h6>Hello World</h6>
                      """
        myWebKitView.loadHTMLString(htmlStr, baseURL: nil)
    }
    
    func loadFromFile()
    {
        let localfilePath = Bundle.main.url(forResource: "home", withExtension: "html")
        let myRequest = URLRequest(url: localfilePath!)
        myWebKitView.load(myRequest)
        //myWebKitView.loadFileURL(<#T##URL: URL##URL#>, allowingReadAccessTo: <#T##URL#>)
        
    }
    
    func loadFromUrl()
    {
        //let url = URL(string: "https://www.youtube.com/watch?v=xQmZSKxOYvs")
        let url = URL(string: "https://www.lambtoncollege.ca/")
        //let url = URL(string: "https://www.google.com")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
    }

    @IBAction func webBrowserAction(_ sender: UIBarButtonItem)
    {
        switch sender.tag {
        case 0:
            //myWebKitView.go(to: myWebKitView.backForwardList.item(at: 0)!)
            myWebKitView.reloadFromOrigin()
        case 1:
            //myWebKitView.go(to: myWebKitView.backForwardList.forwardItem!)
            if myWebKitView.canGoForward
            {
                myWebKitView.goForward()
            }
            
        case 2:
            //myWebKitView.go(to: myWebKitView.backForwardList.backItem!)
            myWebKitView.goBack()
        case 3:
            myWebKitView.reload()
        default:
            print("NO Action")
        }
    }
}
