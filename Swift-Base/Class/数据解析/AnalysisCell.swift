//
//  AnalysisCell.swift
//  Swift-Base
//
//  Created by Mac on 2019/3/8.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SDWebImage
import Masonry

class AnalysisCell: UITableViewCell {
    
    var model:AnalysisModel!{
        didSet{
            nameLabel.text = model.creator!.nick! + model.city!
            let str = model.creator!.portrait
            picImgView.sd_setImage(with: URL.init(string: str!), completed: nil)
            
        }
    }
    
    
    lazy var nameLabel:UILabel = {
        let la = UILabel.init()
        la.textAlignment = .center
        return la;
    }()
    
    lazy var picImgView:UIImageView = {
        let imgView = UIImageView.init()
        return imgView;
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        addCons()
    }
    
    func setupUI(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(picImgView)
        
    }
    
    func addCons(){
        
        nameLabel.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.left.equalTo()(contentView)?.offset()(10)
            make?.right.equalTo()(contentView.mas_right)?.offset()(-10)
            make?.top.equalTo()(contentView)?.offset()(10)
            make?.height.equalTo()(50)
        }
        
        picImgView.mas_makeConstraints { (make:MASConstraintMaker?) in
            make?.centerX.equalTo()(contentView.mas_centerX)
            make?.centerY.equalTo()(contentView.mas_centerY)
            make?.height.equalTo()(120)
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
