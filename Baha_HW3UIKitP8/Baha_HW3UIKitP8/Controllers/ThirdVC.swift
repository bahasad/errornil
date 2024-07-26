//
//  ThirdVC.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/22/24.
//

import UIKit

class ThirdVC: UIViewController {
    
    var text: String = ""
    
    var textForTextView = """
   Lorem ipsum dolor sit amet consectetur
   adipisicing elit. Laboriosam vitae distinctio
   nulla dignissimos eligendi iste excepturi
   optio repellendus dolorum deleniti incidunt
   voluptatem, rem voluptatibus ullam vero
   eos reprehenderit eveniet dolore.
 """
    
    
    
    lazy var girlUIImageView = FirstVCImageView(frame: CGRect(x: 158, y: 95, width: 75, height: 75))
    
    lazy var headerLabel = FirstVCUILabel(frame: CGRect(x: 145, y: girlUIImageView.frame.maxY + 23, width: 111, height: 19), text: text, weight: .bold)
    
    lazy var aboutLabel = FirstVCUILabel(frame: CGRect(x: 42, y: headerLabel.frame.maxY + 33, width: 55, height: 19), text: "О себе", weight: .light, textColor: UIColor(hex: "#A7A7A7")!)
    
    lazy var aboutTextView = SeconVCTextView(frame: CGRect(x: 30, y: aboutLabel.frame.maxY + 9, width: view.frame.size.width - 60 , height: 158), text: textForTextView, textContainer: nil)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = text
        view.backgroundColor = .white
        view.addSubviews(view: girlUIImageView, headerLabel, aboutLabel, aboutTextView)
        
      
    }
    

    

}
