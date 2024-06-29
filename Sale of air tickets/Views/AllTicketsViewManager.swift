
import UIKit

class AllTicketsViewManager {
    
    var controller: UIViewController
    var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    
    func createCollectionView() -> UICollectionView {
        
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(TicketCollectionViewCell.self, forCellWithReuseIdentifier: TicketCollectionViewCell.identifier)
            collectionView.backgroundColor = .clear
            return collectionView
        }()
        
        return collectionView
    }
    
    
    
    func createSearchView() -> UIView {
        lazy var searchView: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 328).isActive = true
            back.heightAnchor.constraint(equalToConstant: 56).isActive = true
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#242529FF") // #242529
            
            
            return back
        }()
        
        return searchView
    }
    
    
    func createSearchStack(fromToLabel: UILabel,infoLabel: UILabel, tapGesture: UITapGestureRecognizer ) -> UIStackView {
        
        lazy var searchView: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 328).isActive = true
            back.heightAnchor.constraint(equalToConstant: 56).isActive = true
            back.clipsToBounds = false
            back.backgroundColor = UIColor(hex: "#242529FF") // #242529
            
            
            return back
        }()
        
        lazy var searchStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 30
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(backwardIcon)
            stack.addArrangedSubview(stackForText)
            return stack
        }()
        
        lazy var stackForText: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .leading
            stack.spacing = 2
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(fromToLabel)
            stack.addArrangedSubview(infoLabel)
            return stack
        }()
        
        
        lazy var backwardIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "arrow.left")
            imageView.tintColor = UIColor(hex: "#2261BCFF")
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
    
    
    func createButtonView() -> UIView {
        lazy var filterButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 17))
            
            button.setTitleColor(.white, for: .normal)
            button.setTitle("фильтр", for: .normal)
            button.setImage(UIImage(named: "Filter"), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            button.widthAnchor.constraint(equalToConstant: 80).isActive = true
            return button
        }()
        lazy var scheduleButton: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 17))
            button.setTitleColor(.white, for: .normal)
            button.setTitle("График цен", for: .normal)
            button.setImage(UIImage(named: "chart"), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            button.widthAnchor.constraint(equalToConstant: 110).isActive = true
            return button
        }()
        
        lazy var buttonView: UIView = {
            let back = UIView()
            back.translatesAutoresizingMaskIntoConstraints = false
            back.widthAnchor.constraint(equalToConstant: 203).isActive = true
            back.heightAnchor.constraint(equalToConstant: 37).isActive = true
            back.clipsToBounds = false
            back.layer.cornerRadius = 20
            back.backgroundColor = UIColor(hex: "#2261BCFF")
            back.addSubview(filterButton)
            back.addSubview(scheduleButton)
            return back
        }()
        
        NSLayoutConstraint.activate([
            
            filterButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 2),
            filterButton.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 2),
            
            scheduleButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 2),
            scheduleButton.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -2),
            
        ])
        
        return buttonView
    }
    
    
}
