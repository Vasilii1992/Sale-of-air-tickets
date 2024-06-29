
import UIKit



class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"

    var indexPath: IndexPath?

    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.isHidden = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.tintColor = UIColor(hex: "#2F3035FF")
        picker.alpha = 0.1
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.isHidden = true
        picker.locale = Locale(identifier: "ru_RU")
        return picker
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(datePicker)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            datePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: contentView.topAnchor),
            datePicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        contentView.backgroundColor = UIColor(hex: "#2F3035FF") 
        contentView.layer.cornerRadius = 18
        
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        setDate(Date())
        saveDateToUserDefaults(date: datePicker.date, key: Resources.UserDefaults.Date.selectedReturnDate)

        
        configure(with: "", text: "", isDatePicker: false)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with iconName: String, text: String, isDatePicker: Bool = false) {
        iconImageView.isHidden = isDatePicker
        titleLabel.isHidden = isDatePicker
        datePicker.isHidden = !isDatePicker
        dateLabel.isHidden = !isDatePicker
        
        if !isDatePicker {
            iconImageView.image = UIImage(systemName: iconName)
            titleLabel.text = text
            
        }
    }
    
    func getDate() -> Date {
        return datePicker.date
    }
    
    func setDate(_ date: Date) {
        datePicker.date = date
        updateDateLabel()
        
    }
    
    func toggleDatePicker() {
        datePicker.isHidden = !datePicker.isHidden
        dateLabel.isHidden = !dateLabel.isHidden
    }

    
    @objc private func dateChanged() {
        updateDateLabel()
        if isDatePickerCellForReturnDate() {
                  saveDateToUserDefaults(date: datePicker.date, key: Resources.UserDefaults.Date.selectedReturnDate)
              } else {
                  saveDateToUserDefaults(date: datePicker.date, key: Resources.UserDefaults.Date.selectedLeaveDate)
              }

    }
    private func isDatePickerCellForReturnDate() -> Bool {

        return indexPath?.row == 0
    }
    
    private func updateDateLabel() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM, EE"
        dateLabel.text = formatter.string(from: datePicker.date)
    }
    private func saveDateToUserDefaults(date: Date,key: String) {
        UserDefaults.standard.set(date, forKey: key)
    }
    
}
