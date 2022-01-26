//
//  InfoModel.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/26.
//

import Foundation

class InfoModel: BaseModel {
    var avatar: String? = ""
    var title: String? = ""
    var detail: String? = ""
    
    init(avatar: String? = "", title: String?, detail: String?) {
        self.avatar = avatar
        self.title = title
        self.detail = detail
    }
}
