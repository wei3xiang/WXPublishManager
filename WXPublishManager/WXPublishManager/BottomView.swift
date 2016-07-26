//
//  BottomView.swift
//  WXPublishManager
//
//  Created by 魏翔 on 16/7/26.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class BottomView: UIView {

    @IBOutlet weak var closeButton: UIButton!
    
    var closeBtnClosure:(()->())?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        UIView.animateWithDuration(1.0) { () -> Void in
            
            self.closeButton.transform = CGAffineTransformRotate(self.closeButton.transform, CGFloat(M_PI_4))
        }
        
    }
    
    func animationToRevertBtn(){
        
        UIView.animateWithDuration(1.0) { () -> Void in
            
            self.closeButton.transform = CGAffineTransformIdentity
        }
        
    }
}
