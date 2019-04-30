//
//  Macro.swift
//  CustomNavigationBarAlphaProject
//
//  Created by zhifu360 on 2019/4/28.
//  Copyright © 2019 ZZJ. All rights reserved.
//

import UIKit

///导航栏高度
let NavigationBarHeight: CGFloat = 44

///状态栏高度
let StatusBarHeight = UIApplication.shared.statusBarFrame.size.height

///屏幕尺寸
let ScreenSize = UIScreen.main.bounds

///减去状态栏、导航栏的高度
let ContentHeight = ScreenSize.height - StatusBarHeight - NavigationBarHeight

///系统版本号
let SystemVersion = (UIDevice.current.systemVersion as NSString).doubleValue

///获取项目名称
let AppName = Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String

///是否iOS11及以上的系统版本
let IsSystemVersion11 = SystemVersion >= 11.0

///UITableView的基础reuseIdentifier
let BaseTableReuseIdentifier = "BaseTableReuseIdentifier"

///随机颜色
let RandomColor = UIColor(red: CGFloat(arc4random()%256) / 255.0, green: CGFloat(arc4random()%256) / 255.0, blue: CGFloat(arc4random()%256) / 255.0, alpha: 1.0)

///RGB颜色
let RGBColor: (CGFloat,CGFloat,CGFloat) -> UIColor = { r,g,b in
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}

