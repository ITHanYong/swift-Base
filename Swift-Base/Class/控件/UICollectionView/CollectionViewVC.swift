//
//  CollectionViewVC.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Masonry

class CollectionViewVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var allScore:NSInteger?         //总分
    var ranking:NSInteger?          //排名
    
    let dataArray = NSMutableArray.init()
    var colors:NSArray?             //科目颜色数组
    
    var collectionView:UICollectionView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "CollectionView"
        self.view.backgroundColor = UIColor.colorWithHex(rgb: 0x5F94F4)
        
        let item = UIBarButtonItem.barButtonItemTaget(target: self, acton: #selector(back), imageNormal: "back_white_1", imageHighlighted: "back_white_1")
        self.navigationItem.leftBarButtonItem = item
        
        let layout = UICollectionViewFlowLayout.init()
        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.showsVerticalScrollIndicator = false
        self.view.addSubview(collectionView!)
        
        collectionView?.mas_makeConstraints({ (make:MASConstraintMaker?) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)?.offset()(16)
            make?.right.equalTo()(self.view)?.offset()(-16)
            make?.bottom.equalTo()(self.view)?.offset()(0)
        })
        
        //注册Cell
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "subjectCell")
        // 注册头视
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        // 注册底部
        collectionView?.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        
        self.requestData()
    }
    

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func dealScoreDetail(data:NSDictionary) {
        
        allScore = 0
        ranking = data["total_score"] as? NSInteger
        //let arrays = NSArray.init(object: data["subject"]!)
        let subject = data["subject"]
        
        for item in subject as! NSArray {
            let dict = item as! NSDictionary
            let score = dict["score"] as! NSInteger
            allScore = allScore! + score
            
            let model = CollectionViewModel.initWithData(dict: dict)
            dataArray.add(model)
        }
        
        DispatchQueue.main.async(execute: {
            self.collectionView?.reloadData()
        })
    }
    
    // MARK: - 设置CollectionView每组所包含的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if dataArray.count%2 == 0 {
            return dataArray.count
        }
        return dataArray.count+1
    }
    
    // MARK: - 设置CollectionCell的内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = "subjectCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        
        if (indexPath.item+1)%2 == 0 {
            cell.parity = false
        }else{
            cell.parity = true
        }
        
        if indexPath.item == dataArray.count {
            cell.model = nil
            cell.iconImageView.backgroundColor = UIColor.clear
        }else{
            
            cell.model = (dataArray[indexPath.row] as! CollectionViewModel)
            cell.iconImageView.backgroundColor = UIColor.UIColorFromRGB(rgb: colors?[indexPath.item] as! String)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind ==  UICollectionView.elementKindSectionHeader{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            
            //添加头视图的内容
            let headView = UIView.init()
            headView.frame = CGRect(x: 0, y: 0, width: SCREENW-16*2, height: 290)
            headView.backgroundColor = UIColor.clear
            
            //头视图添加view
            header.addSubview(headView)
            
            let whiteView1 = UIView.init()
            whiteView1.backgroundColor = UIColor.colorWithHex(rgb: 0xFFFFFF)
            whiteView1.layer.masksToBounds = true
            whiteView1.layer.cornerRadius = 2.5
            headView.addSubview(whiteView1)
            
            whiteView1.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(headView)?.offset()(46.5)
                make?.left.equalTo()(headView)
                make?.right.equalTo()(headView)
                make?.height.equalTo()(109.5)
            }
            
            //头像
            let icon = UIImageView.init()
            icon.backgroundColor = UIColor.gray
            icon.image = UIImage.init(named: "timg")
            icon.layer.masksToBounds = true
            icon.layer.cornerRadius = 68.5/2
            headView.addSubview(icon)
            
            icon.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(whiteView1.mas_top)?.offset()(-(68.5/2))
                make?.width.height().equalTo()(68.5)
                make?.centerX.equalTo()(headView.mas_centerX)
            }
            
            let nameLabel = UILabel.init()
            nameLabel.text = "姓名"
            nameLabel.textColor = UIColor.colorWithHex(rgb: 0x686B9E)
            nameLabel.font = UIFont.systemFont(ofSize: 18)
            nameLabel.textAlignment = .center
            whiteView1.addSubview(nameLabel)
            
            nameLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(whiteView1)?.offset()(40)
                make?.left.equalTo()(whiteView1)?.offset()(10)
                make?.right.equalTo()(whiteView1)?.offset()(-10)
                make?.height.equalTo()(20)
            }
            
            let detailLabel = UILabel.init()
            detailLabel.text = "详情"
            detailLabel.textColor = UIColor.colorWithHex(rgb: 0x686B9E)
            detailLabel.font = UIFont.systemFont(ofSize: 15)
            detailLabel.textAlignment = .center
            whiteView1.addSubview(detailLabel)
            
            detailLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(nameLabel.mas_bottom)?.offset()(13.5)
                make?.left.equalTo()(whiteView1)?.offset()(10)
                make?.right.equalTo()(whiteView1)?.offset()(-10)
                make?.height.equalTo()(16.5)
            }
            
            let whiteView2 = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREENW-16*2, height: 106.5))
            whiteView2.backgroundColor = UIColor.colorWithHex(rgb: 0xFFFFFF)
            
            //设置圆角 - 未取得whiteView2的frame
            whiteView2.layer.mask = UIBezierPath.configRectCorner(view: whiteView2, corner: [.topLeft, .topRight], radii: CGSize(width: 4, height: 4))
            
            headView.addSubview(whiteView2)
            whiteView2.mas_updateConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(whiteView1.mas_bottom)?.offset()(27.5)
                make?.left.equalTo()(headView)
                make?.right.equalTo()(headView)
                make?.bottom.equalTo()(headView)
            }
            
            let titleLabel = UILabel.init()
            titleLabel.layer.masksToBounds = true
            titleLabel.layer.cornerRadius = 4
            titleLabel.text = "成绩单"
            titleLabel.textColor = UIColor.colorWithHex(rgb: 0xFFFFFF)
            titleLabel.font = UIFont.systemFont(ofSize: 16)
            titleLabel.textAlignment = .center
            titleLabel.backgroundColor = UIColor.colorWithHex(rgb: 0xFF8181)
            headView.addSubview(titleLabel)
            
            titleLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.centerY.equalTo()(whiteView2.mas_top)
                make?.centerX.equalTo()(whiteView1.mas_centerX)
                make?.width.equalTo()(100)
                make?.height.equalTo()(28)
            }
            
            //分数图标
            let trophyImg = UIImageView.init()
            trophyImg.image = UIImage.init(named: "trophy")
            whiteView2.addSubview(trophyImg)
            
            trophyImg.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(whiteView2)?.offset()(34)
                make?.left.equalTo()(whiteView2)?.offset()(71)
                make?.width.equalTo()(48)
                make?.height.equalTo()(53.5)
            }
            
            let scoreStr = NSString.init(format: "总成绩%d分", allScore!)
            let string = NSMutableAttributedString.init(string: scoreStr as String)
            
            string.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.colorWithHex(rgb: 0x686B9E), range: NSRange(location: 0, length: 3))
            string.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 9), range: NSRange(location: 0, length: 3))
            
            string.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.colorWithHex(rgb: 0xFF6B6B), range: NSRange(location: 3, length: scoreStr.length-4))
            string.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15), range: NSRange(location: 3, length: scoreStr.length-4))
            
            string.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.colorWithHex(rgb: 0x686B9E), range: NSRange(location: scoreStr.length-1, length: 1))
            string.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 9), range: NSRange(location: scoreStr.length-1, length: 1))
            
            let score = UILabel.init()
            score.attributedText = string
            score.textAlignment = .left
            whiteView2.addSubview(score)
            
            score.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(whiteView2)?.offset()(31)
                make?.left.equalTo()(trophyImg.mas_right)?.offset()(21)
                make?.right.equalTo()(whiteView2)?.offset()(-10)
                make?.bottom.equalTo()(trophyImg.mas_centerY)
            }
            
            let rankStr = NSString.init(format: "班级排名%d", ranking!)
            let string2 = NSMutableAttributedString.init(string: rankStr as String)
            
            string2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.colorWithHex(rgb: 0x686B9E), range: NSRange(location: 0, length: 4))
            string2.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 9), range: NSRange(location: 0, length: 4))
            
            string2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.colorWithHex(rgb: 0xFF6B6B), range: NSRange(location: 4, length: rankStr.length-4))
            string2.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 9), range: NSRange(location: 4, length: rankStr.length-4))
            
            let rankLabel = UILabel.init()
            rankLabel.attributedText = string2
            rankLabel.textAlignment = .left
            whiteView2.addSubview(rankLabel)
            
            rankLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(score.mas_bottom)
                make?.left.equalTo()(trophyImg.mas_right)?.offset()(21)
                make?.right.equalTo()(whiteView2)?.offset()(-10)
                make?.bottom.equalTo()(trophyImg.mas_bottom)
            }
            
            return header
        }else{
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
            
            let footView = UIView.init()
            footView.frame = CGRect(x: 0, y: 0, width: SCREENW-16*2, height: 32.5)
            footView.backgroundColor = UIColor.white
            footer.addSubview(footView)
            
            footView.layer.mask = UIBezierPath.configRectCorner(view: footView, corner: [.bottomLeft, .bottomRight], radii: CGSize(width: 4, height: 4))
            
            let line = UIView.init()
            line.backgroundColor = UIColor.colorWithHex(rgb: 0xEDF0F9)
            footer.addSubview(line)
            
            line.mas_makeConstraints { (make:MASConstraintMaker?) in
                make?.top.equalTo()(footer)
                make?.left.equalTo()(footer)?.offset()(15)
                make?.right.equalTo()(footer)?.offset()(-15)
                make?.height.equalTo()(FitPx(px: 0.5))
            }
            
            return footer
        }
    }
    
    // MARK: - 每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - 最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0;
    }
    
    // MARK: - 最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0;
    }
    
    // MARK: - item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (SCREENW-32)/2, height: 64.5)
    }
    
    // MARK: - 每个分区 - 区头尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize (width: SCREENW-16*2, height: 290)
    }
    
    // MARK: - 每个分区区头尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize (width: SCREENW-16*2, height: 32.5)
    }
    
    func requestData() {
        
        colors = NSArray(array: ["#FF8181","#5C8AFF","#FFD556","#FFF088","#8E5CFF","#97F5E0","#93F39E","#8190FF","#E681FF","#D2FE8D","#FFAD56","#95DFFA","#FF9AE1","#FE8DAB", "#FF8181","#5C8AFF","#FFD556","#FFF088","#8E5CFF","#97F5E0","#93F39E","#8190FF","#E681FF","#D2FE8D","#FFAD56","#95DFFA","#FF9AE1","#FE8DAB", "#FF8181","#5C8AFF","#FFD556","#FFF088","#8E5CFF","#97F5E0","#93F39E","#8190FF","#E681FF","#D2FE8D","#FFAD56","#95DFFA","#FF9AE1","#FE8DAB", "#FF8181","#5C8AFF","#FFD556","#FFF088","#8E5CFF","#97F5E0","#93F39E","#8190FF","#E681FF","#D2FE8D","#FFAD56","#95DFFA","#FF9AE1","#FE8DAB"])
        
        let data = NSDictionary.init(dictionary: [
            "total_score":200,
            "subject":[
                [
                    "created_at" : "2018-07-25 16:57:41",
                    "id" : "3",
                    "lesson_id" : "2",
                    "lesson_name" : "语文",
                    "operator" : "2",
                    "score" : 79,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 16:57:41"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ],
                [
                    "created_at" : "2018-07-25 19:16:29",
                    "id" : "5",
                    "lesson_id" : "4",
                    "lesson_name" : "数学",
                    "operator" : "2",
                    "score" : 99,
                    "score_order": 10,
                    "st" : "1",
                    "status" : "1",
                    "student" : "1",
                    "term" : "3",
                    "updated_at" : "2018-07-25 19:16:29"
                ]
            ]])
        
        self.dealScoreDetail(data: data)
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
