//
//  WXPublishVC.swift
//  Created by 魏翔 on 16/7/25.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXPublishVC: UIViewController {
    
    var actionBtns: [WXMenuButton] = []
    
    var timer: NSTimer?
    
    private lazy var bottomView: BottomView = {
        
        let bottomView = NSBundle.mainBundle().loadNibNamed("BottomView", owner: nil, options: nil).last as! BottomView
        
        bottomView.closeButton.addTarget(self, action: "didClickClose:", forControlEvents: .TouchUpInside)
        
        bottomView.frame = CGRectMake(0,UIScreen.mainScreen().bounds.height - 44,UIScreen.mainScreen().bounds.width, 44)
        
        return bottomView
        
    }()
    
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
        
        view.addSubview(bottomView)
        
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
        
        bottomView.animationToRevertBtn()
        
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
    
    func didClickClose(btn: UIButton){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerBackChanged", userInfo: nil, repeats: true)
        
        bottomView.animationToRevertBtn()
        
    }

}
