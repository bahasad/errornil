//
//  MainViewController.swift
//  DraftWithoutStoryboardAndWithSetUpScene
//
//  Created by Baha Sadyr on 7/28/24.
//

import UIKit


struct UserData {
    var image: UIImage?
    let name: String
    
    static func mockData() -> [UserData] {
        [
            UserData(image: UIImage(systemName: "person"), name: "John Doe"),
            UserData(image: UIImage(systemName: "person.circle"), name: "Elon Mask"),
            UserData(image: UIImage(systemName: "person.fill"), name: "Brad Pitt")
        ]
    }
}


final class MainViewController: UIViewController {
    
    private let tableData: [UserData] = UserData.mockData()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.backgroundColor = .red
        
       
       
    }
    

   

}


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = tableData[indexPath.row].name
        config.image = tableData[indexPath.row].image
        config.secondaryText = "30 сообщений"
        
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVC()
        vc.userData = tableData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
