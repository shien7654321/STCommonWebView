//
//  STCommonWebViewConfiguration.swift
//  STCommonWebView
//
//  Created by Suta on 2020/11/5.
//  Copyright © 2020 Suta. All rights reserved.
//

import WebKit

public class STCommonWebViewConfiguration: WKWebViewConfiguration {
    
    public var startScript: String? {
        didSet {
            updateStartScript()
        }
    }
    public var endScript: String? {
        didSet {
            updateEndScript()
        }
    }
    
    override public init() {
        super.init()
        configVars()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configVars()
    }
    
    private func configVars() {
        
        allowsInlineMediaPlayback = true
        allowsAirPlayForMediaPlayback = true
        allowsPictureInPictureMediaPlayback = true
        
        processPool = STCommonWebViewProcessPool.shared
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        self.preferences = preferences
        
        let userContentController = WKUserContentController()
        
        if let cookies = HTTPCookieStorage.shared.cookies {
            if #available(iOS 11.0, *) {
                for cookie in cookies {
                    websiteDataStore.httpCookieStore.setCookie(cookie, completionHandler: nil)
                }
            } else {
                var cookieString = ""
                for cookie in cookies {
                    cookieString.append("document.cookie = '\(cookie.name)=\(cookie.value);path=/';")
                }
                let cookieUserScript = WKUserScript(source: cookieString, injectionTime: .atDocumentStart, forMainFrameOnly: false)
                userContentController.addUserScript(cookieUserScript)
            }
        }
        
        self.userContentController = userContentController
        
    }
    
    private func updateStartScript() {
        if let startScript = startScript {
            let startUserScript = WKUserScript(source: startScript, injectionTime: .atDocumentStart, forMainFrameOnly: false)
            userContentController.addUserScript(startUserScript)
        }
    }
    
    private func updateEndScript() {
        if let endScript = endScript {
            let endUserScript = WKUserScript(source: endScript, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
            userContentController.addUserScript(endUserScript)
        }
    }
    
}

