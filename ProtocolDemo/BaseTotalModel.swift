//
//  BaseTotalModel.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/24.
//

import Foundation

class BaseTotalModel: BaseModel {
    var sectionList: [BaseSectionModel] = []
    var cacheHeaders: [String: BaseSectionHeader] = [:]
}

extension BaseTotalModel {
    func syncData() {
        let sectionModel = BaseSectionModel()
        sectionModel.templateID = kCellReuseIdText
        var arr: [TextDataModel] = []
        for i in 1 ... 10 {
            let data = TextDataModel()
            data.title = "标题-\(i)"
            data.subTitle = "副标题-\(i)"
            arr.append(data)
        }
        sectionModel.rowList = arr
        sectionModel.headerData = TextHeaderData(title: "头部标题")
        sectionModel.bindSectionProtocol()
        sectionList.append(sectionModel)
    }
}

extension BaseTotalModel {
    
    /// 获取当前indexPath对应的cellId
    /// - Parameter indexPath: 当前indexPath
    /// - Returns: cellId
    func cellReuseIdentifier(with indexPath: IndexPath) -> String {
        let sectionModel = sectionList[indexPath.section]
        if let id = sectionModel.sectionProtocol?.cellReuseIdentifier(sectionModel: sectionModel, indexPath: indexPath) {
            return id
        }
        return ""
    }
    
    /// 获取当前indexPath对应的cell高度
    /// - Parameter indexPath: 当前indexPath
    /// - Returns: cell高度
    func cellHeight(with indexPath: IndexPath) -> Float {
        let sectionModel = sectionList[indexPath.section]
        if let h = sectionModel.sectionProtocol?.cellHeight(sectionModel: sectionModel, indexPath: indexPath) {
            return h
        }
        return 0.0
    }
    
    /// 获取当前section的cell个数
    /// - Parameter section: 当前section
    /// - Returns: cell个数
    func rowCount(with section: Int) -> Int {
        let sectionModel = sectionList[section]
        if let num = sectionModel.sectionProtocol?.rowCount(sectionModel) {
            return num
        }
        return 0
    }
    
    /// 获取当前indexPath对应的model
    /// - Parameter indexPath: 当前indexPath
    /// - Returns: 模型数据
    func getRowData(with indexPath: IndexPath) -> BaseModel? {
        let sectionModel = sectionList[indexPath.section]
        return sectionModel.sectionProtocol?.getRowData(sectionModel: sectionModel, indexPath: indexPath)
    }
    
    func headerHeight(section: Int) -> Float {
        let sectionModel = sectionList[section]
        return sectionModel.sectionProtocol?.headerHeight(sectionModel: sectionModel, section: section) ?? 0.0
    }
    
}
