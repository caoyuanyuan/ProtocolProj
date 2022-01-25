//
//  BaseSectionHeader.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation
import UIKit

class BaseSectionHeader: UIView {
    
    private var headerView: BaseView?
    
    init(height: CGFloat, sectionModel: BaseSectionModel) {
        let frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)
        super.init(frame: frame)
        layout(sectionModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(_ sectionModel: BaseSectionModel) {
        if let headerClass = sectionModel.sectionProtocol?.headerViewClass() {
            headerView = (headerClass as! BaseView.Type).init(frame:frame)
        }
        if headerView != nil {
            addSubview(headerView!)
        }
    }
}

extension BaseSectionHeader {
    func bindData(with viewModel: BaseModel) {
        headerView?.bindData(with: viewModel)
    }
}
