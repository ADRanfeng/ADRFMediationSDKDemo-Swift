//
//  ADRFMediationInterstitialViewController.swift
//  ADRFMediationSDKDemo-Swift
//
//  Created by 陈坤 on 2020/6/17.
//  Copyright © 2020 陈坤. All rights reserved.
//

import UIKit

class AdRFMediationInterstitialViewController: UIViewController, ADRFMediationSDKIntertitialAdDelegate {
    func adrf_interstitialAdCloseLandingPage(_ interstitialAd: ADRFMediationSDKIntertitialAd) {
        
    }
    
    func adrf_interstitialAdSucced(toLoad interstitialAd: ADRFMediationSDKIntertitialAd) {
        print(#function)
        // 3、展示插屏广告
        isReady = true
        self.view.makeToast("插屏广告准备完成")
    }
    
    func adrf_interstitialAdFailed(toLoad interstitialAd: ADRFMediationSDKIntertitialAd, error: ADRFMediationAdapterErrorDefine) {
        print(#function)
        self.interstitialAd = nil
    }
    
    func adrf_interstitialAdDidPresent(_ interstitialAd: ADRFMediationSDKIntertitialAd) {
        print(#function)
    }
    
    func adrf_interstitialAdFailed(toPresent interstitialAd: ADRFMediationSDKIntertitialAd, error: Error) {
        print(#function)
    }
    
    func adrf_interstitialAdDidClick(_ interstitialAd: ADRFMediationSDKIntertitialAd) {
        print(#function)
    }
    
    func adrf_interstitialAdDidClose(_ interstitialAd: ADRFMediationSDKIntertitialAd) {
        print(#function)
        self.interstitialAd = nil
    }
    
    func adrf_interstitialAdExposure(_ interstitialAd: ADRFMediationSDKIntertitialAd) {
        print(#function)
    }
    
    var interstitialAd : ADRFMediationSDKIntertitialAd?
    var isReady:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 225/255.0, green: 233/255.0, blue: 239/255.0, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        let loadBtn = UIButton.init()
        loadBtn.layer.cornerRadius = 10;
        loadBtn.clipsToBounds = true;
        loadBtn.backgroundColor = UIColor.white
        loadBtn.setTitle("加载插屏广告", for: .normal)
        loadBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(loadBtn)
        loadBtn.frame = CGRect.init(x: 30, y: UIScreen.main.bounds.size.height/2-60, width: UIScreen.main.bounds.size.width-60, height: 55)
        loadBtn.addTarget(self, action: #selector(loadInterstitialAd), for: .touchUpInside)
        
        let showBtn = UIButton.init()
        showBtn.layer.cornerRadius = 10
        showBtn.clipsToBounds = true
        showBtn.backgroundColor = UIColor.white
        showBtn.setTitle("展示插屏广告", for: .normal)
        showBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(showBtn)
        showBtn.frame = CGRect.init(x: 30, y: UIScreen.main.bounds.size.height/2+20, width: UIScreen.main.bounds.size.width-60, height: 55)
        showBtn.addTarget(self, action: #selector(showInterstitialAd), for: .touchUpInside)
    }
    
    @objc func loadInterstitialAd() {
        // 1、初始化插屏广告对象
        self.interstitialAd = ADRFMediationSDKIntertitialAd.init()
        self.interstitialAd?.delegate = self
        self.interstitialAd?.controller = self
        self.interstitialAd?.tolerateTimeout = 4
        self.interstitialAd?.posId = "f063037fac3351dbcc"
        if SetConfigManager.shared().fullAdAdScenceId != "" {
            self.interstitialAd?.scenesId = SetConfigManager.shared().fullAdAdScenceId
        }
        // 2、加载插屏广告
        self.interstitialAd?.loadData()
    }
    
    @objc func showInterstitialAd() {
        if isReady  {
            self.interstitialAd?.show()
        }else {
            self.view.makeToast("插屏广告未准备完成")
        }
    }
    

}
