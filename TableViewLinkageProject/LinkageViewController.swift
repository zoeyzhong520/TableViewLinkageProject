//
//  LinkageViewController.swift
//  TableViewLinkageProject
//
//  Created by zhifu360 on 2019/4/30.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class LinkageViewController: BaseViewController {

    ///数据源
    var dataArray = [[[String: Any]]]()
    
    lazy var linkageView: LinkageView = {
        let linkageView = LinkageView(frame: CGRect(x: 0, y: 0, width: ScreenSize.width, height: ContentHeight))
        return linkageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPage()
        requestApi()
    }
    
    //MARK: - UI
    func setPage() {
        title = "联动"
        view.addSubview(linkageView)
    }

    func requestApi() {
        let dic = Bundle.readDataWith(fileName: "content", fileType: "json")
        let arr = dic["characters"] as! [[[String: Any]]]
        dataArray = arr
        //给LinkageView提供数据
        linkageView.dataArr = dataArray
        print("dataArray = \(dataArray)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
