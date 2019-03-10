//
//  TableViewVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController ,UITableViewDelegate ,UITableViewDataSource{

    var dataSource = [[NSString:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "TableView"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        dataSource = [["name":"王小明","sex":"男","icon":"timg","birthday":"2017-10-11","detail":"我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数"],
                      ["name":"李磊","sex":"男","icon":"timg","birthday":"2011-12-30","detail":"我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数"],
                      ["name":"韩梅","sex":"女","icon":"timg","birthday":"2014-9-10","detail":"我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数"],
                      ["name":"JIM","sex":"男","icon":"timg","birthday":"2008-10-1","detail":"我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数据我是假数"]]
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celliD = "TableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: celliD) as? TableViewCell
        if cell == nil {
            cell = TableViewCell(style: .subtitle, reuseIdentifier: celliD)
        }
        
        let dict:NSDictionary = dataSource[indexPath.row] as NSDictionary
        
        cell?.iconImage.image = UIImage(named: dict["icon"]! as! String)
        cell?.userLabel.text = dict["name"] as? String
        cell?.sexLabel.text = String.init(format: "%@ · %@", dict["sex"] as! String, dict["birthday"] as! String)
        cell?.detailLabel.text = dict["detail"] as? String;
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
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
