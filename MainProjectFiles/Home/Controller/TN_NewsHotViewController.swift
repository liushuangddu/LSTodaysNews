//
//  TN_NewsHotViewController.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/26.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit

class TN_NewsHotViewController: TNBasicViewController {

    var newsModel: TN_HomeNewsTitleModel!
    
    override var hasNavihationBar: Bool {
        return false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }

    private func setupViews() {
        
        self.view.backgroundColor = UIColor.red
        TNNetworkRequest.fetchNewsData(model: newsModel)
        TNNetworkRequest.fetchNewsDataTwo(model: newsModel)
    }

}
