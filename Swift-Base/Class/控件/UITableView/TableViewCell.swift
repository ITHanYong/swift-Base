//
//  TableViewCell.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Masonry

class TableViewCell: UITableViewCell {
    
    let width:CGFloat = UIScreen.main.bounds.width
    
    var userLabel:UILabel!      //姓名
    var detailLabel:UILabel!     //出生日期
    var sexLabel:UILabel!       //性别
    var iconImage:UIImageView!  //头像
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //设置cell点击样式
        self.selectionStyle = .none
        //设置分割线的边距
        self.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        
        //头像
        iconImage = UIImageView()
        iconImage.layer.masksToBounds = true
        iconImage.layer.cornerRadius = 33.0/2;
        contentView.addSubview(iconImage)
        
        iconImage.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)?.offset()(10)
            make?.left.equalTo()(contentView)?.offset()(20)
            make?.width.equalTo()(33)
            make?.height.equalTo()(33)
        }
        
        //姓名
        userLabel = UILabel()
        userLabel.textColor = UIColor.black
        userLabel.font = UIFont.boldSystemFont(ofSize: 13)
        userLabel.textAlignment = .left
        contentView.addSubview(userLabel)
        
        userLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)?.offset()(10)
            make?.left.equalTo()(iconImage.mas_right)?.offset()(10)
            make?.right.equalTo()(contentView.mas_right)?.offset()(-10)
            make?.bottom.equalTo()(iconImage.mas_centerY)
        }
        
        //性别 · 出生日期
        sexLabel = UILabel()
        sexLabel.textColor = UIColor.black
        sexLabel.font = UIFont.systemFont(ofSize: 13)
        sexLabel.textAlignment = .left
        contentView.addSubview(sexLabel)
        
        sexLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(iconImage.mas_centerY)
            make?.left.equalTo()(iconImage.mas_right)?.offset()(10)
            make?.right.equalTo()(contentView.mas_right)?.offset()(-10)
            make?.bottom.equalTo()(iconImage.mas_bottom)
        }
        
        //详情
        detailLabel = UILabel()
        detailLabel.textColor = UIColor.gray
        detailLabel.font = UIFont.systemFont(ofSize: 13)
        detailLabel.textAlignment = .left
        detailLabel.numberOfLines = 0
        contentView.addSubview(detailLabel)
        
        detailLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(iconImage.mas_bottom)?.offset()(10)
            make?.left.equalTo()(contentView)?.offset()(10)
            make?.right.equalTo()(contentView.mas_right)?.offset()(-10)
            make?.bottom.equalTo()(contentView.mas_bottom)?.offset()(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
