//
//  AllTicketsView + Extensions.swift
//  Sale of air tickets
//
//  Created by Василий Тихонов on 27.06.2024.
//

import UIKit

class AllTicketsViewController: UIViewController {
    
    private lazy var viewManager: AllTicketsViewManager = {
        return AllTicketsViewManager(controller: self)
    }()
    
    var tickets: [Ticket] = []

     lazy var collectionView = viewManager.createCollectionView()
     lazy var searchView = viewManager.createSearchView()
     lazy var searchStack = viewManager.createSearchStack(fromToLabel: fromToLabel, infoLabel: infoLabel, tapGesture: UITapGestureRecognizer(target: self, action: #selector(backwardIconTapped)))
     lazy var buttonView = viewManager.createButtonView()
    
    private lazy var fromToLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#5E5F61FF")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#0C0C0CFF")
        setupViews()
        setupConstraints()
        setupDelegate()
        createLabel()
        fetchTickets()
        
        navigationItem.hidesBackButton = true


    }
    
    @objc private func backwardIconTapped() {
        navigationController?.popViewController(animated: true)

    }
    
    func createLabel() {
        let fromLabel = UserDefaults.standard.string(forKey: Resources.UserDefaults.TextField.lastFromTextFieldValue)
        let toLabel = UserDefaults.standard.string(forKey: Resources.UserDefaults.TextField.lastToTextFieldValue)
        guard let fromLabel = fromLabel,
              let toLabel = toLabel else { return }
        fromToLabel.text = "\(fromLabel)-\(toLabel)"
        
        if let savedDate = UserDefaults.standard.object(forKey: Resources.UserDefaults.Date.selectedLeaveDate) as? Date {
                   let formatter = DateFormatter()
                   formatter.locale = Locale(identifier: "ru_RU")
                   formatter.dateFormat = "d MMMM "
                   infoLabel.text = "\(formatter.string(from: savedDate)), 1 пассажир"
               }
    }
    
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setupViews() {
        view.addSubview(searchView)
        searchView.addSubview(searchStack)
        view.addSubview(collectionView)
        view.addSubview(buttonView)

    }
    

    func fetchTickets() {
           NetworkService.shared.fetchTickets { [weak self] result in
               switch result {
               case .success(let tickets):
                   self?.tickets = tickets
                   DispatchQueue.main.async {
                       self?.collectionView.reloadData()
                   }
               case .failure(let error):
                   print("Failed to fetch tickets: \(error)")
               }
           }
       }
}
