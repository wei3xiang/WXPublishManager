//
//  WXMenuButton.swift
//
//  Created by 魏翔 on 16/7/26.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXMenuButton: UIButton {
    
    override init(frame: CGRect) {super.init(frame: frame); viewprepare()}
    
    required init?(coder aDecoder: NSCoder) {super.init(coder: aDecoder); viewprepare()}
    
    func viewprepare(){
        
        titleLabel?.textAlignment = NSTextAlignment.Right
        
        titleLabel?.font = UIFont.systemFontOfSize(11)
        
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        UIView.animateWithDuration(1.0) { () -> Void in

            self.transform = CGAffineTransformMakeScale(1.2,1.2)
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
                self.transform = CGAffineTransformMakeScale(1.5, 1.5)
           
            }) { (b) -> Void in
                
                self.removeFromSuperview()
        }
        
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        imageView?.center = CGPointMake(bounds.size.width * 0.5, bounds.size.height * 0.5 - 10)
        
        titleLabel?.center = CGPointMake(bounds.size.width * 0.5, (imageView?.frame.maxY)! + 20)
        
    }

}
