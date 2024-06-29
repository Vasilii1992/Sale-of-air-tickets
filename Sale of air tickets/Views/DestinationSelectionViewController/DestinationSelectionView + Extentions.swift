

import UIKit

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
