//
//  ADRFMediationRewardViewController.swift
//  ADRFMediationSDKDemo-Swift
//
//  Created by 陈坤 on 2020/6/16.
//  Copyright © 2020 陈坤. All rights reserved.
//

import UIKit

class AdRFMediationRewardViewController: UIViewController, ADRFMediationSDKRewardvodAdDelegate {
    func adrf_rewardvodAdServerDidSucceed(_ rewardvodAd: ADRFMediationSDKRewardvodAd, info: [AnyHashable : Any]) {
        
    }
    
    func adrf_rewardvodAdCloseLandingPage(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdServerDidSucceed(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdServerDidFailed(_ rewardvodAd: ADRFMediationSDKRewardvodAd, errorModel: ADRFMediationAdapterErrorDefine) {
        
    }
    
    func adrf_rewardvodAdLoadSuccess(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdReady(toPlay rewardvodAd: ADRFMediationSDKRewardvodAd) {
        // 3、展示激励视频广告
        if self.rewardAd!.rewardvodAdIsReady(){
            isReady = true
            // 建议在这个时机进行展示 也可根据需求在合适的时机进行展示
            // [self.rewardvodAd showRewardvodAd];
        }
        self.view.makeToast("激励视频准备完成")
    }
    
    func adrf_rewardvodAdVideoLoadSuccess(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdWillVisible(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdDidVisible(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdDidClose(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        rewardAd = nil
    }
    
    func adrf_rewardvodAdDidClick(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdDidPlayFinish(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdDidRewardEffective(_ rewardvodAd: ADRFMediationSDKRewardvodAd) {
        
    }
    
    func adrf_rewardvodAdFail(toLoad rewardvodAd: ADRFMediationSDKRewardvodAd, errorModel: ADRFMediationAdapterErrorDefine) {
        rewardAd = nil
    }
    
    func adrf_rewardvodAdPlaying(_ rewardvodAd: ADRFMediationSDKRewardvodAd, errorModel: ADRFMediationAdapterErrorDefine) {
        
    }
    

    var rewardAd : ADRFMediationSDKRewardvodAd?
    var isReady : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.init(red: 225/255.0, green: 233/255.0, blue: 239/255.0, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        let loadBtn = UIButton.init()
        loadBtn.layer.cornerRadius = 10;
        loadBtn.clipsToBounds = true;
        loadBtn.backgroundColor = UIColor.white
        loadBtn.setTitle("加载激励视频", for: .normal)
        loadBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(loadBtn)
        loadBtn.frame = CGRect.init(x: 30, y: UIScreen.main.bounds.size.height/2-60, width: UIScreen.main.bounds.size.width-60, height: 55)
        loadBtn.addTarget(self, action: #selector(loadRewardAd), for: .touchUpInside)
        
        let showBtn = UIButton.init()
        showBtn.layer.cornerRadius = 10
        showBtn.clipsToBounds = true
        showBtn.backgroundColor = UIColor.white
        showBtn.setTitle("展示激励视频", for: .normal)
        showBtn.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(showBtn)
        showBtn.frame = CGRect.init(x: 30, y: UIScreen.main.bounds.size.height/2+20, width: UIScreen.main.bounds.size.width-60, height: 55)
        showBtn.addTarget(self, action: #selector(showRewardAd), for: .touchUpInside)
        
        
    }
    
    
    @objc func loadRewardAd() {
        // 1、初始化激励视频广告对象
        self.rewardAd = ADRFMediationSDKRewardvodAd.init()
        self.rewardAd?.controller = self
        self.rewardAd?.delegate = self
        self.rewardAd?.tolerateTimeout = 5
        self.rewardAd?.posId = "2efc799f75ce8980bc"
        // 2、加载激励视频广告
        self.rewardAd?.load()
    }
    
    @objc func showRewardAd() {
        if isReady && self.rewardAd!.rewardvodAdIsReady() {
            self.rewardAd?.show()
        } else {
            self.view.makeToast("激励视频未准备好")
        }
    }

}
