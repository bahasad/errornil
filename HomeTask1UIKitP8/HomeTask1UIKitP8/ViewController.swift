
//  ViewController.swift
//  HomeTask1UIKit
//
//  Created by Baha Sadyr on 7/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabelNameLeft = UILabel()
    var myLabelNameRight = UILabel()
    var myLabelSurnameLeft = UILabel()
    var myLabelSurnameRight = UILabel()
    var myLabelPotokLeft = UILabel()
    var myLabelPotokRight = UILabel()
    var buttonAddData = UIButton()
    var buttonRemoveData = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpLabel()
        setUpButton()
    }
    private func setUpLabel() {
        myLabelNameLeft.text = "Name:"
        myLabelNameLeft.font = UIFont.systemFont(ofSize: 20)
        myLabelNameLeft.textColor = .black
        myLabelNameLeft.frame = CGRect(x: 50, y: 100, width: 70, height: 30)
        myLabelNameRight.text = "Baha"
        myLabelNameRight.font = UIFont.systemFont(ofSize: 20)
        myLabelNameRight.textColor = .red
        myLabelNameRight.frame = CGRect(x: myLabelNameLeft.frame.maxX + 5, y: 100, width: 50, height: 30)
        view.addSubview(myLabelNameLeft)
        view.addSubview(myLabelNameRight)
        myLabelSurnameLeft.text = "Surname:"
        myLabelSurnameLeft.font = UIFont.systemFont(ofSize: 20)
        myLabelSurnameLeft.textColor = .black
        myLabelSurnameLeft.frame = CGRect(x: 50, y: myLabelNameLeft.frame.maxY, width: 100, height: 30)
        myLabelSurnameRight.text = "Sadyr"
        myLabelSurnameRight.font = UIFont.systemFont(ofSize: 20)
        myLabelSurnameRight.textColor = .red
        myLabelSurnameRight.frame = CGRect(x: Int(myLabelSurnameLeft.frame.maxX) , y: Int(myLabelNameLeft.frame.maxY), width: 100, height: 30)
        view.addSubview(myLabelSurnameLeft)
        view.addSubview(myLabelSurnameRight)
        myLabelPotokLeft.text = "Number of batch:"
        myLabelPotokLeft.font = UIFont.systemFont(ofSize: 20)
        myLabelPotokLeft.textColor = .black
        myLabelPotokLeft.frame = CGRect(x: 50, y: myLabelSurnameLeft.frame.maxY, width: 170, height: 30)
        myLabelPotokRight.text = "IOS 6"
        myLabelPotokRight.font = UIFont.systemFont(ofSize: 20)
        myLabelPotokRight.textColor = .red
        myLabelPotokRight.frame = CGRect(x: Int(myLabelPotokLeft.frame.maxX), y: Int(myLabelSurnameLeft.frame.maxY), width: 100, height: 30)
        view.addSubview(myLabelPotokLeft)
        view.addSubview(myLabelPotokRight)
    }
    private func setUpButton() {
        buttonAddData.setTitle("Add data", for: .normal)
        buttonAddData.layer.cornerRadius = 20
        buttonAddData.setTitleColor(.white, for: .normal)
        buttonAddData.backgroundColor = UIColor.black
        buttonRemoveData.setTitle("Remove data", for: .normal)
        buttonRemoveData.setTitleColor(.blue, for: .normal)
        buttonAddData.frame = CGRect(x: 20, y: view.frame.width + 250, width: 350, height: 50)
        buttonRemoveData.frame = CGRect(x: 20, y: buttonAddData.frame.maxY, width: 350, height: 50)
        view.addSubview(buttonAddData)
        view.addSubview(buttonRemoveData)
        
    }
    


}

