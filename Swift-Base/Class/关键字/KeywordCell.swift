//
//  KeywordCell.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Masonry

class KeywordCell: UITableViewCell {
    
    var backView:UIView!
    var titleLabel:UILabel!
    var detailLabel:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        
        self.selectionStyle = .none
        
        backView = UIView()
        backView.backgroundColor = UIColor.white
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        contentView.addSubview(backView)
        
        backView.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)?.offset()(10)
            make?.left.equalTo()(contentView)?.offset()(10)
            make?.bottom.equalTo()(contentView.mas_bottom)
            make?.right.equalTo()(contentView.mas_right)?.offset()(-10)
        }
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.darkGray
        backView.addSubview(titleLabel)
        
        titleLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(backView)?.offset()(10)
            make?.left.equalTo()(backView)?.offset()(10)
            make?.right.equalTo()(backView.mas_right)?.offset()(-10)
            make?.height.equalTo()(30)
        }
        
        detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 18)
        detailLabel.textAlignment = .center
        detailLabel.textColor = UIColor.darkGray
        detailLabel.numberOfLines = 0
        backView.addSubview(detailLabel)
        
        detailLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(titleLabel.mas_bottom)?.offset()(10)
            make?.left.equalTo()(backView)?.offset()(10)
            make?.bottom.equalTo()(backView.mas_bottom)?.offset()(-10)
            make?.right.equalTo()(backView.mas_right)?.offset()(-10)
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
