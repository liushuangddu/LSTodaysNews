//
//  TNHomeNavigationView.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/21.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit

class TNHomeNavigationView: UIView {

    private var button_Search = UIButton()
    private var button_Avator = UIButton()
    private var button_Camera = UIButton()
    
    var didTapButton_Search: (() -> Void)?
    var didTapButton_Avator: (() -> Void)?
    var didTapButton_Camera: (() -> Void)?
    
//    override var frame: CGRect {
//        didSet {
//            super.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: 44)
//        }
//    }
    
//    override var intrinsicContentSize: CGSize {
//        return UILayoutFittingExpandedSize
//    }
    
    override func didMoveToSuperview() {
        self.whc_Top(0).whc_Left(0).whc_Right(0).whc_Bottom(0)
        
        TNNetworkRequest.fetchHomeNavigationViewSearchBarData { [unowned button_Search] (info) in
            
            if let info = info {
                button_Search.setTitle(info.homepage_search_suggest, for: .normal)
            }
        }
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear

        self.addSubview(button_Search)
        self.addSubview(button_Avator)
        self.addSubview(button_Camera)
        
        button_Avator.whc_CenterY(0).whc_Left(10).whc_Width(30).whc_Height(30)
        button_Avator.setImage(UIImage.init(named: "home_no_login_head"), for: .normal)
        button_Camera.whc_Right(10).whc_CenterY(0).whc_Height(30).whc_Width(30)
        button_Camera.setImage(UIImage.init(named: "home_camera"), for: .normal)
        button_Search.whc_CenterY(0).whc_Left(10, toView: button_Avator).whc_Right(10, toView: button_Camera).whc_Height(30)
        button_Search.setImage(UIImage.init(named: "search_small_16x16_"), for: .normal)
        button_Search.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button_Search.backgroundColor = UIColor.white
        button_Search.layer.cornerRadius = 5;
        button_Search.clipsToBounds = true
        button_Search.setTitleColor(UIColor.black, for: .normal)
        
        button_Camera.addTarget(self, action: #selector(button_CameraHandle), for: .touchUpInside)
        button_Avator.addTarget(self, action: #selector(button_AvatorHandle), for: .touchUpInside)
        button_Search.addTarget(self, action: #selector(button_SearchHandle), for: .touchUpInside)
    }
    
    @objc private func button_AvatorHandle() {
        didTapButton_Avator?()
    }
    
    @objc private func button_SearchHandle() {
        didTapButton_Search?()
    }
    
    @objc private func button_CameraHandle() {
        didTapButton_Camera?()
    }
    
}
