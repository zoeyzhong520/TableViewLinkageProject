//
//  LinkageView.swift
//  TableViewLinkageProject
//
//  Created by zhifu360 on 2019/4/30.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class LinkageView: UIView {

    ///LeftCellID
    let LeftCellID = "LeftCellID"
    
    ///RightCellID
    let RightCellID = "RightCellID"
    
    ///左边的TableView
    lazy var leftTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: self.bounds.size.height), style: .plain)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: LeftCellID)
//        tableView.delegate = self
//        tableView.dataSource = self
        return tableView
    }()
    
    ///右边的TableView
    lazy var rightTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: self.bounds.size.height), style: .plain)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: RightCellID)
//        tableView.delegate = self
//        tableView.dataSource = self
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Function
    func addViews() {
        addSubview(leftTableView)
        addSubview(rightTableView)
    }
}

//extension LinkageView: UITableViewDelegate,UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
//
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//
//    }
//
//    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
//
//    }
//    
//}
