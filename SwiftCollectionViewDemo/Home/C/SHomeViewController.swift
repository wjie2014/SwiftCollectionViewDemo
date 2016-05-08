//
//  SHomeViewController.swift
//
//  Created by wangjie on 16/5/4.
//  Copyright © 2016年 wangjie. All rights reserved.
//

import UIKit

class SHomeViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var collectionView : UICollectionView?
    var dataArr = NSMutableArray()//数据源
    var headerArr = NSMutableArray()//分组标题
    let headerHeight:CGFloat = 30
    let cellHeight:CGFloat = (SCREEN_WIDTH - 20)/3
    let headerIdentifier:String = "headView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initData()
    }
    
    func initView(){
        let layout = UICollectionViewFlowLayout()
        self.view.backgroundColor = UIColor.whiteColor()
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumInteritemSpacing = 5; // this number could be anything <=5. Need it here because the default is 10.
        layout.minimumLineSpacing = 4.0 //设置行间距
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 20)/3, (SCREEN_WIDTH - 20)/3) // 20 is 2*5 for the 2 edges plus 2*5 for the spaces between the cells
        
        collectionView = UICollectionView(frame: CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT), collectionViewLayout: layout)
        //注册一个cell
        collectionView!.registerClass(SHomeCell.self, forCellWithReuseIdentifier:"cell")
        collectionView?.delegate = self;
        collectionView?.dataSource = self;
        collectionView?.backgroundColor = UIColor.whiteColor()
        //设置每一个cell的宽高
        self.view.addSubview(collectionView!)
        //注册header
        collectionView!.registerClass(SHomeHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }
    
    func initData(){
        initHeaderData()
        initSelectionData()
        self.collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //返回多少个组
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return headerArr.count
    }
    
    //返回多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    //返回自定义的cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SHomeCell
        let title = dataArr[indexPath.row]
        cell.titleLabel?.text = title as? String
        return cell
        
    }
    
    func initHeaderData() {
        
        headerArr.addObject("header 1")
        headerArr.addObject("header 2")
        headerArr.addObject("header 3")
        
    }
    
    func initSelectionData() {
        
        dataArr.addObject("selection 1")
        dataArr.addObject("selection 2")
        dataArr.addObject("selection 3")
        
    }
    
    
    //设置HeadView的宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: SCREEN_WIDTH, height: headerHeight)
    }
    
    //返回自定义HeadView
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        var v = SHomeHeader()
        if kind == UICollectionElementKindSectionHeader{
            v = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath) as! SHomeHeader
            let title:String = headerArr[indexPath.section] as! String
            v.titleLabel?.text = title
        }
        return v
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell!.layer.cornerRadius = 4
        cell?.backgroundColor = UIColor.yellowColor()
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell!.layer.cornerRadius = 4
        cell?.backgroundColor = UIColor.whiteColor()
    }
    
}
