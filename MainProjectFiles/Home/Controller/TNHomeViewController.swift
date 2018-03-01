//
//  TNHomeViewController.swift
//  LSTodaysNews
//
//  Created by Lenny on 2018/2/21.
//  Copyright © 2018年 Lenny. All rights reserved.
//

import UIKit

class TNHomeViewController: TNBasicViewController {

    private var mainPageTitleView: SGPageTitleView?
    private var mainPageContentView: SGPageContentView?
    private lazy var mainNavigationBar = TNHomeNavigationView()
    
    private lazy var button_AddChannel: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "images.add_channel_titlbar_thin_new_16x16_"), for: .normal)
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor.themeColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(self.view.frame)
        setupViews()
    }

    override var hasNavihationBar: Bool {
        return true
    }
    override var hasBottomTabbar: Bool {
        return true
    }
    override var hasTopView: Bool {
        return true
    }
    override var topViewHeight: CGFloat {
        return 40
    }
    private func setupViews() {
        
        navigationItem.titleView = mainNavigationBar
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "navigation_background"), for: UIBarMetrics.default)
        
        TNNetworkRequest.fetchHomeNewsTitleData { [unowned self] (models) in
            if let models = models {
            
                self.childViewControllers.forEach({ (vc) in
                    vc.view.removeFromSuperview()
                    vc.removeFromParentViewController()
                })
                let configuration = SGPageTitleViewConfigure.init()
                configuration.titleColor = UIColor.black
                configuration.titleSelectedColor = UIColor.themeColor
                var array_Titles = [String]()
                for item in models {
                    array_Titles.append(item.name!)
                    self.addChildControllerWith(model: item)
                }
                
                self.mainPageTitleView?.removeFromSuperview()
                self.mainPageTitleView = SGPageTitleView.init(frame: self.topView.bounds, delegate: self, titleNames: array_Titles, configure: configuration)
                self.topView .addSubview(self.mainPageTitleView!)
                self.mainPageTitleView?.backgroundColor = UIColor.clear
//                self.topView.addSubview(self.button_AddChannel)
//                self.button_AddChannel.whc_CenterY(0).whc_Right(0).whc_Width(32).whc_Height(32)
                self.mainPageContentView = SGPageContentView.init(frame: self.contentView.bounds, parentVC: self, childVCs: self.childViewControllers)
                self.mainPageContentView?.delegatePageContentView = self
                self.contentView.addSubview(self.mainPageContentView!)
                
            }
        }
    }
    
    private func clickAction() {
        
        mainNavigationBar.didTapButton_Avator = {
            
        }
        mainNavigationBar.didTapButton_Camera = {
            
        }
        mainNavigationBar.didTapButton_Search =  {
            
        }
    }
    
    private func addChildControllerWith(model: TN_HomeNewsTitleModel) {
        
        if let cate = model.category {
            switch cate {
            case "news_hot" :
                let vc = TN_NewsHotViewController()
                vc.newsModel = model
                
                self.addChildViewController(vc)
                
                break
            case "news_local":
                let vc = TN_NewsLocalViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "video":
                let vc = TN_NewsVideoViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_society":
                let vc = TN_NewsSocietyViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "组图":
                let vc = TN_NewsPicturesViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_entertainment":
                let vc = TN_NewsEntertainmentViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_tech":
                let vc = TN_NewsTechViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_car":
                let vc = TN_NewsCarsViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_finance":
                let vc = TN_NewsFinanceViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_military":
                let vc = TN_NewsMilitaryViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_sports":
                let vc = TN_NewsSportsViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "essay_joke":
                let vc = TN_NewsEssayJokeViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "image_ppmm":
                let vc = TN_NewsImagePPMMViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_world":
                let vc = TN_NewsWorldViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "image_funny":
                let vc = TN_NewsImageFunnyViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_health":
                let vc = TN_NewsHealthViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "jinritemai":
                let vc = TN_NewsJinritemaiViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            case "news_house":
                let vc = TN_NewsHouseViewController()
                vc.newsModel = model
                self.addChildViewController(vc)
                break
            default:
                break
            }
        }
    }
}

extension TNHomeViewController: SGPageTitleViewDelegate, SGPageContentViewDelegate {
    
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.mainPageContentView?.setPageContentViewCurrentIndex(selectedIndex)
    }
    func pageContentView(_ pageContentView: SGPageContentView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.mainPageTitleView?.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
