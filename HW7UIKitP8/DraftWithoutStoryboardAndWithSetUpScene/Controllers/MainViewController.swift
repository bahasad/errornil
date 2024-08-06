//
//  MainViewController.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/28/24.
//

import UIKit

struct UserData {
    var mainImage: String
    var imgInImage: String
    let name: String
    let header: String
    let texttLabel: String
    
    static func mockData() -> [UserData] {
        [
            UserData(mainImage: "eagle" , imgInImage: "flowers" , name: "John Doe", header: "Заголовок", texttLabel: "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod\n tempor incididunt ut labore"),
            UserData(mainImage: "wall", imgInImage: "rain", name: "Robert Wilson", header: "Заголовок 2", texttLabel: "Lorem ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod\n tempor incididunt ut labore in reprehenderit\n in voluptate velit esse cillum dolore eu\n fugiat nulla pariatur. Excepteur Lorem\n ipsum dolor sit amet, consectetur\n adipisicing elit, sed do eiusmod tempor\n incididunt ut labore et dolore magna aliqua. " )
        ]
    }
}


final class MainViewController: UIViewController {
    
    var tableData = UserData.mockData()
    
    lazy var tableView: UITableView = {
        
        $0.dataSource = self
        $0.register(DetailCell.self, forCellReuseIdentifier: DetailCell.reuseId)
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubviews(view: tableView)
    }
    

   

}
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseId, for: indexPath) as! DetailCell
        cell.selectionStyle = .none
        cell.setupData(item: item)
        return cell
    }
}
