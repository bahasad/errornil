//
//  ViewController.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    var tableData = UserData.mockData()
    
    private lazy var tableView: UITableView = {
        
        $0.dataSource = self
        $0.register(TableCell.self, forCellReuseIdentifier: TableCell.reuseId)
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        view.addSubview(tableView)
        

        
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.reuseId, for: indexPath) as! TableCell
        cell.selectionStyle = .none
        cell.setupData(item: item)
        return cell
        
    }
    
    
}

