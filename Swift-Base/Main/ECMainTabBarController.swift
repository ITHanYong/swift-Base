//
//  ECMainTabBarController.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/26.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ECMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setTabBarStyle()
        self.setChildController()
    }
    
    // MARK: 修改tabBar的背景颜色 + 顶部横线颜色
    func setTabBarStyle() {
        
        //背景颜色设置
        self.tabBar.backgroundImage = UIImage.imageWithColor(color: UIColor.white)
        
        //顶部横线 - 设置
        self.tabBar.shadowImage = UIImage.imageWithColor(color: UIColor.colorWithHex(rgb: 0xDDDEE3))
    }
    
    // MARK: 初始化所有的子控制器
    func setChildController() {
        
        let keywordVC = KeywordVC()
        let timeNav = self.addChildController(keywordVC, title: "关键字", image: "timeTable-2", selectedImage: "timeTable-1")
        
        let analysisVC = AnalysisVC()
        let analysisNav = self.addChildController(analysisVC, title: "解析", image: "score-2", selectedImage: "score-1")
        
        let controlsVC = ControlsVC()
        let leaveNav = self.addChildController(controlsVC, title: "控件", image: "leave-2", selectedImage: "leave-1")
        
        
        
        self.viewControllers = [timeNav,analysisNav,leaveNav]
    }
    
    // MARK: - 添加子控件
    func addChildController(_ childController:UIViewController,title:String,image:String,selectedImage:String) -> ECNavigationController {
        
        childController.tabBarItem = UITabBarItem.init(title: title, image: UIImage.init(named: image), selectedImage: UIImage.init(named: selectedImage))
        let nav = ECNavigationController.init(rootViewController: childController)
        return nav
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
