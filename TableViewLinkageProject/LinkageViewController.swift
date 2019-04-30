//
//  LinkageViewController.swift
//  TableViewLinkageProject
//
//  Created by zhifu360 on 2019/4/30.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class LinkageViewController: BaseViewController {

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
        Bundle.readDataWith(fileName: "content", fileType: "json")
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
