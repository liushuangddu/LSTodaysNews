//
//  TN_BasicModel.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/24.
//  Copyright © 2018年 Lenny. All rights reserved.
//



/**
 * Copyright 2018 WHC_DataModelFactory
 * Auto-generated: 2018-03-01 14:35:25
 *
 * @author netyouli (whc)
 * @website http://wuhaichao.com
 * @github https://github.com/netyouli
 */

import SexyJson
@objc (TN_HomeNewsTitleModel)
class TN_HomeNewsTitleModel :NSObject, SexyJson, NSCoding, NSCopying {
    
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
    
    @objc var default_add: String?
    @objc var category: String?
    @objc var tip_new: String?
    @objc var web_url: String?
    @objc var concern_id: String?
    @objc var stick: String?
    @objc var icon_url: String?
    @objc var flags: String?
    @objc var type: String?
    @objc var name: String?
    
    @objc public func sexyMap(_ map: [String : Any]) {
        
        default_add        <<<        map["default_add"]
        category           <<<        map["category"]
        tip_new            <<<        map["tip_new"]
        web_url            <<<        map["web_url"]
        concern_id         <<<        map["concern_id"]
        stick              <<<        map["stick"]
        icon_url           <<<        map["icon_url"]
        flags              <<<        map["flags"]
        type               <<<        map["type"]
        name               <<<        map["name"]
        
    }
    
}

@objc (NewsData)
class NewsData :NSObject, SexyJson, NSCoding, NSCopying {
    
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
    
    @objc var version: String?
    @objc var datas: [TN_HomeNewsTitleModel]?
    
    @objc public func sexyMap(_ map: [String : Any]) {
        
        version        <<<        map["version"]
        datas           <<<        map["data"]
        
    }
    
}

@objc (TN_HomeNewsDataModel)
class TN_HomeNewsDataModel :NSObject, SexyJson, NSCoding, NSCopying {
    
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
    @objc var data: NewsData?
    
    @objc public func sexyMap(_ map: [String : Any]) {
        
        message        <<<        map["message"]
        data           <<<        map["data"]
        
    }
    
}




