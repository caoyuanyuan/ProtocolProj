//
//  TextHeaderData.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation

class TextHeaderData: BaseModel {
    var title: String? = ""
    
    init(title: String?) {
        self.title = title
    }
}
