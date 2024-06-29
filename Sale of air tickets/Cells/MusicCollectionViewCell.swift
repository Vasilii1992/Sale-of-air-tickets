

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
