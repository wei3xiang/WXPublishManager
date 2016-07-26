//
//  ViewController.swift
//  WXPublishManager
//
//  Created by 魏翔 on 16/7/26.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private lazy var menuModels: [WXMenuModel] = {
        
        var menuModels: [WXMenuModel] = []
        
        menuModels.append(WXMenuModel(menuName: "点评", menuImage: UIImage(named: "tabbar_compose_review")!))
        menuModels.append(WXMenuModel(menuName: "更多", menuImage: UIImage(named: "tabbar_compose_more")!))
        menuModels.append(WXMenuModel(menuName: "拍摄", menuImage: UIImage(named: "tabbar_compose_camera")!))
        menuModels.append(WXMenuModel(menuName: "相册", menuImage: UIImage(named: "tabbar_compose_photo")!))
        menuModels.append(WXMenuModel(menuName: "文字", menuImage: UIImage(named: "tabbar_compose_idea")!))
        menuModels.append(WXMenuModel(menuName: "签到", menuImage: UIImage(named: "tabbar_compose_review")!))
        
        return menuModels
        
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "CellId")
        
        if indexPath.row == 0{
        
            cell.textLabel?.text = "发布View"
            
        }else{
        
            cell.textLabel?.text = "发布控制器"
        }
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0{
            
            let menuView = WXPublishView(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) )
            
            menuView.menuModels = menuModels
            
            tableView.addSubview(menuView)
            
            
        }else{
            
            let vc = WXPublishVC()
            
            vc.menuModels = menuModels
            
            presentViewController(vc, animated: true, completion: nil)
            
            
        }
        
    }
}

