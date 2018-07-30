//
//  CQMQPhotoViewController.swift
//  demoSwitf
//
//  Created by zhongchuren on 2018/7/23.
//  Copyright © 2018年 sundusk. All rights reserved.
//

import UIKit

class CQMQPhotoViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "照片"
        
        //        setupUI()
        myCollectionView()
        
    }
    func setupUI(){
        
        
        
    }
    
    func myCollectionView() {
        
        //自定义item的FlowLayout
        
        let flowLayout = UICollectionViewFlowLayout()
        
        //设置item的size
        
        flowLayout.itemSize = CGSize.init(width:100,height:100)
        
        //设置item的四边边距
        
        flowLayout.sectionInset = UIEdgeInsets(top: 10,left: 0, bottom: 10, right: 0)
        
        //列间距
        
        flowLayout.minimumLineSpacing = 10
        
        //行间距
        
        flowLayout.minimumInteritemSpacing = 10
        
        //设置页头尺寸
        
        //flowLayout.headerReferenceSize = CGSize.init(width:,height:)
        
        //设置页尾尺寸
        
        //flowLayout.footerReferenceSize = CGSize.init(width: , height: )
        
        //自定义uicollectionview的位置
        
        
        
        let collectionView = UICollectionView(frame: CGRect.init(x:0, y:64, width: kScreenWidth, height: kScreenHeight - 64),collectionViewLayout:flowLayout)
        
        self.view.addSubview(collectionView)
        
        
        
        
        
        //设置背景颜色
        
        collectionView.backgroundColor = UIColor.blue
        
        
        
        //设置数据源对象
        
        collectionView.dataSource = self as? UICollectionViewDataSource
        
        //设置代理对象
        
        collectionView.delegate = self as? UICollectionViewDelegate
        
        //设置uicollectionView的单元格点击
        
        collectionView.allowsSelection = true
        
        //设置uicollectionView的单元格多选
        
        collectionView.allowsMultipleSelection = false
        
        //开启uicollectionView的分页显示效果
        
        collectionView.isPagingEnabled = true
        
        //注册uicollectionviewcell
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"cell")
        
        
        
        
    }
    
    func numberOfSections(in collectionView:UICollectionView) ->Int {
        
        return 1
        
    }
    
    
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int {
        
        return 3
        
    }
    
    
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    //懒加载一个imageView
    
    lazy var headerImage:UIImageView = {
        
        
        
        let headerImage = UIImageView()
        
        
        
        headerImage.frame = CGRect.init(x:0,y:0,width:kScreenWidth,height:200)
        
        return headerImage
        
        
        
    }()
    
    
    
    func demo(){
        let sexActionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        weak var weakSelf = self
        
        let sexNanAction = UIAlertAction(title: "从相册中选择", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            
            weakSelf?.initPhotoPicker()
            //填写需要的响应方法
            
        }
        
        let sexNvAction = UIAlertAction(title: "拍照", style: UIAlertAction.Style.default){ (action:UIAlertAction)in
            
            
            weakSelf?.initCameraPicker()
            //填写需要的响应方法
            
        }
        
        
        let sexSaceAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel){ (action:UIAlertAction)in
            
            //填写需要的响应方法
            
        }
        
        
        sexActionSheet.addAction(sexNanAction)
        sexActionSheet.addAction(sexNvAction)
        sexActionSheet.addAction(sexSaceAction)
        
        self.present(sexActionSheet, animated: true, completion: nil)
    }
    
    //从相册中选择
    func initPhotoPicker(){
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .photoLibrary
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    
    //拍照
    func initCameraPicker(){
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let  cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = .camera
            //在需要的地方present出来
            self.present(cameraPicker, animated: true, completion: nil)
        } else {
            
            print("不支持拍照")
            
        }
        
    }
    
    
    
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //
    //
    //        //获得照片
    //        let image:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
    //
    //        // 拍照
    //        if picker.sourceType == .camera {
    //            //保存相册
    //            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    //        }
    //
    //        personImage.image = image
    //
    //        self.dismiss(animated: true, completion: nil)
    //    }
    
    
    @objc func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject) {
        
        if error != nil {
            
            print("保存失败")
            
            
        } else {
            
            print("保存成功")
            
            
        }
    }
    
}
