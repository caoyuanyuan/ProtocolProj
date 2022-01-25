//
//  CellTemplate.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation

typealias kCellReuseType = String

let kCellReuseIdText: kCellReuseType = "text"


/// cell模板
/// 新的模板 需要在此添加新模板协议名
let cellClassDict: [kCellReuseType: AnyClass] = [kCellReuseIdText: TextViewProtocol.self]
