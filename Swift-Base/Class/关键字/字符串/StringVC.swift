//
//  StringVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class StringVC: UIViewController ,UITextViewDelegate{
    
   
    var textView: UITextView!
    var placeholder: UITextView!
    
    var textView1: UITextView!
    var placeholder1: UITextView!
    
    var detailView1: UITextView!
    
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    var btn5: UIButton!
    var btn6: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "字符串"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        /** 通过两个UITextView重叠的方式来实现placeholder提示，底下的UITextView用户不可点击，顶层的UITextView的text内容长度大于0时，清空底层的UITextView的text*/
        
        placeholder = setTextView(frame:CGRect(x: 50, y: 20, width: SCREENW-100, height: 80),isActive: false, text: "请输入字符串一",textColor: UIColor.init(white: 1.0, alpha: 0.4))
        self.view.addSubview(placeholder)
        
        textView = setTextView(frame:CGRect(x: 50, y: 20, width: SCREENW-100, height: 80),isActive: true, text: "",textColor: UIColor.white)
        self.view.addSubview(textView)
        
        placeholder1 = setTextView(frame:CGRect(x: 50, y: 120, width: SCREENW-100, height: 80),isActive: false, text: "请输入字符串二",textColor: UIColor.init(white: 1.0, alpha: 0.4))
        self.view.addSubview(placeholder1)
        
        textView1 = setTextView(frame:CGRect(x: 50, y: 120, width: SCREENW-100, height: 80),isActive: true, text: "",textColor: UIColor.white)
        self.view.addSubview(textView1)
        
        detailView1 = setTextView(frame:CGRect(x: 50, y: 220, width: SCREENW-100, height: 80),isActive: true, text: "结果显示",textColor: UIColor.init(white: 1.0, alpha: 0.4))
        self.view.addSubview(detailView1)
        
        btn1 = setButton(frame: CGRect(x: 50, y: 320, width: 80, height: 30), title: "拼接", action:  #selector(jointString))
        self.view.addSubview(btn1)
        
        btn2 = setButton(frame: CGRect(x: 50, y: 360, width: 160, height: 30), title: "根据字符分割", action:  #selector(divisionString))
        self.view.addSubview(btn2)
        
        btn3 = setButton(frame: CGRect(x: 50, y: 400, width: 160, height: 30), title: "根据字符串分割", action:  #selector(divisionString))
        self.view.addSubview(btn3)
        
        btn4 = setButton(frame: CGRect(x: 50, y: 440, width: 160, height: 30), title: "清除指定字符", action:  #selector(removeString))
        self.view.addSubview(btn4)
        
        btn5 = setButton(frame: CGRect(x: 50, y: 480, width: 160, height: 30), title: "清除指定字符串", action:  #selector(removeString))
        self.view.addSubview(btn5)
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - 字符串拼接
    @objc func jointString() {
        
        let str1:String! = self.textView.text
        let str2:String! = self.textView1.text
        
        let str3 = str1 + str2
        
        if str3.count>0 {
            detailView1.text = str3
        }else{
            detailView1.text = "结果提示"
        }
    }
    
    // MARK: - 字符串分割
    @objc func divisionString(sender:UIButton) {
        
        let str1:String! = self.textView.text
        let str2:String! = self.textView1.text
        
        let array : Array<String>!
        
        //将数组分割成数组
        if sender == btn2 {
            //根据字符分割
            array = str1.components(separatedBy: NSCharacterSet(charactersIn: str2) as CharacterSet)
        }else{
            //根据字符串分割
            array = str1.components(separatedBy: str2)
        }
        
        if array.count>0 {
            //将数组根据拼接成字符串
            let arrayStr : String! = array.joined(separator: ",\n")
            detailView1.text = arrayStr
        }else{
            detailView1.text = "结果提示"
        }
    }
    
    // MARK: - 清除子字符串
    @objc func removeString(sender:UIButton) {
        
        let str1:String! = self.textView.text
        let str2:String! = self.textView1.text
        
        //将数组分割成数组
        //let array : Array = str1.components(separatedBy: str2)
        
        
        var str3 : String!
        //清除字符
        if sender == btn4 {
            //清除指定字符
            str3 = str1.trimmingCharacters(in: NSCharacterSet(charactersIn: str2) as CharacterSet)
        }else{
            //清除指定字符串
            str3 = str1.replacingOccurrences(of: str2, with: "")
        }
        
        detailView1.text = str3
    }
    
    // MARK: - 字符串截取
    @objc func getSubString() {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView == self.textView{
            
            if textView.text.count>0 {
                placeholder.text = ""
            }else{
                placeholder.text = "请输入字符串"
            }
        }else{
            
            if textView1.text.count>0 {
                placeholder1.text = ""
            }else{
                placeholder1.text = "请输入字符串"
            }
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView == self.detailView1 {
            return false
        }
        return true
    }
    
    func setTextView(frame:CGRect,isActive:Bool,text:String,textColor:UIColor) -> UITextView {
        
        let textView = UITextView.init(frame: frame)
        textView.backgroundColor = UIColor.clear
        textView.toolbarPlaceholder = "请输入字符串"
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .left
        textView.textColor = textColor
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 5
        textView.delegate = self
        textView.text = text
        textView.isUserInteractionEnabled = isActive
        return textView
    }
    
    func setButton(frame:CGRect,title:String,action:Selector)-> UIButton {
        
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.frame = frame
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.black, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 15.0
        btn.addTarget(self, action: action, for: .touchUpInside)
        btn.sizeToFit()
        return btn
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
