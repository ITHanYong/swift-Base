//
//  UIBarButtonItem+Extension.swift
//  ElectronicCard
//
//  Created by Mac on 2019/2/27.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

import UIKit

extension UIBarButtonItem {
    
    /**
     *  创建一个item
     *
     *  @param taget            点击item后调用哪个对象方法
     *  @param action           点击item后调用target的哪个方法
     *  @param imageNormal      默认的图片
     *  @param imageHighlighted 高亮的图片
     *
     *  @return 创建完的item
     */
    static func barButtonItemTaget(target:Any, acton: Selector, imageNormal: String, imageHighlighted:String) -> UIBarButtonItem {
        
        let button = UIButton.init(type: .custom)
        button.setBackgroundImage(UIImage.init(named: imageNormal), for: .normal)
        button.setBackgroundImage(UIImage.init(named: imageHighlighted), for: .selected)
        button.addTarget(target, action: acton, for: .touchUpInside)
        button.frame.size = (button.currentBackgroundImage?.size)!
        return UIBarButtonItem.init(customView: button)
    }
    
    /**
     创建item   真机无法显示文字内容，可能是frame不足
     
     @param taget               点击item后调用哪个对象方法
     @param action              点击item后调用target的哪个方法
     @param colorNormal         默认文字颜色
     @param colorHighlighted    选中时字体颜色
     @param title               标题
     @param weight              字重
     @param fontSize            字号
     @return                    创建完的item
     */
    static func barButtonItemTaget(target:AnyObject, acton: Selector, colorNormal: Int, colorHighlighted:Int, title:String, weight:NSInteger, fontSize:CGFloat) -> UIBarButtonItem {
        
        let item = UIBarButtonItem.init()
        
        //设置默认属性
        let itemAttrs = NSMutableDictionary.init()
        itemAttrs[NSAttributedString.Key.foregroundColor] = UIColor.colorWithHex(rgb: colorNormal)
        if #available(iOS 8.2, *) {
            itemAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: fontSize, weight: .init(rawValue: CGFloat(weight)))
        } else {
            // Fallback on earlier versions
            itemAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: fontSize)
        }
        
        //设置选中属性
        let itemDisabledAttrs = NSMutableDictionary.init()
        itemDisabledAttrs[NSAttributedString.Key.foregroundColor] = UIColor.colorWithHex(rgb: colorHighlighted)
        item.setTitleTextAttributes(itemDisabledAttrs as? [NSAttributedString.Key : Any], for: .highlighted)
        
        //设置点击事件
        item.action = acton
        
        //设置对象
        item.target = target
        
        //设置导航栏按钮的内容
        item.title = title
        
        return item
    }
}
