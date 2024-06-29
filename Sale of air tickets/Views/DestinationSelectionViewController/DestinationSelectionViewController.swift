
import UIKit

class DestinationSelectionViewController: UIViewController {
    
    weak var delegate: DestinationSelectionDelegate?
    
    private lazy var destinationViewManager: DestinationSelectionViewManager = {
        return DestinationSelectionViewManager(controller: self)
    }()
    
    private lazy var viewManager: ViewManager = {
        return ViewManager(controller: self)
    }()
    
    lazy var fromTextField = viewManager.createFromTextField(color: UIColor(hex:"#2F3035FF") ?? .black)
    lazy var toTextField: UITextField = {
        let textField = viewManager.createToTextField(color: UIColor(hex:"#2F3035FF") ?? .black)
        textField.rightViewMode = .always
        textField.rightView = clearButton
        textField.widthAnchor.constraint(equalToConstant: 400).isActive = true
        textField.delegate = self
        
        return textField
    }()
    
    
    lazy var clearButton = destinationViewManager.createClearButton()
    lazy var backButton = destinationViewManager.createBackButton()
    
    // заглушка
    lazy var stubView = destinationViewManager.createStubView(backButton: backButton)
    // коллекция
    lazy var collectionView = destinationViewManager.createCollectionView()
    
    // верхняя часть
    lazy var searchView = destinationViewManager.createSearchView()
    lazy var stackForTextFields = destinationViewManager.createStackForTextFields(fromTextField: fromTextField, toTextField: toTextField)
    
    // предложения
    lazy var backgroundForTheBottom = destinationViewManager.createBackgroundForTheBottom()
    lazy var hStackCountry = destinationViewManager.createHStackCountry()
    private lazy var stackCountry = viewManager.createCountryStack(title: "Станбул", imageName: "Bridge")
    private lazy var stackCountry1 = viewManager.createCountryStack(title: "Сочи", imageName: "sochi")
    private lazy var stackCountry2 = viewManager.createCountryStack(title: "Пхукет", imageName: "phuket")
    
    
    let cellData = [
        ("difficult route", "Сложный маршрут"),
        ("anywhere", "Куда угодно"),
        ("weekends", "Выходные"),
        ("hot tickets", "Горячие билеты")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#242529FF")
        setupViews()
        setupConstraints()
        setupDelegate()
        addAction()
        
        fromTextField.text = UserDefaults.standard.string(forKey: Resources.UserDefaults.TextField.lastFromTextFieldValue)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 20, y: 190, width: view.frame.size.width, height: 110).integral
    }
    
    @objc func clearToTextField() {
        toTextField.text = ""
    }
    
    @objc private func hideStubView() {
        stubView.isHidden = true
    }
    
    func setupViews() {
        
        view.addSubview(searchView)
        searchView.addSubview(stackForTextFields)
        view.addSubview(collectionView)
        view.addSubview(backgroundForTheBottom)
        backgroundForTheBottom.addSubview(hStackCountry)
        view.addSubview(stubView)
        
        hStackCountry.addArrangedSubview(stackCountry)
        hStackCountry.addArrangedSubview(stackCountry1)
        hStackCountry.addArrangedSubview(stackCountry2)
        
    }
    
    func addAction() {
        addTapGesture(to: stackCountry, action: #selector(countryTapped(_:)))
        addTapGesture(to: stackCountry1, action: #selector(countryTapped(_:)))
        addTapGesture(to: stackCountry2, action: #selector(countryTapped(_:)))
        
        clearButton.addTarget(self, action: #selector(clearToTextField), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(hideStubView), for: .touchUpInside)
    }
    
    private func addTapGesture(to stackView: UIStackView, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        stackView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func countryTapped(_ sender: UITapGestureRecognizer) {
        guard let stackView = sender.view as? UIStackView else { return }
        for subview in stackView.arrangedSubviews {
            if let hStack = subview as? UIStackView {
                for innerSubview in hStack.arrangedSubviews {
                    if let vStack = innerSubview as? UIStackView {
                        for labelSubview in vStack.arrangedSubviews {
                            if let label = labelSubview as? UILabel, label.font == UIFont.systemFont(ofSize: 20, weight: .semibold) {
                                toTextField.text = label.text
                                return
                            }
                        }
                    }
                }
            }
        }
    }
    
    func showStubView(for message: String) {
        let label = stubView.subviews.compactMap { $0 as? UILabel }.first
        label?.text = "\(message).\n Хотите вернуться?"
        stubView.isHidden = false
    }
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SuggestionCollectionViewCell.self,
                                forCellWithReuseIdentifier: SuggestionCollectionViewCell.identifier)
        
    }
}
