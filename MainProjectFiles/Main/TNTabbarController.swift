//
//  TNTabbarController.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/21.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit

class TNTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let home = TNHomeViewController()
        home.title = "首页"
        home.tabBarItem.image = UIImage.init(named: "home" + "_tabbar_night_32x32_")
        home.tabBarItem.selectedImage = UIImage.init(named: "home" + "_tabbar_press_night_32x32_")
        let niva = TNNavigationController.init(rootViewController: home)
        addChildViewController(niva)
    }
    

}
