//
//  SHomeHeader.swift
//
//  Created by wangjie on 16/5/4.
//  Copyright © 2016年 wangjie. All rights reserved.
//

import UIKit

class SHomeHeader: UICollectionReusableView {
    var titleLabel:UILabel?//title

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    func initView(){
        titleLabel = UILabel(frame: CGRectMake(0, 0, SCREEN_WIDTH, 30))
        titleLabel?.backgroundColor = HEADER_BG_COLOR
        self .addSubview(titleLabel!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
