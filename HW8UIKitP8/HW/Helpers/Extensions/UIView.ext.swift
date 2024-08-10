//
//  UIView.ext.swift
//  HW
//
//  Created by Baha Sadyr on 8/9/24.
//

import UIKit

extension UIView {
    func addSubviews(view: UIView...){
        view.forEach {
            addSubview($0)
        }
    }
}
