//
//  AppDelegate.swift
//  WXPublishManager
//
//  Created by 魏翔 on 16/7/26.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window.rootViewController = ViewController()
        
        self.window = window
        
        window.makeKeyAndVisible()

        return true
    }

}

