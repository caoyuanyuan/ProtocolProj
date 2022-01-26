//
//  TextViewProtocol.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation

class TextViewProtocol: BaseSectionProtocol {
    func cellDisplayViewClass() -> AnyClass? {
        return TextView.self
    }
    
    func cellReuseIdentifier(sectionModel: BaseSectionModel, at indexPath: IndexPath) -> String {
        return sectionModel.templateID ?? ""
    }
    
    func cellHeight(sectionModel: BaseSectionModel, at indexPath: IndexPath) -> Float {
        return 54.0
    }
    
    func rowCount(_ sectionModel: BaseSectionModel) -> Int {
        return sectionModel.rowList?.count ?? 0
    }
    
    func getRowData(sectionModel: BaseSectionModel, at indexPath:IndexPath) -> BaseModel? {
        return sectionModel.rowList?[indexPath.row]
    }
    
    func headerViewClass() -> AnyClass? {
        return TextHeader.self
    }
    
    func headerHeight(sectionModel: BaseSectionModel, in section: Int) -> Float {
        return 60.0
    }
}
