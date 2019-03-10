//
//  ControlsVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ControlsVC: UIViewController {
    
    var titles: Array<String>!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "控件"
        
        initUI()
    }
    
    func initUI() {
        
        titles = ["UILabel","UIButton","UITableView","UICollectionView","UITextField","UITextView","UIScrollView"]
        
        for index in 0..<titles.count {
            
            let button = UIButton.init(type: UIButton.ButtonType.custom)
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 0.5
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 15.0
            button.frame = CGRect(x: 20, y: (20 + CGFloat(index) * 40.0), width: 150, height: 30)
            button.setTitle(titles[index], for: UIControl.State.normal)
            button.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            button.tag = index + 100
            button.addTarget(self, action: #selector(btnClick(sender:)), for: UIControl.Event.touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    @objc func btnClick(sender:UIButton) {
        
        switch sender.tag {
        case 100:
            print("\(NavHeight(self))")
            break
        case 101:
            print("UIButton")
            break
        case 102:
            let vc = TableViewVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 103:
            let vc = CollectionViewVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 104:
            let vc = TextFieldVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 105:
            let vc = UITextViewVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 106:
            let vc = UIScrollViewVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            print("default")
            break
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
