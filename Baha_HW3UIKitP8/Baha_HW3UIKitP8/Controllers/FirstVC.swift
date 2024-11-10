//
//  FirstVC.swift
//  Baha_HW3UIKitP8
//
//  Created by Baha Sadyr on 7/22/24.
//

import UIKit

protocol FirstVCDelegate {
    func setDataFromNameSurname(name: String, surname: String, description: String)
}

class FirstVC : UIViewController, FirstVCDelegate {
    
    lazy var carduiview = CardUIView(frame: CGRect(x: 30, y: 101, width: self.view.frame.width - 60, height: 110))
    lazy var uiimageview = FirstVCImageView(frame: CGRect(x: 17, y: 18, width: 75, height: 75))
    lazy var firstvcuilabel = FirstVCUILabel(frame: CGRect(x: uiimageview.frame.maxX + 12, y: 29, width: 150, height: 19), text: "Anna Petrova", weight: .bold)
    lazy var firstvceditbutton = FirstVCUIButton(frame: CGRect(x: uiimageview.frame.maxX + 12, y: firstvcuilabel.frame.maxY + 7, width: 147, height: 30), title: "Редактировать", radius: 10)
    lazy var firstVCArrowBtn = FirstVCArrowRightBtn(frame: CGRect(x: carduiview.frame.width - 27, y: 47, width: 17, height: 17))
    var desc : String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        title = "Главная"
        carduiview.addSubview(uiimageview)
        carduiview.addSubview(firstvcuilabel)
        carduiview.addSubview(firstvceditbutton)
        carduiview.addSubview(firstVCArrowBtn)
        view.addSubview(carduiview)
        setEditBtn()
        setAboutArrowBtn()
        
        
        
    }
    
    private func setEditBtn() {
        firstvceditbutton.addAction(editBtnAction, for: .touchUpInside)
    }
    
    lazy var editBtnAction: UIAction = UIAction  { _ in
        let secondVC = SecondVC()
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    private func setAboutArrowBtn() {
        
        firstVCArrowBtn.addAction(FirstVCArrowBtnAction, for: .touchUpInside)
    }
    
    lazy var FirstVCArrowBtnAction: UIAction = UIAction { _ in
        let thirdVC = ThirdVC()
        if let desc = self.desc {
            thirdVC.textForTextView = desc
        }
        self.navigationController?.pushViewController(thirdVC, animated: true)
        
    }
    
    func setDataFromNameSurname(name: String, surname: String, description: String){
        self.firstvcuilabel.text = name + " " + surname
        self.desc = description
        
    }
    
}
