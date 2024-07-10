

import UIKit

class SearchViewController: UIViewController {
    
    private lazy var searchViewManager: SearchViewManager = {
        return SearchViewManager(controller: self)
    }()
    private lazy var viewManager: ViewManager = {
        return ViewManager(controller: self)
    }()
    
    var ticketOffers: [TicketOffer] = MockData.shared.ticketOffers
    
    
    // создаем наш поисковик
     lazy var searchView = searchViewManager.createSearchView()

     lazy var fromTextField: UITextField = {
        let textField = viewManager.createFromTextField(color: UIColor(hex: "#2F3035FF")!)
        textField.rightViewMode = .always
        textField.rightView = changeButton
        textField.widthAnchor.constraint(equalToConstant: 400).isActive = true
        textField.delegate = self

        return textField
    }()

     lazy var toTextField: UITextField = {
        let textField = viewManager.createToTextField(color: UIColor(hex: "#2F3035FF")!)
        textField.rightViewMode = .always
        textField.rightView = clearButton
        textField.widthAnchor.constraint(equalToConstant: 400).isActive = true
        textField.delegate = self

        return textField
    }()
    lazy var changeButton = searchViewManager.createChangeButton()
    lazy var clearButton = searchViewManager.createClearButton()

     lazy var searchStack = searchViewManager.createSearchStack(fromTextField: fromTextField, toTextField: toTextField, tapGesture: UITapGestureRecognizer(target: self, action: #selector(backwardIconTapped)))

    
    // коллекция
    lazy var collectionView = searchViewManager.createCollectionView()
    
    // Блок с прямыми рейсами
    lazy var directFlightsBackView = searchViewManager.createDirectFlightsBackView()
    lazy var directFlightsLabel = searchViewManager.createDirectFlightsLabel()
    lazy var vDirectFlightStack = searchViewManager.createVDirectFlightStack()
    lazy var buttonForFlightStack = searchViewManager.createButtonForFlightStack()

    
   // кнопка просмотра всех билетов
    lazy var allTicketsButton = searchViewManager.createAllTicketsButton()

    // нижняя кнопка
    lazy var subscriptionBackView = searchViewManager.createSubscriptionBackView()
    lazy var subscriptionHStack = searchViewManager.createSubscriptionHStack()

    
    
    var collectionViewData = [
        (icon: "plus", text: "обратно", isDatePickerCell: true, isDefault: true), 
        (icon: "calendar", text: "", isDatePickerCell: true, isDefault: false),
        (icon: "person.fill", text: "1,эконом", isDatePickerCell: false, isDefault: false),
        (icon: "slider.vertical.3", text: "фильтры", isDatePickerCell: false, isDefault: false)
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#0C0C0CFF")
        setupViews()
        setupConstraints()
        addActionButton()
        setupDelegate()
        UserDefaults.standard.set(Date(), forKey: Resources.UserDefaults.Date.selectedLeaveDate)

        fromTextField.text = UserDefaults.standard.string(forKey: Resources.UserDefaults.TextField.lastFromTextFieldValue)
        toTextField.text = UserDefaults.standard.string(forKey: Resources.UserDefaults.TextField.lastToTextFieldValue)
        navigationItem.hidesBackButton = true
        
       // fetchData()
        updateUI()
    }
    
    func addActionButton() {
        clearButton.addTarget(self, action: #selector(clearToTextField), for: .touchUpInside)
        changeButton.addTarget(self, action: #selector(changeFromTextField), for: .touchUpInside)
        allTicketsButton.addTarget(self, action: #selector(showAllTickets), for: .touchUpInside)
    }
    
    func setupDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    private func fetchData() {
        
        NetworkService.shared.fetchTicketOffers { [weak self] result in
            switch result {
            case .success(let offers):
                self?.ticketOffers = offers
                DispatchQueue.main.async {
                    self?.updateUI()
                }
            case .failure(let error):
                print("Failed to fetch ticket offers:", error)
            }
        }
    }
    
    private func updateUI() {
        
           for view in vDirectFlightStack.arrangedSubviews {
               view.removeFromSuperview()
           }
           for offer in ticketOffers {
               let flightStack = viewManager.createDirectFlightStack(
                   title: offer.title,
                   imageName: String(offer.id),
                   timeRange: offer.time_range.joined(separator: " "),
                   price: "\(formatPrice(offer.price.value)) ₽"
               )
               vDirectFlightStack.addArrangedSubview(flightStack)
               vDirectFlightStack.addArrangedSubview(buttonForFlightStack)

               
           }
       }
    
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
 
    @objc func clearToTextField() {
        toTextField.text = ""
    }
    
    @objc func changeFromTextField() {
            let tempText = fromTextField.text
            fromTextField.text = toTextField.text
            toTextField.text = tempText
        UserDefaults.standard.set(toTextField.text, forKey: Resources.UserDefaults.TextField.lastToTextFieldValue)
        UserDefaults.standard.set(fromTextField.text, forKey: Resources.UserDefaults.TextField.lastFromTextFieldValue)

    }
    @objc private func backwardIconTapped() {
        navigationController?.popViewController(animated: true)

    }
    
    @objc private func showAllTickets() {
        let allTicketsVC = AllTicketsViewController()

        navigationController?.pushViewController(allTicketsVC, animated: true)
    }

    func setupViews() {
        
        view.addSubview(searchView)
        searchView.addSubview(searchStack)
        view.addSubview(collectionView)
        view.addSubview(directFlightsBackView)
        directFlightsBackView.addSubview(directFlightsLabel)
        directFlightsBackView.addSubview(vDirectFlightStack)
        view.addSubview(allTicketsButton)
        view.addSubview(subscriptionBackView)
        subscriptionBackView.addSubview(subscriptionHStack)
    }
}

