//
//  ViewController.swift
//  tableView
//
//  Created by 段立武 on 2017/3/23.
//  Copyright © 2017年 小小段. All rights reserved.
//

import UIKit


var KSize = UIScreen.main.bounds
var dataTable:UITableView!

var itemstringArr = ["CEO","产品规划","UI设计","项目估算","软硬件搭建","开发人员上手"]

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SwiftTableView细化"
     makeTable()
    
    }
    
    func makeTable()
    {
        
        dataTable=UITableView.init(frame: CGRect(x: 0, y: 0, width: KSize.width, height: KSize.height-64), style:.grouped)
        dataTable.delegate = self
        dataTable.dataSource = self
        self.view.addSubview(dataTable)
        
        //tablefooter
        
        let  headerView:UIView = UIView(frame:CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:60))
        let  label = UILabel(frame:CGRect(x:20,y:20,width:180,height:30))
        label.text = "tableView的页头"
        label.textColor = UIColor.orange
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor.red
        dataTable?.tableHeaderView = headerView
        
    }
    
    //MARK:table代理
    
    //段数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemstringArr.count
    }
    //行号
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    /*
     //头部高度
     //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     //        return 20
     //    }
     //尾部高度
     //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     //        return 40
     //    }
     //
     */
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
            
        }
        cell?.textLabel?.text = itemstringArr[indexPath.row]
        cell?.detailTextLabel?.text = "待添加内容"
        cell?.detailTextLabel?.font = UIFont .systemFont(ofSize: CGFloat(13))
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell!
        
    }
    
    //选中cell触发的代理
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row = SelectRow第\(indexPath.row)行")
        
        let push = PullViewController()
        
        self.present(push, animated: true, completion: nil)
    }
    //取消选中cell时触发这个代理
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("indexPath.row = DeselectRow第\(indexPath.row)行")
    }
    //允许编辑cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //右划触发删除按钮
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.init(rawValue: 1)!
    }
    //点击删除cell时触发
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("indexPath.row = editingStyle第\(indexPath.row)行")
    }
}

