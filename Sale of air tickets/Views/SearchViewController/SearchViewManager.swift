
import UIKit

class SearchViewManager {
    
    
    var controller: UIViewController
    var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    
    lazy private var width: CGFloat = {
        return view.frame.width - 20
    }()
    
    func createSearchView() -> UIView {
        lazy var searchView: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 328).isActive = true
            back.heightAnchor.constraint(equalToConstant: 96).isActive = true
            back.layer.cornerRadius = 25
            back.layer.cornerCurve = .continuous
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#2F3035FF")
    
            back.layer.shadowColor = UIColor.black.cgColor
            back.layer.shadowOpacity = 0.3
            back.layer.shadowOffset = CGSize(width: 0, height: 4)
            back.layer.shadowRadius = 10
            
            return back
        }()
        return searchView
    }
    
    func createCollectionView() -> UICollectionView {
        
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 120, height: 40)
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .clear
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
            
            return collectionView
        }()
        return collectionView
    }
    
    func createSearchStack(fromTextField: UITextField,toTextField: UITextField,tapGesture: UITapGestureRecognizer) -> UIStackView {
        
        lazy var searchStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(backwardIcon)
            stack.addArrangedSubview(stackForTextFields)
            return stack
        }()
        
        lazy var stackForTextFields: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(fromTextField)
            stack.addArrangedSubview(separatorView)
            stack.addArrangedSubview(toTextField)
            return stack
        }()
        
        lazy var separatorView: UIView = {
            let separator = UIView()
            separator.backgroundColor = UIColor(hex: "#9F9F9F9F")
            separator.translatesAutoresizingMaskIntoConstraints = false
            separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
            separator.widthAnchor.constraint(equalToConstant: width).isActive = true
            
            return separator
        }()
        
        lazy var backwardIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "arrow.left")
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
            return imageView
        }()
        
        return searchStack
    }
    
    
    func createChangeButton() -> UIButton {
        let changeButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
            button.tintColor = .white
            button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            
            return button
        }()
        return changeButton
    }
    
    func createClearButton() -> UIButton {
        let clearButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
            button.tintColor = .white
            button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            
            return button
        }()
        return clearButton
    }
    
    func createDirectFlightsBackView() -> UIView {
        
        lazy var directFlightsBackView: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 328).isActive = true
            back.heightAnchor.constraint(equalToConstant: 300).isActive = true
            back.layer.cornerRadius = 25
            back.layer.cornerCurve = .continuous
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#1D1E20FF")
            
            return back
        }()
        
        return directFlightsBackView
    }
    
    func createDirectFlightsLabel() -> UILabel {
        lazy var directFlightsLabel: UILabel = {
            let label = UILabel()
            label.text = "Прямые рейсы"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 24, weight: .semibold)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        return directFlightsLabel
    }
    
    func createVDirectFlightStack() -> UIStackView {
        lazy var vDirectFlightStack: UIStackView = {
            
            let vStack = UIStackView()
            vStack.axis = .vertical
            vStack.distribution = .fill
            vStack.alignment = .leading
            vStack.spacing = 5
            vStack.translatesAutoresizingMaskIntoConstraints = false
            
            return vStack
        }()
        return vDirectFlightStack
    }
    
    func createButtonForFlightStack() -> UIButton {
        lazy var buttonForFlightStack: UIButton = {
            let button = UIButton()
            
            button.setTitleColor(UIColor(hex: "#2261BCFF"), for: .normal)
            button.setTitle("Показать все", for: .normal)
            button.backgroundColor = .clear
            
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            button.widthAnchor.constraint(equalToConstant: width - 60).isActive = true
            return button
        }()
        
        return buttonForFlightStack
    }
    
    func createAllTicketsButton() -> UIButton {
        
        lazy var allTicketsButton: UIButton = {
            let button = UIButton()
            
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Посмотреть все билеты", for: .normal)
            button.backgroundColor = UIColor(hex: "#2261BCFF")
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 42).isActive = true
            button.widthAnchor.constraint(equalToConstant: width).isActive = true
            return button
        }()
        return allTicketsButton
        
    }
    
    func createSubscriptionBackView() -> UIView {
        
        lazy var subscriptionBackView: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: width).isActive = true
            back.heightAnchor.constraint(equalToConstant: 51).isActive = true
            back.layer.cornerRadius = 12
            back.layer.cornerCurve = .continuous
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#242529FF")
            
            return back
        }()
        return subscriptionBackView
    }

    func createSubscriptionHStack() -> UIStackView {
        lazy var subscriptionHStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.spacing = 5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.heightAnchor.constraint(equalToConstant: 40).isActive = true
            stack.addArrangedSubview(labelHStack)
            stack.addArrangedSubview(subscriptionSwitch)
            return stack
            
        }()
        
        lazy var labelHStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.spacing = 5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.heightAnchor.constraint(equalToConstant: 40).isActive = true
            stack.addArrangedSubview(subscriptionIcon)
            stack.addArrangedSubview(subscriptionLabel)
            return stack
            
        }()
        lazy var subscriptionIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "bell.fill")
            imageView.tintColor = UIColor(hex: "#2261BCFF")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            return imageView
        }()
        lazy var subscriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Подписка на цену"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 16, weight: .regular)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        lazy var subscriptionSwitch: UISwitch = {
            let subSwitch = UISwitch()
            return subSwitch
        }()
        
        
        return subscriptionHStack
    }
    
}
