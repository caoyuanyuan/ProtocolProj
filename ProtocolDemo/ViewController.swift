//
//  ViewController.swift
//  ProtocolDemo
//
//  Created by 曹园园 on 2022/1/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        view.addSubview(tableView)
    }

    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    lazy var totalModel: BaseTotalModel = BaseTotalModel()
}

//MARK: - 数据请求
extension ViewController {
    func loadData() {
        totalModel.syncData()
    }
}

//MARK: - tableview delegate & datasource
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return totalModel.sectionList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalModel.rowCount(with: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(totalModel.cellHeight(with: indexPath))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = totalModel.sectionList[indexPath.section]
        let reuseId = totalModel.cellReuseIdentifier(with: indexPath)
        let cellH = totalModel.cellHeight(with: indexPath)
        
        var cell: BaseTableViewCell
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: reuseId) as? BaseTableViewCell {
            cell = dequeueCell
            cell.reloadCellHeight(CGFloat(cellH))
        } else {
            cell = BaseTableViewCell.init(style: .default, reuseIdentifier: reuseId, cellHeight: CGFloat(cellH), sectionModel: sectionModel)
        }
        let rowData = totalModel.getRowData(with: indexPath)
        if let data = rowData {
            cell.bindData(with: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(totalModel.headerHeight(section: section))
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = totalModel.sectionList[section]
        guard ((sectionModel.sectionProtocol?.headerViewClass()) != nil) else { return UIView() }
        var baseHeader: BaseSectionHeader!
        if let reuseId = sectionModel.templateID, totalModel.cacheHeaders.keys.contains(reuseId) {
            baseHeader = totalModel.cacheHeaders[reuseId + "_\(section)"]
        } else {
            baseHeader = BaseSectionHeader.init(height: CGFloat(totalModel.headerHeight(section: section)), sectionModel: sectionModel)
            baseHeader.bindData(with: sectionModel.headerData!)
            totalModel.cacheHeaders[sectionModel.templateID! + "_\(section)"] = baseHeader
        }
        return baseHeader
    }
}



