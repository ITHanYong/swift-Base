//
//  ClosureVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

//闭包传值一
typealias BlockOne = (_ message:String)-> Bool

//闭包传值二
typealias BlockTwo = (_ message:String)-> Void

class ClosureVC: UIViewController {

    //定义一个闭包变量
    var returnValueBlock: BlockOne?
    
    var returnValueBlock1: BlockTwo?
    
    let label = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "闭包"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: 50, y: 100, width: 200, height: 20)
        btn.setTitle("闭包传值：一", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(testVC), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
        let btn1 = UIButton.init(type: UIButton.ButtonType.custom)
        btn1.frame = CGRect(x: 50, y: 140, width: 200, height: 20)
        btn1.setTitle("闭包传值：二", for: UIControl.State.normal)
        btn1.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn1.addTarget(self, action: #selector(testVC1), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn1)
        
        label.frame = CGRect(x: 100, y: 200, width: 300, height: 30)
        label.textColor = UIColor.orange
        label.textAlignment = .left
        self.view.addSubview(label)
        
        
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func testVC() {
        
        //闭包 - 传参
        if returnValueBlock != nil {
            
            let formater = DateFormatter.dateFormaterWithMode(formaterMode: ECDateFormaterMode.second)
            var dateT: String!
            dateT = formater.string(from: Date())
            returnValueBlock1!(dateT)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func testVC1() {
        
        //闭包 - 传参
        if returnValueBlock != nil {
            
            let formater = DateFormatter.dateFormaterWithMode(formaterMode: ECDateFormaterMode.day)
            var dateT: String!
            dateT = formater.string(from: Date())
            
            label.text = returnValueBlock!(dateT) ? "成功" : "失败"
            print("\(label.text)")
        }
        
        self.navigationController?.popViewController(animated: true)
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
