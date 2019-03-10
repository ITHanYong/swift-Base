//
//  KeywordVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class KeywordVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var titles: Array<String>!
    var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "关键字"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        
        titles = ["字符串","数组","字典","闭包"]
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH-TabBarHeight(self.tabBarController!)-NavHeight(self)), style: .grouped)
        tableView.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celliD = "keywordCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: celliD) as? KeywordCell
        if cell == nil {
            cell = KeywordCell(style: .default, reuseIdentifier: celliD)
        }
        
        cell?.titleLabel.text = titles[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath) as? KeywordCell
        
        
        switch indexPath.row {
        case 0:
            let vc = StringVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = ArrayVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = DictionaryVC()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case 3:
            let vc = ClosureVC()
            vc.hidesBottomBarWhenPushed = true
            vc.returnValueBlock = {(value:String)-> Bool in
                //cell?.titleLabel.text = value
                let content = cell?.detailLabel.text
                
                if content == nil {
                    cell?.detailLabel.text = value
                }else {
                    cell?.detailLabel.text = String.init(format: "%@\n%@", content ?? "", value)
                }
                //tableView .reloadRows(at: [indexPath], with: .none)
                tableView.reloadData()
                return true
            }
            
            vc.returnValueBlock1 = {(value:String)-> Void in
                //cell?.titleLabel.text = value
                let content = cell?.detailLabel.text
                
                if content == nil {
                    cell?.detailLabel.text = value
                }else {
                    cell?.detailLabel.text = String.init(format: "%@\n%@", content ?? "", value)
                }
                
                //tableView .reloadRows(at: [indexPath], with: .none)
                tableView.reloadData()
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            
            break
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
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
