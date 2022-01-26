//
//  TextHeader.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/25.
//

import UIKit

class TextHeader: BaseView {
    private var data: TextHeaderData!
    
    lazy var titleL: UILabel = {
        let l = UILabel(frame: frame)
        l.textColor = .blue
        l.font = .systemFont(ofSize: 20)
        l.textAlignment = .center
        return l
    }()
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addSubview(titleL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bindData(with viewModel: BaseModel) {
        data = viewModel as? TextHeaderData
        setup()
    }
}

extension TextHeader {
    private func setup() {
        titleL.text = data.title
    }
}
