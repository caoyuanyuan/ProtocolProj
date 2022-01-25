//
//  BaseView.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/21.
//

import Foundation
import UIKit

protocol BaseViewProtocol {
    /// 绑定数据
    func bindData(with viewModel: BaseModel)
}

class BaseView: UIView, BaseViewProtocol {
    
    /// 交给子类重写
    func bindData(with viewModel: BaseModel) {
        
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
