//
//  BaseTableViewCell.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/21.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    
    private var displayView: BaseView?
    
    init(style: UITableViewCell.CellStyle?, reuseIdentifier: String?, cellHeight: CGFloat, sectionModel: BaseSectionModel) {
        super.init(style: style ?? .default, reuseIdentifier: reuseIdentifier)
        layout(reuseId: reuseIdentifier, cellHeight: cellHeight, sectionModel: sectionModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(reuseId: String?, cellHeight: CGFloat, sectionModel: BaseSectionModel) {
        let frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: cellHeight)
        guard let reuseIdentifier = reuseId else { return }
        
        if let cls = sectionModel.sectionProtocol?.cellDisplayViewClass() {
            let viewClass = cls as! BaseView.Type
            displayView = viewClass.init(frame: frame)
        } else if let clsDict = sectionModel.sectionProtocol?.cellDisplayViewClassDict(), clsDict.keys.contains(reuseIdentifier) {
            let viewClass = clsDict[reuseIdentifier] as! BaseView.Type
            displayView = viewClass.init(frame: frame)
        }
        
        if displayView != nil {
            contentView.addSubview(displayView!)
        }
    }
}

extension BaseTableViewCell {
    /**
     刷新cell内displayView的高度
     */
    func reloadCellHeight(_ height: CGFloat) {
        let oldFrame: CGRect! = displayView?.frame ?? .zero
        displayView?.frame = CGRect(origin: oldFrame.origin, size: CGSize(width: oldFrame.size.width, height: height))
    }

    /**
     cell 绑定数据
     */
    func bindData(with viewModel: BaseModel) {
        displayView?.bindData(with: viewModel)
    }
    
}
