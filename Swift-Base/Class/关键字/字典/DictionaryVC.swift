//
//  DictionaryVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/8.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class DictionaryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "字典"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
    }
    
    @objc func back() {
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
