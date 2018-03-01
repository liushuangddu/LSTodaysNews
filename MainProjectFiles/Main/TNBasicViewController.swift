//
//  TNBasicViewController.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/25.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit

class TNBasicViewController: UIViewController {

    var contentView: UIView!
    var bottomView: UIView!
    var topView: UIView!

    var hasNavihationBar: Bool {
        return true
    }
    var hasBottomTabbar: Bool {
        return false
    }
    var hasTopView: Bool {
        return false
    }
    var hasBottomView: Bool {
        return false
    }
    var topViewHeight: CGFloat {
        return 0.0
    }
    var bottomViewHeight: CGFloat {
        return 0.0
    }
    var navigationBarHeight: CGFloat {
        return 64
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addViews()
    }
    
    final private func addViews() {
        
        //用来将self.view的位置延伸到屏幕顶部
        self.edgesForExtendedLayout = .all
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.contentView = UIView()
        self.view.addSubview(contentView)
        contentView.backgroundColor = UIColor.white
        contentView.whc_AutoSize(left: 0, top: 0, right: 0, bottom: 0)
        if hasTopView {
            topView = UIView()
            self.view.addSubview(topView)
            topView.backgroundColor = UIColor.white
            if hasNavihationBar {
                topView.whc_Top(navigationBarHeight).whc_Left(0).whc_Right(0).whc_Height(topViewHeight)
            }else {
                topView.whc_Top(0).whc_Left(0).whc_Right(0).whc_Height(topViewHeight)
            }
        }
        if hasBottomView {
            bottomView = UIView()
            self.view.addSubview(bottomView)
            bottomView.backgroundColor = UIColor.purple
            if hasBottomTabbar {
                bottomView.whc_Left(0).whc_Right(0).whc_Bottom(49).whc_Height(bottomViewHeight)
            }else {
                bottomView.whc_Left(0).whc_Right(0).whc_Bottom(0).whc_Height(bottomViewHeight)
            }
        }
        if hasNavihationBar && hasBottomTabbar {
            contentView.whc_Top(navigationBarHeight + topViewHeight).whc_Left(0).whc_Right(0).whc_Bottom(bottomViewHeight + 49)
        }else if hasNavihationBar {
            contentView.whc_Top(navigationBarHeight + topViewHeight).whc_Left(0).whc_Right(0).whc_Bottom(bottomViewHeight)
        }else if hasBottomTabbar {
            contentView.whc_Top(topViewHeight).whc_Left(0).whc_Right(0).whc_Bottom(49 + bottomViewHeight)
        }
        
        
    }

}
