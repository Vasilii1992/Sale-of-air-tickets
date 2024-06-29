
import UIKit

class DestinationSelectionViewManager {
    
    var controller: UIViewController
    var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    lazy private var width: CGFloat = {
        return view.frame.width - 20
    }()
    
    
    func createStubView(backButton: UIButton) -> UIView {
        lazy var stubView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.backgroundColor = UIColor(hex: "#3E3F43FF")
           view.isHidden = true
           view.layer.shadowColor = UIColor.black.cgColor
           view.layer.shadowOpacity = 0.3
           view.layer.shadowOffset = CGSize(width: 0, height: 4)
           view.layer.shadowRadius = 10
           view.layer.cornerRadius = 25
           
           let label = UILabel()
           label.textColor = .white
           label.numberOfLines = 0
           label.font = .systemFont(ofSize: 18, weight: .medium)
           label.translatesAutoresizingMaskIntoConstraints = false
           label.textAlignment = .center
           
           
           view.addSubview(label)
           view.addSubview(backButton)
           
           NSLayoutConstraint.activate([
               label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
               backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               backButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
           ])
           
           return view
       }()
        return stubView
    }
    
    func createBackButton() -> UIButton {
        lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
            button.setTitle("Вернуться", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        return backButton
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
    
    func createCollectionView() -> UICollectionView {

         let collectionView: UICollectionView = {
            let layout = CenteredCollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
             layout.minimumInteritemSpacing = 0
             layout.minimumLineSpacing = 0
            layout.itemSize = CGSize(width: 90, height: 110)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
             collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .none
             
            return collectionView
        }()
        return collectionView
    }
    
    func createStackForTextFields(fromTextField: UITextField,toTextField: UITextField) -> UIStackView {
         lazy var stackForTextFields: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 5
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(hStackFromTextField)
            stack.addArrangedSubview(separatorView)
            stack.addArrangedSubview(hStackToTextField)
            return stack
        }()
        
         lazy var hStackToTextField: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 15
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(searchIcon)
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
        
         lazy var hStackFromTextField: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 15
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(flyIcon)
            stack.addArrangedSubview(fromTextField)
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
        
         lazy var flyIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "flyIcon")
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            return imageView
        }()

        return stackForTextFields
    }
    
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
    
    func createBackgroundForTheBottom() -> UIView {
         lazy var backgroundForTheBottom: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 328).isActive = true
            back.heightAnchor.constraint(equalToConstant: 216).isActive = true
            back.layer.cornerRadius = 25
            back.layer.cornerCurve = .continuous
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#2F3035FF")
            
            return back
        }()
        return backgroundForTheBottom
    }
    
    func createHStackCountry()-> UIStackView {
         lazy var hStackCountry: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 10
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        return hStackCountry
    }
}

class CenteredCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.representedElementCategory == .cell {
                let cellWidth = layoutAttribute.frame.width
                let collectionViewWidth = collectionView!.frame.width
                let totalCellWidth = cellWidth * CGFloat(collectionView!.numberOfItems(inSection: 0))
                let totalSpacingWidth = minimumInteritemSpacing * CGFloat(collectionView!.numberOfItems(inSection: 0) - 1)
                let totalWidth = totalCellWidth + totalSpacingWidth
                let leftInset = (collectionViewWidth - totalWidth) / 2
                let rightInset = leftInset
                sectionInset = UIEdgeInsets(top: sectionInset.top, left: leftInset, bottom: sectionInset.bottom, right: rightInset)
            }
        }
        return attributes
    }
}
