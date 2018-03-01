//
//  Extension.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/21.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height


extension UIColor {
    
    static func color(r: CGFloat, g:CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    ///背景红色
    static var themeColor = UIColor.color(r: 196, g: 73, b: 67)
    
    
}

extension WHC_ModelSqlite {
    
    ///TN_HomeNewsDataModel
    static var homeNewsTitleData: TN_HomeNewsDataModel? {
        get {
            if let model = query(TN_HomeNewsDataModel.self).first {
                return model as? TN_HomeNewsDataModel
            }else {
                return nil
            }
        }
        set {
            if let _ = query(TN_HomeNewsDataModel.self).first {
                update(newValue!, where: "")
            }else {
                insert(newValue)
            }
        }
    }
    
    ///TN_SearchBarSuggestInfoModel
    static var homeSearchBarSuggestInfoModel: TN_SearchBarSuggestInfoModel? {
        get {
            if let model = query(TN_SearchBarSuggestInfoModel.self).first {
                return model as? TN_SearchBarSuggestInfoModel
            }else {
                return nil
            }
        }
        set {
            if let _ = query(TN_SearchBarSuggestInfoModel.self).first {
                update(newValue!, where: "")
            }else {
                insert(newValue)
            }
        }
    }
}


