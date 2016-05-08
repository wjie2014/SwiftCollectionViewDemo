//
//  SHomeCell.swift
//
//  Created by wangjie on 16/5/4.
//  Copyright © 2016年 wangjie. All rights reserved.
//

import UIKit

class SHomeCell: UICollectionViewCell {
    
    var titleLabel:UILabel?//title
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        titleLabel = UILabel(frame: CGRectMake(0, 0, (SCREEN_WIDTH - 20)/3, (SCREEN_WIDTH - 20)/3))
        titleLabel?.layer.cornerRadius = 4
        titleLabel?.layer.borderWidth = 0.5
        titleLabel?.textAlignment = NSTextAlignment.Center
        titleLabel?.layoutMargins = UIEdgeInsets(top:0, left:0, bottom:0, right:0)

        self .addSubview(titleLabel!)
    }
}
