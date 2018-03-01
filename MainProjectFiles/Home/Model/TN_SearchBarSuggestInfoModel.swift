//
//  TN_SearchBarSuggestInfoModel.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/25.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit



/**
 * Copyright 2018 WHC_DataModelFactory
 * Auto-generated: 2018-02-25 20:05:40
 *
 * @author netyouli (whc)
 * @website http://wuhaichao.com
 * @github https://github.com/netyouli
 */

import SexyJson



/**
 * Copyright 2018 WHC_DataModelFactory
 * Auto-generated: 2018-03-01 16:27:21
 *
 * @author netyouli (whc)
 * @website http://wuhaichao.com
 * @github https://github.com/netyouli
 */


@objc (TN_SearchBarSuggestInfo)
class TN_SearchBarSuggestInfo :NSObject, SexyJson, NSCoding, NSCopying {
    
    @objc required init(coder decoder: NSCoder) {
        super.init()
        self.sexy_decode(decoder)
    }
    
    @objc func encode(with aCoder: NSCoder) {
        self.sexy_encode(aCoder)
    }
    
    @objc func copy(with zone: NSZone? = nil) -> Any {
        return self.sexy_copy()
    }
    
    @objc required override init() {}
    
    @objc var homepage_search_suggest: String?
    @objc var call_per_refresh: String?
    
    @objc public func sexyMap(_ map: [String : Any]) {
        
        homepage_search_suggest        <<<        map["homepage_search_suggest"]
        call_per_refresh               <<<        map["call_per_refresh"]
        
    }
    
}
@objc (TN_SearchBarSuggestInfoModel)
class TN_SearchBarSuggestInfoModel :NSObject, SexyJson, NSCoding, NSCopying {
    
    @objc required init(coder decoder: NSCoder) {
        super.init()
        self.sexy_decode(decoder)
    }
    
    @objc func encode(with aCoder: NSCoder) {
        self.sexy_encode(aCoder)
    }
    
    @objc func copy(with zone: NSZone? = nil) -> Any {
        return self.sexy_copy()
    }
    
    @objc required override init() {}
    
    @objc var message: String?
    @objc var data: TN_SearchBarSuggestInfo?
    
    @objc public func sexyMap(_ map: [String : Any]) {
        
        message        <<<        map["message"]
        data           <<<        map["data"]
        
    }
    
}

