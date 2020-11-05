//
//  ViewController.swift
//  STCommonWebViewDemo
//
//  Created by Suta on 2020/11/5.
//  Copyright © 2020 Suta. All rights reserved.
//

import UIKit
import STCommonWebView

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        STCommonWebViewHelper.default.clearCache()
        let urlString = "https://www.apple.com"
        let request = URLRequest(url: URL(string: urlString)!)
        let webView = STCommonWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.load(request)
        view.addSubview(webView)
    }

}

