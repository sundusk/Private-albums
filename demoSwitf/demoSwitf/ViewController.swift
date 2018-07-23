//
//  ViewController.swift
//  demoSwitf
//
//  Created by zhongchuren on 2018/7/20.
//  Copyright © 2018年 sundusk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let cellID = "cellID"
    var tableView = UITableView()
    var arrcount = Array<String>()
    var name = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "相册"
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.top.bottom.equalTo(self.view)
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        let bottomnib = UINib(nibName: "CQMQPhotoTableViewCell", bundle: nil)
        self.tableView.register(bottomnib, forCellReuseIdentifier: cellID)
        
        self.tableView.separatorStyle = .none
        // 右边按钮
        let item1 = UIBarButtonItem(title: "添加相册", style: .plain, target: self, action: #selector(clickPhoto))
        self.navigationItem.rightBarButtonItem = item1
        
        
        
        
    }
    
    
    //Section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrcount.count
    }
    
    //cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        var cell = CQMQPhotoTableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CQMQPhotoTableViewCell
        
        cell.imageLabel.text = arrcount[indexPath.row]
        
        return cell
        
    }
    
    // MARK:- UITableViewDelegate代理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = CQMQPhotoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    

    
    
    @objc func clickPhoto(){
        print("创建相册")
        let alertController = UIAlertController(title: "新建相册",
                                                message: "请问此相册输入名称", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            print(self.name)
            self.arrcount.append(self.name)
            self.tableView.reloadData()
            
        })
        alertController.addTextField { (textField) in
            textField.placeholder = "输入相册名称"
            textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    /// 监听输入
    @objc private func textFieldDidChange(_ textField: UITextField) {
       print("监听输入")
        self.name = textField.text!
    }
   
    
   
}

