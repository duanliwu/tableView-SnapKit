//
//  PullViewController.swift
//  tableView
//
//  Created by 段立武 on 2017/3/23.
//  Copyright © 2017年 小小段. All rights reserved.
//

import UIKit
import SnapKit

class PullViewController: UIViewController {

    let photoview = UIView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        photoview.backgroundColor = UIColor.red
        label.text = "适配"
        label.backgroundColor = UIColor.orange
        //photoview.frame = CGRect(x:40,y:10,width:200,height:50)
        self.view.addSubview(photoview)
        self.view.addSubview(label)
        
        photoview.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        
        label.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(photoview.snp.left).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.top.equalTo(photoview.snp.bottom)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //返回上一个界面
        self.dismiss(animated: true, completion: nil)
    }




}
