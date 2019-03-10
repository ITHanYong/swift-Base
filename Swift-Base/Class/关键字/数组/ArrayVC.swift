//
//  ArrayVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/8.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ArrayVC: UIViewController {
    
    //数组声明
    var arr = [Int]()
    
    var scrollView : UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "数组"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        
        arrayAddObject()
        traverse()
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //数组遍历：一
    func arrayAddObject() {
        
        arr = [1,2,3,4]
        
        for index in 0..<arr.count {
            print("\(index)")
        }
    }
    
    //数组遍历：二
    func traverse() {
        
        arr = [1,2,3,4]
        
        for (index, value) in arr.enumerated() {
            print("\(index) - \(value)")
        }
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
