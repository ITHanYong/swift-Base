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
    
    var model: DMModel?
    //请求参数
    
    let pi = 1
    let pz = 1
    
    lazy var segment: UISegmentedControl = {
        let tempView = UISegmentedControl(items: [ "链式", "AFN式-登录"])
        tempView.frame = CGRect(x:0, y: 0, width: self.view.frame.width, height: 40)
        tempView.selectedSegmentIndex = 0
        tempView.addTarget(self, action: #selector(clickSegment), for: .valueChanged)
        tempView.tintColor = UIColor.white
        return tempView
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect(x:0, y: 40, width: self.view.frame.width, height: self.view.frame.height - 40), style: .plain)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        
        table.delegate = self
        table.dataSource = self
        table.register(DMCell.self, forCellReuseIdentifier: "DMCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "解析"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        self.view.addSubview(segment)
        self.view.addSubview(tableView)
        
        loadDataByChain()
    }
    
    @objc func clickSegment() {
        switch segment.selectedSegmentIndex {
        
        case 0:
            loadDataByChain()
        case 1:
            loadDataByAFN()
        default:
            break
        }
    }
    
    /// moya请求
    func loadDataByMoay() {
        HttpRequest.loadData(target: DMAPI.rankList, cache: true, success: { (json) in
            let decoder = JSONDecoder()
            let model = try? decoder.decode(DMModel.self, from: json)
            self.model = model
            self.tableView.reloadData()
        }, failure: nil)
    }
    
    /// 链式请求
    func loadDataByChain() {
//        NetworkKit().url("http://app.u17.com/v3/appV3_3/ios/phone/rank/list").requestType(.post).success { (json) in
//
//            print("json - \(json)")
//
//            let decoder = JSONDecoder()
//            let model = try? decoder.decode(DMModel.self, from: json)
//            self.model = model
//            self.tableView.reloadData()
//
//        }.failure { (state_code, message) in
//
//        }.request()
        
        
        NetworkKit().url("http://10.10.20.192:8080/api/student/leave/leaveList").requestType(.get).params(["page":1]).success { (data) in
            
            let decoder = JSONDecoder()
            let model = try? decoder.decode(ListModel.self, from: data)
            print(model?.data)
        }.failure { (code, message) in
            
            print(message)
        }.request()
        
    }
    
    /// 类AFN请求
    func loadDataByAFN() {
//        NetworkTools.POST(url: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list", params: nil, success: { (json) in
//            let decoder = JSONDecoder()
//            let model = try? decoder.decode(DMModel.self, from: json)
//            self.model = model
//            self.tableView.reloadData()
//        }) { (state_code, message) in
//
//        }
        
        NetworkTools.POST(url: "http://10.10.20.192:8080/api/student/auth/login", params: ["account": "LH1001", "password": "123456", "code": "123456"], success: { (data) in
            
            let decoder = JSONDecoder()
            let model = try? decoder.decode(AnalysisModel.self, from: data)
            
            //设置存储信息
            UserDefaults.standard.set("LH1001", forKey: "account")
            UserDefaults.standard.set("123456", forKey: "password")
            UserDefaults.standard.set(model?.data, forKey: "Token")
            UserDefaults.standard.set("123456", forKey: "code")
            //设置同步
            UserDefaults.standard.synchronize()
            
        }) { (code, message) in
            print(message)
        }
    }
}


extension AnalysisVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.returnData?.rankinglist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DMCell = tableView.dequeueReusableCell(withIdentifier: "DMCell", for: indexPath) as! DMCell
        cell.model = model?.data.returnData?.rankinglist?[indexPath.row]
        return cell
    }
    
    
    
    
}
