//
//  BaseSectionModel.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/24.
//

import Foundation

class BaseSectionModel: BaseModel {
    var sectionProtocol: BaseSectionProtocol?
    var templateID: String?
    
    var rowList: [BaseModel]?
    
    var tabList: [BaseModel]?
    
    var headerData: BaseModel?
}

extension BaseSectionModel {
    func bindSectionProtocol() {
        if templateID != nil {
            let cls: AnyClass! = cellClassDict[templateID!]
            sectionProtocol = class_createInstance(cls, 0) as? BaseSectionProtocol
        }
    }
}
