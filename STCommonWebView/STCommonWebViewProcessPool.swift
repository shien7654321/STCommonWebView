//
//  STCommonWebViewProcessPool.swift
//  STCommonWebView
//
//  Created by Suta on 2020/11/5.
//  Copyright © 2020 Suta. All rights reserved.
//

import WebKit

class STCommonWebViewProcessPool: WKProcessPool {
    
    static let shared = STCommonWebViewProcessPool()
    
    override private init() {
        super.init()
        precondition(true, "Please do not use the init method to initialize STCommonWebViewProcessPool")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
