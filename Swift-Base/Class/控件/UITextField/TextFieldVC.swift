//
//  TextFieldVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class TextFieldVC: UIViewController ,UITextFieldDelegate{
    
    var textField: UITextField!
    var textView:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "TextField"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        
        textField = UITextField()
        textField.frame = CGRect(x: 50, y: 20, width: SCREENW-100, height: 30)
        textField.placeholder = "请输入字符串"
        textField.placeholderColor = UIColor.init(white: 1.0, alpha: 0.4)
        textField.textColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        self.view.addSubview(textField)
        
        textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.frame = CGRect(x: 50, y: 80, width: SCREENW-100, height: 100)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .left
        textView.textColor = UIColor.white
        //textView.numberOfLines = 0
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 5
        textView.isUserInteractionEnabled = false
        self.view.addSubview(textView)
        
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        
        textView.text = textField.text
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
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
