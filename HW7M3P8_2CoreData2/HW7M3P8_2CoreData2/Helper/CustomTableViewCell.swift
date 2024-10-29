//
//  CustomTableViewCell.swift
//  HW7M3P8_2CoreData2
//
//  Created by Baha Sadyr on 10/28/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static var reuseId = "CustomTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: CustomTableViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

