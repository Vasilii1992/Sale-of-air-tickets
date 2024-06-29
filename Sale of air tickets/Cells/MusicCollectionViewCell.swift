

import UIKit


class MusicCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MusicCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(mainStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.backgroundColor = .white
        imageView.heightAnchor.constraint(equalToConstant: 132).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 133).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let airplaneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "IconForPrice")
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let titleLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 14, weight: .bold)
           label.textColor = .white
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let townLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 12, weight: .regular)
           label.textColor = .white
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let priceLabel: UILabel = {
           let label = UILabel()
           label.font = .systemFont(ofSize: 12, weight: .regular)
           label.textColor = .white
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(townLabel)
        stack.addArrangedSubview(priceStack)
        return stack
    }()
    
    private lazy var priceStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3
        stack.addArrangedSubview(airplaneImageView)
        stack.addArrangedSubview(priceLabel)
        return stack
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainStack.frame = contentView.bounds
    }
    
    public func configure(with offer: Offer) {
        switch offer.id {
        case 1: imageView.image = UIImage(named: "Rectangle")
        case 2: imageView.image = UIImage(named: "socrat-i-lera")
        case 3: imageView.image = UIImage(named: "third sentence")
        default:imageView.image = UIImage(named: "Rectangle")
        }

        titleLabel.text = offer.title
        townLabel.text = offer.town
        priceLabel.text = "от \(offer.price.value) ₽"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}

/*
 Ты IOS разработчик. у нас есть "collectionView" в которой всегда находится только 4 ячейки, необходимо избавиться от метода "viewDidLayoutSubviews" и добавить ограничения в метод "setupConstraints".
 
 You are an iOS developer. we have a "collectionView" in which there are always only 4 cells, we need to get rid of the "viewDidLayoutSubviews" method and add constraints to the "setupConstraints" method.
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
 
 func createCollectionView() -> UICollectionView {

      let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.itemSize = CGSize(width: 90, height: 110)
         layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.showsHorizontalScrollIndicator = false
         collectionView.backgroundColor = .none
          
         return collectionView
     }()
     return collectionView
 }
 
     
     
     lazy var clearButton = destinationViewManager.createClearButton()
     lazy var backButton = destinationViewManager.createBackButton()
     
     // заглушка
     lazy var stubView = destinationViewManager.createStubView(backButton: backButton)
     // коллекция
     lazy var collectionView = createCollectionView()
     
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
         collectionView.frame = CGRect(x: 0, y: 190, width: view.bounds.width, height: 110)
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
 
 protocol DestinationSelectionDelegate: AnyObject {
     func didSelectDestination()
 }

 extension DestinationSelectionViewController {
     
     func setupConstraints() {
         NSLayoutConstraint.activate([
             searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
             searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             
             stackForTextFields.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
             stackForTextFields.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
             stackForTextFields.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10),
             stackForTextFields.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),

             backgroundForTheBottom.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
             backgroundForTheBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             backgroundForTheBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             
             hStackCountry.topAnchor.constraint(equalTo: backgroundForTheBottom.topAnchor, constant: 10),
             hStackCountry.leadingAnchor.constraint(equalTo: backgroundForTheBottom.leadingAnchor, constant: 20),
             hStackCountry.trailingAnchor.constraint(equalTo: backgroundForTheBottom.trailingAnchor, constant: -10),
             
             stubView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             stubView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
             stubView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
             stubView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
             
         ])
     }
 }

 extension DestinationSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return cellData.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCollectionViewCell.identifier, for: indexPath) as? SuggestionCollectionViewCell else {
             return UICollectionViewCell()
         }
         
         let data = cellData[indexPath.row]
         if let image = UIImage(named: data.0) {
             cell.configure(with: image, title: data.1)
         }
         return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let data = cellData[indexPath.row]
         // это для заглушек
         if data.0 == "difficult route" || data.0 == "weekends" || data.0 == "hot tickets" {
             showStubView(for: data.1)
         } else if data.0 == "anywhere" {
             toTextField.text = data.1
         }
     }
 }

 extension DestinationSelectionViewController: UITextFieldDelegate {
     
     
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if textField == fromTextField  {
             let allowedCharacters = CharacterSet(charactersIn: Resources.TextField.charactersIn)
             let characterSet = CharacterSet(charactersIn: string)
             return allowedCharacters.isSuperset(of: characterSet)
         } else if textField == toTextField  {
             let allowedCharacters = CharacterSet(charactersIn: Resources.TextField.charactersIn)
             let characterSet = CharacterSet(charactersIn: string)
             return allowedCharacters.isSuperset(of: characterSet)
         }
         return true
     }
     
     func textFieldDidEndEditing(_ textField: UITextField) {
         if textField == toTextField, let text = textField.text, !text.isEmpty {
             UserDefaults.standard.set(textField.text, forKey: Resources.UserDefaults.TextField.lastToTextFieldValue)
             self.dismiss(animated: true) { [weak self] in
                 self?.delegate?.didSelectDestination()
             }
         }
     }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
     
 }


 */
