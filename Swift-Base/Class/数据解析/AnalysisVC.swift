//
//  AnalysisVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/8.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

private let threeCellIdentifier = "threeCellIdentifier"

class AnalysisVC: UIViewController {

    lazy var threeTableView:UITableView = {
        let tabView = UITableView.init(frame: UIScreen.main.bounds)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.rowHeight = 220.0
        tabView.register(AnalysisCell.self, forCellReuseIdentifier: threeCellIdentifier)
        return tabView
    }()
    var ary:[Dictionary<String, Any>] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "解析"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        view.addSubview(threeTableView)
        Alamofire.request("http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1").responseJSON { (response) in
            let data:Dictionary<String,Any> = response.result.value as! Dictionary
            self.ary = data["lives"] as! [Dictionary<String, Any>]
            self.threeTableView.reloadData()
        }
    }
}


extension AnalysisVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ary.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: threeCellIdentifier, for: indexPath) as! AnalysisCell
        cell.model =  Mapper<AnalysisModel>().map(JSON: ary[indexPath.row])
        return cell;
        
    }
    
    
    
    
}
