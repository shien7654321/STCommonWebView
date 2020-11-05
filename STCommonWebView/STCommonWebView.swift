//
//  STCommonWebView.swift
//  STCommonWebView
//
//  Created by Suta on 2020/11/5.
//  Copyright © 2020 Suta. All rights reserved.
//

import WebKit

public class STCommonWebView: WKWebView, WKNavigationDelegate, WKUIDelegate {
    
    convenience public init(frame: CGRect) {
        self.init(frame: frame, configuration: STCommonWebViewConfiguration())
    }
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        configureVars()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureVars()
    }
    
    private func configureVars() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        navigationDelegate = self
        uiDelegate = self
        allowsBackForwardNavigationGestures = true
        isOpaque = false
    }
    
    // MARK: - WKNavigationDelegate
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        STCommonWebViewHelper.default.webView(webView, decidePolicyFor: navigationResponse, decisionHandler: decisionHandler)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        STCommonWebViewHelper.default.webView(webView, decidePolicyFor: navigationAction, decisionHandler: decisionHandler)
    }
    
    // MARK: - WKUIDelegate
    
    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return STCommonWebViewHelper.default.webView(webView, createWebViewWith: configuration, for: navigationAction, windowFeatures: windowFeatures)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        STCommonWebViewHelper.default.webView(webView, runJavaScriptAlertPanelWithMessage: message, initiatedByFrame: frame, completionHandler: completionHandler)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        STCommonWebViewHelper.default.webView(webView, runJavaScriptConfirmPanelWithMessage: message, initiatedByFrame: frame, completionHandler: completionHandler)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        STCommonWebViewHelper.default.webView(webView, runJavaScriptTextInputPanelWithPrompt: prompt, defaultText: defaultText, initiatedByFrame: frame, completionHandler: completionHandler)
    }
    
}
