//
//  BaseSectionProtocol.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/24.
//

import Foundation

protocol BaseSectionProtocol {
    //MARK: - cell
    /// cell上展示的view类名-单一样式
    /// - Returns: 类
    func cellDisplayViewClass() -> AnyClass?
    
    /// cell上展示的view类名-多样式
    /// - Returns: key:reuseId,value:类
    func cellDisplayViewClassDict() -> [String: AnyClass?]
    
    /// 获取cell 唯一标识
    /// - Returns: id
    func cellReuseIdentifier(sectionModel: BaseSectionModel, at indexPath:IndexPath) -> String
    
    /// cell 行高
    /// - Returns: 行高
    func cellHeight(sectionModel: BaseSectionModel, at indexPath:IndexPath) -> Float
    
    /// row个数
    /// - Returns: 个数
    func rowCount(_ sectionModel: BaseSectionModel) -> Int
    
    /// 获取index对应数据
    /// - Returns: model
    func getRowData(sectionModel: BaseSectionModel, at indexPath:IndexPath) -> BaseModel?
    
    //MARK: - header
    /// header对应类名
    /// - Returns: 类名对应字符串
    func headerViewClass() -> AnyClass?
    
    /// header高度
    /// - Returns: h
    func headerHeight(sectionModel: BaseSectionModel, in section: Int) -> Float
}

extension BaseSectionProtocol {
    func cellDisplayViewClass() -> AnyClass? {
        return nil
    }

    func cellDisplayViewClassDict() -> [String : AnyClass?] {
        return ["" : nil]
    }

    func getRowData(sectionModel: BaseSectionModel, at indexPath: IndexPath) -> BaseModel? {
        return sectionModel
    }

    func headerViewClass() -> AnyClass? {
        return nil
    }

    func headerHeight(sectionModel: BaseSectionModel, in section: Int) -> Float {
        return 0.0
    }
}
