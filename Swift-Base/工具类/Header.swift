//
//  Header.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/28.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit
import Masonry


// MARK: ===================================变量宏定义=====================================

// MARK: 系统相关
/// Info
public let kAppBundleInfoVersion = Bundle.main.infoDictionary ?? Dictionary()
/// plist:  AppStore 使用VersionCode 1.0.1
public let kAppBundleVersion = (kAppBundleInfoVersion["CFBundleShortVersionString" as String] as? String ) ?? ""
/// plist: 例如 1
public let kAppBundleBuild = (kAppBundleInfoVersion["CFBundleVersion"] as? String ) ?? ""
public let kAppDisplayName = (kAppBundleInfoVersion["CFBundleDisplayName"] as? String ) ?? ""

// MARK: 系统相关
public let kiOSBase = 8.0
public let kOSGreaterOrEqualToiOS8 = ( (Double(UIDevice.current.systemVersion) ?? kiOSBase) > 8.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS9 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 9.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS10 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 10.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS11 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 11.0 ) ? true : false;


//屏幕尺寸
public let SCREENW : CGFloat = UIScreen.main.bounds.width
public let SCREENH : CGFloat = UIScreen.main.bounds.height

//屏幕适配 - 比例
public let SCALEW : CGFloat = UIScreen.main.bounds.width/375
public let SCALEH : CGFloat = UIScreen.main.bounds.width/667

//是否是iPad
public let isPad = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)

//是否是iPhone
public let isPhone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

//适配屏幕宽度
public func FitPx(px:CGFloat) -> CGFloat {
    return (px)/2.0*(isPad ? 1.3 : SCALEW)
}

//获取屏幕分辨率
public let SCALE : CGFloat = UIScreen.main.scale

//获取状态栏的高度 iPhone X - 44pt  其他20pt
public let StatusBarHeight : CGFloat = UIApplication.shared.statusBarFrame.size.height

//获取导航栏高度
public let NavHeight: ((UIViewController)-> CGFloat) = {(vc : UIViewController ) -> CGFloat in
    weak var weakVC = vc;
    var navHeight = weakVC?.navigationController?.navigationBar.bounds.size.height ?? 0.0
    return (navHeight + StatusBarHeight)
}

//屏幕底部  tabBar高度49pt + 安全视图高度34pt(iPhone X)
public let TabBarHeight: ((UITabBarController)-> CGFloat) = {(vc : UITabBarController ) -> CGFloat in
    return vc.tabBar.frame.height
}
    //self.tabBarController.tabBar.frame.size.height

// MARK: ============================================================================
// MARK: 设置颜色
// 设置颜色值
public let HexRGB:((Int) -> UIColor) = { (rgbValue : Int) -> UIColor in
    return HexRGBAlpha(rgbValue,1.0)
}

// 通过 十六进制与alpha来设置颜色值  （ 样式： 0xff00ff ）
public let HexRGBAlpha:((Int,Float) -> UIColor) = { (rgbValue : Int, alpha : Float) -> UIColor in
    return UIColor(red: CGFloat(CGFloat((rgbValue & 0xFF0000) >> 16)/255), green: CGFloat(CGFloat((rgbValue & 0xFF00) >> 8)/255), blue: CGFloat(CGFloat(rgbValue & 0xFF)/255), alpha: CGFloat(alpha))
}
    
// MARK: ============================================================================
// MARK: Dictory Array Strig Object 闭包方式
//过滤null对象
public let kFilterNullOfObj:((Any)->Any?) = {(obj: Any) -> Any? in
    if obj is NSNull {
        return nil
    }
    return obj
}

//过滤null的字符串，当nil时返回一个初始化的空字符串
public let kFilterNullOfString:((Any)->String) = {(obj: Any) -> String in
    if obj is String {
        return obj as! String
    }
    return ""
}

// 过滤null的数组，当nil时返回一个初始化的空数组
public let kFilterNullOfArray:((Any)->Array<Any>) = {(obj: Any) -> Array<Any> in
    if obj is Array<Any> {
        return obj as! Array<Any>
    }
    return Array()
}


// 过滤null的字典，当为nil时返回一个初始化的字典
public let kFilterNullOfDictionary:((Any) -> Dictionary<AnyHashable, Any>) = {( obj: Any) -> Dictionary<AnyHashable, Any> in
    if obj is Dictionary<AnyHashable, Any> {
        return obj as! Dictionary<AnyHashable, Any>
    }
    return Dictionary()
}

