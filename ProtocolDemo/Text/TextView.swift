//
//  TextView.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import Foundation
import UIKit

class TextView: BaseView {
    private var data: TextDataModel!
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleL)
        addSubview(subTitleL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bindData(with viewModel: BaseModel) {
        data = viewModel as? TextDataModel
        setupView()
    }
    
    lazy var titleL: UILabel = {
        let l = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 20))
        l.textColor = .black
        l.font = .systemFont(ofSize: 14)
        return l
    }()
    
    lazy var subTitleL: UILabel = {
        let l = UILabel(frame: CGRect(x: 10, y: 20, width: 100, height: 20))
        l.textColor = .red
        l.font = .systemFont(ofSize: 14)
        return l
    }()
}

extension TextView {
    private func setupView() {
        titleL.text = data.title
        subTitleL.text = data.subTitle
    }
}
