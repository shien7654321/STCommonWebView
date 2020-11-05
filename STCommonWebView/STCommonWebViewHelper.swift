//
//  STCommonWebViewHelper.swift
//  STCommonWebView
//
//  Created by Suta on 2020/11/5.
//  Copyright © 2020 Suta. All rights reserved.
//

import WebKit

public class STCommonWebViewHelper {
    
    public static let `default` = STCommonWebViewHelper()
    
    private init() {
        precondition(true, "Please do not use the init method to initialize STCommonWebViewHelper")
    }
    
    private func controller(_ view: UIView) -> UIViewController? {
        var responder: UIResponder? = view
        repeat {
            responder = responder?.next
        } while responder != nil && responder! is UIViewController
        let controller = responder! is UIViewController ? responder as? UIViewController : UIApplication.shared.keyWindow?.rootViewController
        return controller
    }
    
    public func clearCache(_ types: Set<String>? = nil, _ handler: (() -> Void)? = nil) {
        WKWebsiteDataStore.default().removeData(ofTypes: types ?? WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0), completionHandler: handler ?? {})
    }
    
    // MARK: - WKNavigationDelegate
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        var policy = WKNavigationResponsePolicy.allow
        if let mimeType = navigationResponse.response.mimeType, mimeType == "application/x-msdownload" {
            policy = .cancel
        }
        decisionHandler(policy)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        var policy = WKNavigationActionPolicy.allow
        if let url = navigationAction.request.url {
            if (url.host == "itunes.apple.com" || url.scheme == "tel" || url.scheme == "sms" || url.scheme == "mailto") && UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
                policy = .cancel
            }
        }
        decisionHandler(policy)
    }
    
    // MARK: - WKUIDelegate
    
    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame == nil {
            webView.load(navigationAction.request)
        } else if let url = navigationAction.request.url {
            let scheme = url.scheme?.lowercased()
            if (scheme == "http" || scheme == "https") && UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
            }
        }
        return nil
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        if let controller = controller(webView), controller.presentedViewController == nil {
            let alertController = UIAlertController(title: "Tip", message: message, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                completionHandler()
            }
            alertController.addAction(alertAction)
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        if let controller = controller(webView), controller.presentedViewController == nil {
            let alertController = UIAlertController(title: "Tip", message: message, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                completionHandler(true)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                completionHandler(false)
            }
            alertController.addAction(OKAction)
            alertController.addAction(cancelAction)
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        if let controller = controller(webView), controller.presentedViewController == nil {
            let alertController = UIAlertController(title: "Tip", message: prompt, preferredStyle: .alert)
            alertController.addTextField { textField in
                textField.text = defaultText
            }
            let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
                completionHandler(alertController.textFields?.first?.text)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                completionHandler(nil)
            }
            alertController.addAction(OKAction)
            alertController.addAction(cancelAction)
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
}
