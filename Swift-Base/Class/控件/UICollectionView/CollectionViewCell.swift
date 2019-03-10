//
//  CollectionViewCell.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/6.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Masonry

class CollectionViewCell: UICollectionViewCell {
    
    let topLine = UIView.init()
    let leftLine = UIView.init()
    let bottomLine = UIView.init()
    let rightLine = UIView.init()
    
    let iconImageView = UIImageView.init()
    let nameLabel = UILabel.init()
    let detailLabel = UILabel.init()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.white
        self.layoutSubview()
    }
    
    var model: CollectionViewModel? {
        didSet{
            if model == nil {
                iconImageView.alpha = 0
                nameLabel.alpha = 0
                detailLabel.alpha = 0
            }else{
                iconImageView.alpha = 1
                nameLabel.alpha = 1
                detailLabel.alpha = 1
            }
            
            nameLabel.text = model?.subject
            detailLabel.text = model?.score
        }
    }
    
    // 传入 parity 参数
    var parity: Bool? {
        didSet{
            if parity! {
                leftLine.alpha = 0
                rightLine.alpha = 1
                topLine.mas_updateConstraints { (make:MASConstraintMaker?) in
                    make?.left.equalTo()(contentView)?.offset()(15)
                    make?.right.equalTo()(contentView)
                }
                bottomLine.mas_updateConstraints { (make:MASConstraintMaker?) in
                    make?.left.equalTo()(contentView)?.offset()(15)
                    make?.right.equalTo()(contentView)
                }
            }else{
                rightLine.alpha = 0
                leftLine.alpha = 1
                topLine.mas_updateConstraints { (make:MASConstraintMaker?) in
                    make?.left.equalTo()(contentView)
                    make?.right.equalTo()(contentView)?.offset()(-15)
                }
                bottomLine.mas_updateConstraints { (make:MASConstraintMaker?) in
                    make?.left.equalTo()(contentView)
                    make?.right.equalTo()(contentView)?.offset()(-15)
                }
            }
        }
    }
    
    
    // MARK: - 添加约束
    func layoutSubview() {
        
        iconImageView.backgroundColor = UIColor.gray
        contentView.addSubview(iconImageView)
        
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.colorWithHex(rgb: 0x686B9E)
        contentView.addSubview(nameLabel)
        
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.textAlignment = .left
        detailLabel.textColor = UIColor.colorWithHex(rgb: 0x686B9E)
        contentView.addSubview(detailLabel)
        
        topLine.backgroundColor = UIColor.colorWithHex(rgb: 0xEDF0F9)
        contentView.addSubview(topLine)
        
        leftLine.backgroundColor = UIColor.colorWithHex(rgb: 0xEDF0F9)
        contentView.addSubview(leftLine)
        
        bottomLine.backgroundColor = UIColor.colorWithHex(rgb: 0xEDF0F9)
        contentView.addSubview(bottomLine)
        
        rightLine.backgroundColor = UIColor.colorWithHex(rgb: 0xEDF0F9)
        contentView.addSubview(rightLine)
        
        iconImageView.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)?.offset()(15.5)
            make?.left.equalTo()(contentView)?.offset()(15)
            make?.width.equalTo()(3)
            make?.height.equalTo()(14)
        }
        
        nameLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.left.equalTo()(iconImageView.mas_right)?.offset()(5.5)
            make?.right.equalTo()(contentView)?.offset()(-10)
            make?.height.equalTo()(18)
            make?.centerY.equalTo()(iconImageView.mas_centerY)
        }
        
        detailLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(nameLabel.mas_bottom)?.offset()(4.5)
            make?.left.equalTo()(iconImageView.mas_right)?.offset()(5.5)
            make?.right.equalTo()(contentView)?.offset()(-10)
            make?.height.equalTo()(18)
        }
        
        topLine.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)
            make?.left.equalTo()(contentView)
            make?.right.equalTo()(contentView)
            make?.height.equalTo()(FitPx(px: 0.5))
        }
        
        leftLine.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)
            make?.left.equalTo()(contentView)
            make?.bottom.equalTo()(contentView)
            make?.width.equalTo()(FitPx(px: 0.5))
        }
        
        bottomLine.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.bottom.equalTo()(contentView)
            make?.left.equalTo()(contentView)
            make?.right.equalTo()(contentView)
            make?.height.equalTo()(FitPx(px: 0.5))
        }
        
        rightLine.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.top.equalTo()(contentView)
            make?.right.equalTo()(contentView)
            make?.bottom.equalTo()(contentView)
            make?.width.equalTo()(FitPx(px: 0.5))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
