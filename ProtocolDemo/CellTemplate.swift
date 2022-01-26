//
//  CellTemplate.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation

typealias kCellReuseType = String


let kCellReuseIdText: kCellReuseType = "text"
let kCellReuseIdInfo: kCellReuseType = "info"


/// cell模板
/// 新的模板 需要在此添加新模板协议名
let cellClassDict: [kCellReuseType: AnyClass] = {
    return [
                kCellReuseIdText: TextViewProtocol.self,
                kCellReuseIdInfo: InfoViewProtocol.self,
            ]
}()
