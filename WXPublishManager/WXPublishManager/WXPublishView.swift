//
//  WXPublishView.swift
//
//  Created by 魏翔 on 16/7/26.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXPublishView: UIView {
    
    var timer: NSTimer?
    
    var btnIndex = 0
    
    var menuBtns: [WXMenuButton] = []
    
    override init(frame: CGRect) {super.init(frame: frame); setUpView()}
    
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); setUpView()}
    
    private lazy var closeBtn:UIButton = {
        
        let closeBtn = UIButton(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height - 49, UIScreen.mainScreen().bounds.width, 49))
        
        closeBtn.setImage(UIImage(named: "tabbar_compose_background_icon_close"), forState: .Normal)
        
        closeBtn.addTarget(self, action: "didClickClose:", forControlEvents: .TouchUpInside)
        
        closeBtn.backgroundColor = UIColor.whiteColor()
        
        return closeBtn
        
    }()
    
    var menuModels: [WXMenuModel]!{
        
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
                
                addSubview(btn)
                
                menuBtns.append(btn)
                
            }
            
        }
        
    }
    
    func setUpView(){
        
        backgroundColor = UIColor(colorLiteralRed: 255, green: 251, blue: 240, alpha: 0.6)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerChanged", userInfo: nil, repeats: true)
        
        let animation = CABasicAnimation(keyPath: "rotation")
        
        animation.toValue = M_PI_4
        
        addSubview(closeBtn)
        
    }
    
    func timerChanged(){
        
        if(btnIndex == menuModels.count){
            
            timer?.invalidate()
            
            timer = nil
            
            return
        }
        
        let btn = menuBtns[btnIndex]
        
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
        
        let btn = menuBtns[btnIndex-1]
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: { () -> Void in
            btn.transform = CGAffineTransformMakeTranslation(0, UIScreen.mainScreen().bounds.height)
            }, completion: {(b) in
                self.removeFromSuperview()
        })
        
        btnIndex--
        
    }
    
    func didClickClose(button: UIButton){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerBackChanged", userInfo: nil, repeats: true)
        
    }
    
}
