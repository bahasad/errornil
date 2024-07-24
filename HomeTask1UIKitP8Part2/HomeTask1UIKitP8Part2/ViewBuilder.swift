//
//  ViewBuilder.swift
//  HomeTask1UIKitP8Part2
//
//  Created by Baha Sadyr on 7/16/24.
//

//import Foundation
//import UIKit
//
//class ViewBuilder {
//    
//    static let shared = ViewBuilder()
//    
//    var viewSubscr: UIView = {
//        var viewSubscr = UIView()
//        return viewSubscr
//    }()
//    
//    var subscrLabel = UILabel()
//    var numberSubscrLevel = UILabel()
//        
//    
//    
//    
//    
//    var subscrStack: UIStackView = {
//        var subscrStack = UIStackView()
//        subscrStack.axis = .vertical
//        subscrStack.alignment = .fill
//        subscrStack.distribution = .fillEqually
//        return subscrStack
//    }()
//    
//    var fullStack: UIStackView = {
//        var fullStack = UIStackView()
//        fullStack.axis = .horizontal
//        fullStack.distribution = .fillEqually
//        fullStack.alignment = .fill
//        fullStack.spacing = 20
//        return fullStack
//    }()
//    
//    init() {
//        
//    }
//    
//    private func setSubcrLabel(text: String) -> UILabel {
//        subscrLabel.text = text
//        subscrLabel.textColor = .black
//        subscrLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        subscrLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
//        return subscrLabel
//    }
//    
//    private func setNumberSubscrLevel(text: String) -> UILabel {
//        numberSubscrLevel.text = text
//        numberSubscrLevel.textColor = .black
//        numberSubscrLevel.font = UIFont.systemFont(ofSize: 20)
//        numberSubscrLevel.setContentHuggingPriority(.defaultLow, for: .vertical)
//        return numberSubscrLevel
//    }
//    
//    func setUpStacks() {
//        
//        let subscrArr = ["Подписок", "Подпичиков", "Постов"]
//        let subscrNumberArr = ["99", "120", "300"]
//        
//        for i in 0..<3 {
//            let label = setSubcrLabel(text: subscrArr[i])
//            let numberLabel = setNumberSubscrLevel(text: subscrNumberArr[i])
//            
//            let subscrStack = UIStackView(arrangedSubviews: [label, numberLabel])
//            subscrStack.axis = .vertical
//            subscrStack.alignment = .fill
//            subscrStack.distribution = .fillEqually
//            
//            let containerView = UIView()
//            containerView.addSubview(subscrStack)
//            
//            subscrStack.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                subscrStack.topAnchor.constraint(equalTo: containerView.topAnchor),
//                subscrStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//                subscrStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                subscrStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
//            ])
//            fullStack.addArrangedSubview(containerView)
//        }
//    }
//}

import Foundation
import UIKit

class ViewBuilder {
    
    static let shared = ViewBuilder()

    let subscrArr = ["Подписок\n99", "Подпичиков\n120", "Постов\n300"]
    var sstack = UIStackView()
    

    func setLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    

    
    
    func setUpLabelsToSstack() {
        let label99 = self.setLabel(text: subscrArr[0] )
        let label120 = self.setLabel(text: subscrArr[1])
        let label300 = self.setLabel(text: subscrArr[2])
        
        sstack = UIStackView(arrangedSubviews:[label99, label120, label300])
        sstack.axis = .horizontal
        sstack.distribution = .fillEqually
        sstack.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    
    var subscriberStack: UIStackView = {
        var subscrStack = UIStackView()
        subscrStack.axis = .vertical
        subscrStack.alignment = .fill
        subscrStack.distribution = .fillEqually
        return subscrStack
    }()
    var postStack: UIStackView = {
        var subscrStack = UIStackView()
        subscrStack.axis = .vertical
        subscrStack.alignment = .fill
        subscrStack.distribution = .fillEqually
        return subscrStack
    }()
    
    var fullStack: UIStackView = {
        var fullStack = UIStackView()
        fullStack.axis = .horizontal
        fullStack.distribution = .fillEqually
        fullStack.alignment = .fill
        fullStack.spacing = 20
        return fullStack
    }()
    
    init() {
        
    }
    
    
       
        
      
}

