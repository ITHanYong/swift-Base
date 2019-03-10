//
//  ECNavigationController.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/26.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ECNavigationController: UINavigationController ,UINavigationControllerDelegate,UIGestureRecognizerDelegate{

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.delegate = self
        
        self.view.backgroundColor = UIColor.white
        
        self.setNavLineColor(UIColor.colorWithHex(rgb: 0x5F94F4))
        self.setNavTitleStyle()
        self.setStatusBarStyle(style: .lightContent)
    }
    
    //MARK: - 修改导航栏的背景颜色 + 底部横线颜色
    func setNavLineColor(_ color:UIColor) -> Void {
        
        //修改导航栏的背景颜色
        self.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: color), for: .default)
        
        //隐藏底部 - 横线
        self.navigationBar.shadowImage = UIImage.init()
    }
    
    //MARK: - 改变状态栏字体颜色
    func setStatusBarStyle(style:UIStatusBarStyle) -> Void {
        UIApplication.shared.statusBarStyle = style
    }
    
    
    //MARK: - 设置导航栏标题字体 - 此处设置的为APP导航栏默认标题样式
    func setNavTitleStyle() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.colorWithHex(rgb: 0xFFFFFF),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
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
