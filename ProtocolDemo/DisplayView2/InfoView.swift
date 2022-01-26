//
//  InfoView.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/26.
//

import Foundation
import UIKit

class InfoView: BaseView {
    private var data: InfoModel!
    
    required init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(avatarImgv)
        addSubview(titleL)
        addSubview(detailL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bindData(with viewModel: BaseModel) {
        data = viewModel as? InfoModel
        setupView()
    }
    
    lazy var avatarImgv: UIImageView = {
        let avatarImgv = UIImageView(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        avatarImgv.centerY = centerY
        avatarImgv.backgroundColor = .red
        return avatarImgv
    }()
    
    lazy var titleL: UILabel = {
        let l = UILabel(frame: CGRect(x: avatarImgv.right + 10, y: avatarImgv.top, width: 200, height: 20))
        l.textColor = .black
        l.font = .systemFont(ofSize: 14)
        return l
    }()
    
    lazy var detailL: UILabel = {
        let l = UILabel(frame: CGRect(x: titleL.left, y: titleL.bottom, width: 200, height: 20))
        l.textColor = .red
        l.font = .systemFont(ofSize: 14)
        return l
    }()
}

extension InfoView {
    private func setupView() {
        titleL.text = data.title
        detailL.text = data.detail
    }
}
