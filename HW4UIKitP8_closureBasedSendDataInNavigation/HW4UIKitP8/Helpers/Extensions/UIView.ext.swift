//
//  UIView.swift
//  HW4UIKitP8
//
//  Created by Baha Sadyr on 7/26/24.
//

import UIKit

extension UIView {
    func addSubviews(view: UIView...){
        view.forEach {
            addSubview($0)
        }
    }
}
