//
//  LinkageView.swift
//  TableViewLinkageProject
//
//  Created by zhifu360 on 2019/4/30.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

class LinkageView: UIView {

    ///数据源
    var dataArr: [[[String: Any]]]? {
        didSet {
            leftTableView.reloadData()
            rightTableView.reloadData()
        }
    }
    
    ///LeftCellID
    let LeftCellID = "LeftCellID"
    
    ///RightCellID
    let RightCellID = "RightCellID"
    
    ///滑动方向
    var isScrollDown = false
    ///上次滑动的偏移量
    var lastOffsetY: CGFloat = 0
    
    ///左边的TableView
    lazy var leftTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 70, height: self.bounds.size.height), style: .plain)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: LeftCellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = RandomColor
        tableView.rowHeight = 50
        return tableView
    }()
    
    ///右边的TableView
    lazy var rightTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: self.leftTableView.frame.maxX, y: 0, width: ScreenSize.width - self.leftTableView.frame.width, height: self.bounds.size.height), style: .plain)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: RightCellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 25
        tableView.rowHeight = 50
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
    
    ///右边的tableView关联左边的tableView
    func selectRow(index: Int) {
        let targetIndexPath = IndexPath(row: index, section: 0)
        leftTableView.selectRow(at: targetIndexPath, animated: true, scrollPosition: .top)
    }
}

extension LinkageView: UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == leftTableView {
            return 1
        } else {
            return dataArr?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return dataArr?.count ?? 0
        } else {
            let tmpArr = dataArr?[section]
            return tmpArr?.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: LeftCellID, for: indexPath)
            cell.backgroundColor = .clear
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = "\(indexPath.row+1)"
            cell.textLabel?.textColor = .white
            cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RightCellID, for: indexPath)
            let tmpDic = dataArr?[indexPath.section][indexPath.row]
            let title = tmpDic?["character"] as? String
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = title
            cell.textLabel?.textColor = .black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 24)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == leftTableView {
            return nil
        }
        
        return "\(section+1)"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //将左边的tableView关联至右边的tableView
        //点击左边的tableView的row时，跳转至右边tableView对应的分区头部
        if tableView == leftTableView {
            let targetIndexPath = IndexPath(row: 0, section: indexPath.row)
            print("targetIndexPath = \(targetIndexPath)")
            rightTableView.scrollToRow(at: targetIndexPath, at: .top, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //将右边的tableView关联至左边的tableView
        //校验三要素：用户手指触发滑动、向上滑动、触发区域在右边的tableView
        if tableView == rightTableView && tableView.isDragging && !isScrollDown {
            selectRow(index: section)
        }
    }

    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        //将右边的tableView关联至左边的tableView
        //校验三要素：用户手指触发滑动、向下滑动、触发区域在右边的tableView
        if tableView == rightTableView && tableView.isDragging && isScrollDown {
            selectRow(index: section+1)
        }
    }
    
    ///UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == rightTableView {
            isScrollDown = lastOffsetY < scrollView.contentOffset.y
            lastOffsetY = scrollView.contentOffset.y
        }
    }
    
}
