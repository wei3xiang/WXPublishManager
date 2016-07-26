//
//  WXPublishVC.swift
//  Created by 魏翔 on 16/7/25.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXPublishVC: UIViewController {
    
    var actionBtns: [WXMenuButton] = []
    
    var timer: NSTimer?
    
//    convenience init(menuModels: [MenuModel]){
//        
//        self.init(nibName: nil,bundle: nil)
//        
//        self.menuModels = menuModels
//        
//    }
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    var menuModels: [WXMenuModel] = []{
        
        didSet{
            
            let btnWH: CGFloat = 100
            
            let numberOfCols:Int = 3
            
            let marginX: CGFloat = (UIScreen.mainScreen().bounds.size.width - CGFloat(numberOfCols) * btnWH)/CGFloat(numberOfCols+1)
            
            let marginY: CGFloat = 20
            
            let oriY:CGFloat = 300
            
            for (index,menuModel) in menuModels.enumerate(){
                
                let col:Int = index % numberOfCols //列
                
                let row: Int = index / numberOfCols //行
                
                let btn = WXMenuButton()
                
                btn.setTitle(menuModel.menuName, forState: .Normal)
                
                btn.setImage(menuModel.menuImage, forState: .Normal)
                
                btn.frame = CGRectMake(marginX + (marginX + btnWH) * CGFloat(col), oriY + (marginY + btnWH) * CGFloat(row), btnWH, btnWH)
                
                btn.transform = CGAffineTransformMakeTranslation(0, UIScreen.mainScreen().bounds.height)
                
                view.addSubview(btn)
                
                actionBtns.append(btn)
            }
            
        }
        
    }

    var btnIndex = 0
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerChanged", userInfo: nil, repeats: true)

    }
    
    func timerChanged(){
        
        if(btnIndex == menuModels.count){
            
            timer?.invalidate()
            
            timer = nil
            
            return
        }
        
        let btn = actionBtns[btnIndex]
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: { () -> Void in
                btn.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        btnIndex++
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerBackChanged", userInfo: nil, repeats: true)
        
    }

    func timerBackChanged(){
        
        if(btnIndex == 0){
            
            timer?.invalidate()
            
            timer = nil
            
            return
        }
        
        let btn = actionBtns[btnIndex-1]
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: { () -> Void in
                btn.transform = CGAffineTransformMakeTranslation(0, UIScreen.mainScreen().bounds.height)
            }, completion: {(b) in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        
        btnIndex--
        
    }

}
