//
//  UIView.ext.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/22/24.
//

import UIKit

extension UIView {
    
    func addSubviews(view: UIView...) {
        view.forEach{
            self.addSubview($0)
        }
    }
}
