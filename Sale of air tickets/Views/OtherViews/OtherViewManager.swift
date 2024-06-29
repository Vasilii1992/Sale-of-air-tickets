//
//  OtherViewManager.swift
//  Sale of air tickets
//
//  Created by Василий Тихонов on 29.06.2024.
//

import UIKit

class OtherViewManager {
    
    var controller: UIViewController
    var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    
    
    func createStubView(title: String) -> UIView {
        
        lazy var stubView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(hex: "#3E3F43FF")
            view.layer.cornerRadius = 25
            
            let label = UILabel()
            label.textColor = .white
            label.text = title
            label.numberOfLines = 0
            label.font = UIFont(name: "Rockwell", size: 22)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            
            
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
            
            return view
            
        }()
        return stubView

    }
    
    
    
}
