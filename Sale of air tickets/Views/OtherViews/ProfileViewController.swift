//
//  ProfileViewController.swift
//  Sale of air tickets
//
//  Created by Василий Тихонов on 24.06.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var viewManager: OtherViewManager = {
        return OtherViewManager(controller: self)
    }()
    
    lazy var stubView = viewManager.createStubView(title: "Профиль")
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#0C0C0CFF")
        setupViews()
        setupConstrains()
    }
    

    
    func setupConstrains() {
        
        NSLayoutConstraint.activate([
            stubView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stubView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stubView.heightAnchor.constraint(equalToConstant: 160),
            stubView.widthAnchor.constraint(equalToConstant: 320)
        ])
    }
    func setupViews() {
        view.addSubview(stubView)
    }
    
}
