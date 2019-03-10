//
//  UITextViewVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class UITextViewVC: UIViewController, UITextViewDelegate{

    var textView: UITextView!
    var placeholder: UITextView!
    var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "UITextView"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        /** 通过两个UITextView重叠的方式来实现placeholder提示，底下的UITextView用户不可点击，顶层的UITextView的text内容长度大于0时，清空底层的UITextView的text*/
        
        placeholder = setTextView(isActive: false, text: "请输入字符串",textColor: UIColor.init(white: 1.0, alpha: 0.4))
        self.view.addSubview(placeholder)
        
        textView = setTextView(isActive: true, text: "",textColor: UIColor.white)
        self.view.addSubview(textView)
        
        detailLabel = UILabel()
        detailLabel.frame = CGRect(x: 50, y: 140, width: SCREENW-100, height: 100)
        detailLabel.textColor = UIColor.white
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        detailLabel.layer.borderWidth = 0.5
        detailLabel.layer.borderColor = UIColor.white.cgColor
        detailLabel.layer.masksToBounds = true
        detailLabel.layer.cornerRadius = 5
        detailLabel.numberOfLines = 0
        self.view.addSubview(detailLabel)
        
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTextView(isActive:Bool,text:String,textColor:UIColor) -> UITextView {
        
        let textView = UITextView.init(frame: CGRect(x: 50, y: 20, width: SCREENW-100, height: 100))
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

    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.count>0 {
            placeholder.text = ""
        }else{
            placeholder.text = "请输入字符串"
        }
        
        detailLabel.text = textView.text
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
