//
//  Macro.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation
import UIKit

//获取沙盒Document路径
let kDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
//获取沙盒Cache路径
let kCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
//获取沙盒temp路径
let kTempPath = NSTemporaryDirectory()

//获取屏幕大小
let kScreenSize = UIScreen.main.responds(to: #selector(getter: UIScreen.nativeBounds)) ? CGSize(width: UIScreen.main.nativeBounds.size.width / UIScreen.main.nativeScale, height: UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale) : UIScreen.main.bounds.size
let kScreenWidth = kScreenSize.width
let kScreenHeight = kScreenSize.height
let kScreenBounds = UIScreen.main.bounds

//APP版本号
let kAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
//当前系统版本号
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue

//获取当前语言
let kAppCurrentLanguage = Locale.preferredLanguages[0]

//判断 iPhone 的屏幕尺寸
let kSCREEN_MAX_LENGTH = max(kScreenWidth, kScreenHeight)
let kSCREEN_MIN_LENGTH = min(kScreenWidth, kScreenHeight)

//适配 350 375 414       568 667 736
func kAutoLayoutWidth(_ width: CGFloat) -> CGFloat {
    return width*kScreenWidth / 375
}
func kAutoLayoutHeigth(_ height: CGFloat) -> CGFloat {
    return height*kScreenHeight / 667
}

//机型判断
let kUI_IPHONE = (UIDevice.current.userInterfaceIdiom == .phone)
let kUI_IPHONE5 = (kUI_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
let kUI_IPHONE6 = (kUI_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
let kUI_IPHONEPLUS = (kUI_IPHONE && kSCREEN_MAX_LENGTH == 736.0)
let kUI_IPHONEX = (kUI_IPHONE && kSCREEN_MAX_LENGTH > 780.0)

//获取状态栏、标题栏、导航栏高度
let kUIStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
let kUINavigationBarHeight: CGFloat =  kUI_IPHONEX ? 88 : 44
let KUITabBarHeight: CGFloat = kUI_IPHONEX ? 83 : 49
