//
//  ViewController.swift
//  SampleWebView
//
//  Created by Pritesh Patel on 2017-04-05.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load HTML Page
        self.loadUrl()
       
        //Load HTML content from File
        //self.loadFile()
        
        //Load Text data
        //self.loadText()
       
        
        let htmlTitle = self.myWebView.stringByEvaluatingJavaScript(from: "document.title");
        print(htmlTitle)
        
        //let localFilePath = Bundle.main.path(forResource: "home", ofType:"txt");
        //let data = FileManager.default.contents(atPath: localFilePath!);
        //myWebView.loadData(data!, MIMEType: "application/txt", textEncodingName: "UTF-8", baseURL: url);
        
        //myWebView.goBack(); // uiwebview navigate back
        //myWebView.goForward(); // uiwebview navigate forward
        //myWebView.reload(); // to refresh the uiwebview
        //myWebView.stopLoading(); // to stop the loading from uiwebview
        
        let queue1 = DispatchQueue(label: "com.moxdroid.queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.moxdroid.queue2", qos: DispatchQoS.background)
        queue1.async {
            for i in 1..<10{
                print("DQ1",i)
            }
        }
        
        queue2.async {
            for i in 100..<110{
                print("DQ2",i)
            }
        }
    }

    
    private func loadUrl(){
        let url = NSURL (string: "https://www.lambtoncollege.ca/custom/LambtonApps/Programs/ProgramList-Toronto.aspx");
        let requestObj = NSURLRequest(url: url! as URL);
        self.myWebView.loadRequest(requestObj as URLRequest);
        
    }
    
    private func loadFile(){
        let localfilePath = Bundle.main.url(forResource: "home", withExtension: "html");
        let myRequest = NSURLRequest(url: localfilePath!);
        self.myWebView.loadRequest(myRequest as URLRequest);
    
    }
    
    private func loadText(){
        let htmlString:String! = "<h1>Welcome to Lambton College, Toronto!!!</h1>"
        self.myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

