//
//  ADRFMediationSplashViewController.swift
//  ADRFMediationSDKDemo-Swift
//
//  Created by 陈坤 on 2020/6/16.
//  Copyright © 2020 陈坤. All rights reserved.
//

import UIKit

class ADRFMediationSplashViewController: UIViewController, ADRFMediationSDKSplashAdDelegate {

    
    var splash: ADRFMediationSDKSplashAd?
    
    let normalView = ADRFMediationSkipView.init()
    let ringView = ADRFMediationSkipRingView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.init(red: 225/255.0, green: 233/255.0, blue: 239/255.0, alpha: 1)
        
        // 加载开屏
        loadSplash()
    }
    
    func loadSplash() {
        // 1、初始化开屏广告对象
        splash = ADRFMediationSDKSplashAd.init()
        // 设置代理
        splash?.delegate = self
        // 2、设置广告位id
        splash?.posId = "871fe19fe7df5b5c4b"
        // 设置广告请求超时时间
        splash?.tolerateTimeout = 4
        
        // 3、设置广告背景颜色，推荐设置为启动图的平铺颜色
        let bgImage = UIImage.init(named: "750x1334.png")
        splash?.backgroundColor = UIColor.adrf_get(with: bgImage!, withNewSize: UIScreen.main.bounds.size)
    
        // 设置控制器，用于落地页弹出
        splash?.controller = self
        
        // 4、初始化底部视图
        var bottomViewHeight:CGFloat = SCREEN_HEIGHT * 0.15
        
        let bottomView = UIView.init(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT - bottomViewHeight, width: SCREEN_WIDTH, height: bottomViewHeight))
        bottomView.backgroundColor = UIColor.white
        
        let logoImageView = UIImageView.init(image: UIImage.init(named: "AdRFMediation_Logo.png"))
        logoImageView.frame = CGRect.init(x: (SCREEN_WIDTH - 135)/2, y: (bottomViewHeight - 46)/2, width: 135, height: 46)
        
        bottomView.addSubview(logoImageView)
        // 5、加载全屏的开屏广告
        // splash?.loadAndShow(in: self.window! , withBottomView: nil)
        // 5、加载带有底部视图的开屏广告
        splash?.loadAndShow(in: UIApplication.shared.keyWindow!, withBottomView: bottomView)
        
    }
    
    func adrf_splashAdClosed(_ splashAd: ADRFMediationSDKSplashAd) {
        print(#function)
        splash = nil
    }
    
    func adrf_splashAdFail(toPresentScreen splashAd: ADRFMediationSDKSplashAd, failToPresentScreen error: ADRFMediationAdapterErrorDefine) {
        print(#function)
        splash = nil
    }

}
