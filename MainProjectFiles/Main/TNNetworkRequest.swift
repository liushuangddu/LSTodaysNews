//
//  TNNetworkRequest.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/22.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit
import Alamofire

let basic_URL = "https://is.snssdk.com"
let device_id: Int = 6096495334
let iid: Int = 5034850950

let isIPhoneX: Bool = screenHeight == 812 ? true : false

let newsTitleHeight: CGFloat = 40

let path_HomeNewsTitleDate = "/article/category/get_subscribed/v1/?"
let path_HomeCategoryRecommand = "/article/category/get_extra/v1/?"
let path_HomeSearchBarSuggestInfo = "/search/suggest/homepage_suggest/?"
let path_HomeNewsFeed =             "/api/news/feed/v75/?"
// MARK: - --------------------------------- 首页 home  ---------------------------------
/// 首页顶部新闻标题的数据
/// - parameter completionHandler: 返回标题数据
/// - parameter newsTitles: 首页标题数组

typealias completionHandler = ((DataResponse<Any>)) -> Void

class TNNetworkRequest {

    private static func basic_Request(url: URL, method: HTTPMethod, parameter: Parameters?, encoding: URLEncoding, header: HTTPHeaders?, completionHandle: @escaping completionHandler) {
        
        Alamofire.request(url, method: method, parameters: parameter, encoding: encoding, headers: header).responseJSON { (dataResponse) in
            dataResponse.result.ifFailure {
                //错误处理
            }
            dataResponse.result.ifSuccess {
                
            }
            completionHandle(dataResponse)
        }
    }
    ///获取标题栏数据
    static func fetchHomeNewsTitleData(response: @escaping (_ model: [TN_HomeNewsTitleModel]?) -> Void) {
        DispatchQueue.main.async {
            if let model = WHC_ModelSqlite.homeNewsTitleData {
                response(model.data?.datas)
            }
        }
        let url = URL.init(string: basic_URL + path_HomeNewsTitleDate)
        let parameter = ["device_id":device_id,"iid":iid]
        basic_Request(url: url!, method: .get, parameter: parameter, encoding: URLEncoding.default, header: nil) { (dataResponse) in
            dataResponse.result.ifFailure {
                response(nil)
            }
            dataResponse.result.ifSuccess {
                if let data = dataResponse.data {
                    try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    let model = TN_HomeNewsDataModel.sexy_json(data)
                    WHC_ModelSqlite.homeNewsTitleData = model
                    response(model?.data?.datas)
                }
            }
        }
    }
    ///获取搜索框建议信息
    static func fetchHomeNavigationViewSearchBarData(response: @escaping (_ model: TN_SearchBarSuggestInfo?) -> Void) {
        if let model = WHC_ModelSqlite.homeSearchBarSuggestInfoModel {
            response(model.data)
        }
        let url = URL.init(string: basic_URL + path_HomeSearchBarSuggestInfo)
        let parameter = ["device_id":device_id,"iid":iid]
        basic_Request(url: url!, method: .get, parameter: parameter, encoding: URLEncoding.default, header: nil) { (dataResponse) in
            dataResponse.result.ifFailure {
                response(nil)
            }
            dataResponse.result.ifSuccess {
                
                let model = TN_SearchBarSuggestInfoModel.sexy_json(dataResponse.data)
                WHC_ModelSqlite.homeSearchBarSuggestInfoModel = model
                response(model?.data)
            }
        }
    }
    ///获取新闻数据，随便什么数据
    static func fetchNewsData(model: TN_HomeNewsTitleModel) {
        
        let url = URL.init(string: basic_URL + path_HomeNewsFeed)
        let parameter: Parameters = ["device_id":device_id,
                                     "count":20,
                                     "list_count":10,
                                     "category":model.category,
                                     "max_behot_time":Date().timeIntervalSince1970,
                                     "strict":0,
                                     "detail":1,
                                     "refresh_reason":1,
                                     "tt_from":"enter_auto",
                                     "iid":iid]
        basic_Request(url: url!, method: .get, parameter: parameter, encoding: URLEncoding.default, header: nil) { (dataResponse) in
            dataResponse.result.ifFailure {
                
            }
            dataResponse.result.ifSuccess {
                print(try! JSONSerialization.jsonObject(with: dataResponse.data!, options: JSONSerialization.ReadingOptions.allowFragments))
            }
        }
    }
    
    static func fetchNewsDataTwo(model: TN_HomeNewsTitleModel) {
        
        let url = basic_URL + "/api/news/feed/v75/?"
        let params: Parameters = ["device_id": device_id,
                      "count": 20,
                      "list_count": 15,
                      "category": model.category!,
                      "max_behot_time": Date().timeIntervalSince1970,
                      "strict": 0,
                      "detail": 1,
                      "refresh_reason": 1,
                      "tt_from": "auto",
                      "iid": iid]
        basic_Request(url: URL.init(string: url)!, method: .get, parameter: params, encoding: URLEncoding.default, header: nil) { (dataResponse) in
            dataResponse.result.ifFailure {
                
            }
            dataResponse.result.ifSuccess {
                print("fetchNewsDataTwo")
                print(try! JSONSerialization.jsonObject(with: dataResponse.data!, options: JSONSerialization.ReadingOptions.allowFragments))
            }
        }
    }
}
