//
//  Bundle+Extension.swift
//  TableViewLinkageProject
//
//  Created by zhifu360 on 2019/4/30.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

extension Bundle {
    
    ///读取本地文件数据
    ///fileName：文件名称
    ///fileType：文件类型
    class func readDataWith(fileName: String, fileType: String) -> [String: Any] {
        let filePath = Bundle.main.path(forResource: fileName, ofType: fileType)
        do {
            let fileData = try Data(contentsOf: URL(fileURLWithPath: filePath!))
            let dict = try JSONSerialization.jsonObject(with: fileData, options: .mutableContainers)
            print("解析结果 = \(dict)")
            return dict as! [String : Any]
        } catch {
            print("Error = \(error.localizedDescription)")
        }
        
        return [String: Any]()
    }
    
}
