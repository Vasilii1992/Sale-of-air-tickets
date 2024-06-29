

import UIKit

class TicketCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TicketCollectionViewCell"

    private let badgeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor(hex: "#2261BCFF")
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 21).isActive = true
        label.widthAnchor.constraint(equalToConstant: 126).isActive = true

        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let flightDurationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let departureAirportLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#9F9F9FFF")
        label.font = .italicSystemFont(ofSize: 16)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let arrivalAirportLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 16)

        label.textColor = UIColor(hex: "#9F9F9FFF")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let companyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "1")
        imageView.layer.cornerRadius = 12
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    

    private lazy var airportLabeHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(departureAirportLabel)
        stackView.addArrangedSubview(arrivalAirportLabel)
        return stackView
    }()
    
    private lazy var timeAndDuractionHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(airportLabeHStack)
        return stackView
    }()
    
    
    private lazy var hStackForTimeandLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(companyImage)
        stackView.addArrangedSubview(timeAndDuractionHStack)
        
        return stackView
    }()
    
    private lazy var hStackForDurationLabel: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(hStackForTimeandLabel)
        stackView.addArrangedSubview(flightDurationLabel)

        return stackView
    }()
    
    
    
    private lazy var vStackForPrice: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 328).isActive = true
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(hStackForDurationLabel)
        stackView.backgroundColor = UIColor(hex: "#1D1E20FF")


        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with ticket: Ticket) {
        badgeLabel.text = ticket.badge
        priceLabel.text = "\(formatPrice(ticket.price.value)) ₽"
        timeLabel.text = "\(formattedDate(ticket.departure.date)) - \(formattedDate(ticket.arrival.date))"
        departureAirportLabel.text = ticket.departure.airport
        arrivalAirportLabel.text = ticket.arrival.airport
        flightDurationLabel.text = "\(flightDuration(from: ticket.departure.date, to: ticket.arrival.date))/\(ticket.hasTransfer ? "С пересадкой" : "Без пересадок")"

        badgeLabel.isHidden = ticket.badge == nil
    }
    
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    private func formattedDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        }
        return ""
    }

    private func flightDuration(from departureDate: String, to arrivalDate: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let departure = formatter.date(from: departureDate),
           let arrival = formatter.date(from: arrivalDate) {
            let interval = arrival.timeIntervalSince(departure)
            let hours = Int(interval) / 3600
            let minutes = Int(interval) % 3600 / 60
            return "\(hours)ч \(minutes)м в пути"
        }
        return ""
    }

    private func setupViews() {
        contentView.addSubview(vStackForPrice)
        contentView.addSubview(badgeLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            vStackForPrice.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            vStackForPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStackForPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStackForPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: vStackForPrice.topAnchor, constant: 20),
            priceLabel.leftAnchor.constraint(equalTo: vStackForPrice.leftAnchor, constant: 20),
            
            badgeLabel.topAnchor.constraint(equalTo: vStackForPrice.topAnchor, constant: -10),
            badgeLabel.leadingAnchor.constraint(equalTo: vStackForPrice.leadingAnchor),

        ])
    }
}
