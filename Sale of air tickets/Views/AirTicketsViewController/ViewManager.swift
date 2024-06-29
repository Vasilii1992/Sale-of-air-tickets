
import UIKit

class ViewManager {

    var controller: UIViewController
    var view: UIView
    
    lazy private var width: CGFloat = {
        return view.frame.width - 40
    }()
    lazy private var height: CGFloat = {
        return (view.frame.height) / 6
    }()
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    
    
    func createFromTextField(color: UIColor) -> UITextField {
        let textField = UITextField()
        textField.placeholder = "Откуда - Москва"
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        textField.borderStyle = .none
        textField.backgroundColor = color
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "#9F9F9FFF") ?? UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold) ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func createToTextField(color: UIColor) -> UITextField  {
        let textField = UITextField()
        textField.placeholder = "Куда - Турция"
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 20,weight: .bold)
        textField.borderStyle = .none
        textField.backgroundColor = color      // UIColor(hex: "#3E3F43FF")
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "#9F9F9FFF") ?? UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20,weight: .semibold) ])
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func createSeparatorView(with: CGFloat ) -> UIView  {
        let separator = UIView()
        separator.backgroundColor = UIColor(hex: "#9F9F9F9F")
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.widthAnchor.constraint(equalToConstant: with).isActive = true
        
        return separator
    }
 
    func createCountryStack(title: String, imageName: String) -> UIStackView {
        
        let countryImage: UIImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: imageName)
            imageView.layer.cornerRadius = 12
            imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            return imageView
        }()
        
        let countryLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20,weight: .semibold)
            label.text = title
            label.textColor = UIColor(hex: "#FFFFFFFF")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        let popularLabel: UILabel = {
            let label = UILabel()
            label.text = "Популярное направление"
            label.textColor = UIColor(hex: "#5E5F61FF")
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let separete = createSeparatorView(with: 400)
        
        let vLabelStackCountry: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(countryLabel)
            stack.addArrangedSubview(popularLabel)
            return stack
        }()
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fill
        hStack.alignment = .center
        hStack.spacing = 25
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.addArrangedSubview(countryImage)
        hStack.addArrangedSubview(vLabelStackCountry)
        hStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.alignment = .leading
        vStack.spacing = 5
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(separete)
        
        return vStack
    }

    func createDirectFlightStack(title: String, imageName: String,timeRange: String, price: String) -> UIStackView {
        
        let directFlightImage: UIImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: imageName)
            imageView.layer.cornerRadius = 12
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let directFlightLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14,weight: .semibold)
            label.text = title
            label.textColor = UIColor(hex: "#FFFFFFFF")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        
        let timeRangeLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14,weight: .light)
            label.text = timeRange
            label.textColor = UIColor(hex: "#FFFFFFFF")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let priceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14,weight: .light)
            label.text = price
            label.textColor = UIColor(hex: "#2261BCFF")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        lazy var vLabelRangeStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(directFlightLabel)
            stack.addArrangedSubview(timeRangeLabel)
            stack.widthAnchor.constraint(equalToConstant: 270).isActive = true
            return stack
        }()
        
        lazy var hDirectFlightStack: UIStackView = {
            
            let hStack = UIStackView()
            hStack.axis = .horizontal
            hStack.alignment = .top
            hStack.spacing = 10
            hStack.translatesAutoresizingMaskIntoConstraints = false
            hStack.addArrangedSubview(directFlightImage)
            hStack.addArrangedSubview(vLabelRangeStack)
            hStack.addArrangedSubview(priceLabel)
            
            hStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            return hStack
        }()
        
        lazy var separator = createSeparatorView(with: 350)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fill
        vStack.alignment = .leading
        vStack.spacing = 5
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(hDirectFlightStack)
        vStack.addArrangedSubview(separator)
        
        return vStack
    }
    
    func createHeaderStack(backForSearchBar: UIView) -> UIStackView {
         lazy var headerStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.spacing = 30
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(headerTitle)
            stack.addArrangedSubview(backForSearchBar)
            return stack
        }()
        
         lazy var headerTitle: UILabel = {
            let label = UILabel()
            label.text = "Поиск дешевых \nавиабилетов"
            label.textAlignment = .center
            label.numberOfLines = 2
            label.font = .systemFont(ofSize: 26, weight: .semibold)
            label.textColor = UIColor(hex: "#D9D9D9FF")
            return label
        }()

        return headerStack
    }
    
    func createSearchStack(fromTextField: UITextField,toTextField: UITextField) -> UIStackView {
         lazy var searchStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 30
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(searchIcon)
            stack.addArrangedSubview(stackForTextFields)
           
             return stack
        }()
        
         lazy var searchIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "searchIcon")
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            return imageView
        }()
        
         lazy var stackForTextFields: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
             stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(fromTextField)
            stack.addArrangedSubview(separatorView)
            stack.addArrangedSubview(toTextField)
            return stack
        }()
        
         lazy var separatorView = createSeparatorView(with: 300)

        return searchStack
    }
    
    func createCollectionView() -> UICollectionView {
         let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 150, height: 200)
            layout.minimumLineSpacing = 50
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .none
            return collectionView
        }()
        return collectionView
    }
    
    func createMusicTitle() -> UILabel {
         lazy var musicTitle: UILabel = {
            let label = UILabel()
            label.text = "Музыкально отлететь"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 26, weight: .semibold)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        return musicTitle
    }
    
    
    func createBackForSearchBar() -> UIView {
         lazy var backForSearchBar: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
            back.heightAnchor.constraint(equalToConstant: height).isActive = true
            back.layer.cornerRadius = 25
            back.layer.cornerCurve = .continuous
            back.clipsToBounds = true
            back.backgroundColor = UIColor(hex: "#2F3035FF")
            return back
        }()
        return backForSearchBar
    }
    
    func createBackIntoSearchBarBackIntoSearchBar() -> UIView {
         lazy var backIntoSearchBar: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 296).isActive = true
            back.heightAnchor.constraint(equalToConstant: 90).isActive = true
            back.layer.cornerRadius = 25
            back.layer.cornerCurve = .continuous
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#3E3F43FF")
            
            back.layer.shadowColor = UIColor.black.cgColor
            back.layer.shadowOpacity = 0.3
            back.layer.shadowOffset = CGSize(width: 0, height: 4)
            back.layer.shadowRadius = 10
            
            return back
        }()
        return backIntoSearchBar
    }
}

