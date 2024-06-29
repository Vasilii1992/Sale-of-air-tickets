

import UIKit


extension AirTicketsViewController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            musicTitle.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 30),
            musicTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            backIntoSearchBar.topAnchor.constraint(equalTo: backForSearchBar.topAnchor, constant: 20),
            backIntoSearchBar.leadingAnchor.constraint(equalTo: backForSearchBar.leadingAnchor, constant: 20),
            backIntoSearchBar.trailingAnchor.constraint(equalTo: backForSearchBar.trailingAnchor, constant: -20),
            backIntoSearchBar.bottomAnchor.constraint(equalTo: backForSearchBar.bottomAnchor, constant: -20),
            
            searchStack.topAnchor.constraint(equalTo: backIntoSearchBar.topAnchor, constant: 20),
            searchStack.leadingAnchor.constraint(equalTo: backIntoSearchBar.leadingAnchor, constant: 20),
            searchStack.trailingAnchor.constraint(equalTo: backIntoSearchBar.trailingAnchor, constant: -20),
            searchStack.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

//MARK: - UICollectionViewDataSource
extension AirTicketsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath) as! MusicCollectionViewCell
        let offer = offers[indexPath.item]
        cell.configure(with: offer)
        return cell
    }
}

//MARK: - UITextFieldDelegate
extension AirTicketsViewController: UITextFieldDelegate {
    
    //MARK: - ограничили символы на ввод

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == fromTextField  {
            let allowedCharacters = CharacterSet(charactersIn: Resources.TextField.charactersIn)
            let characterSet = CharacterSet(charactersIn: string)
            let isSuperset = allowedCharacters.isSuperset(of: characterSet)
            
            if isSuperset {
                let currentText = textField.text ?? ""
                let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                UserDefaults.standard.set(updatedText, forKey: Resources.UserDefaults.TextField.lastFromTextFieldValue)
            }
            return isSuperset
        } else if textField == toTextField  {
            let allowedCharacters = CharacterSet(charactersIn: Resources.TextField.charactersIn)
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }

    func loadLastFromTextFieldValue() {
        if let lastValue = UserDefaults.standard.string(forKey: Resources.UserDefaults.TextField.lastFromTextFieldValue) {
            fromTextField.text = lastValue
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    //MARK: - открываем модальное окно в текст филде
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == toTextField {
            let destinationVC = DestinationSelectionViewController()
            destinationVC.modalPresentationStyle = .pageSheet
            destinationVC.delegate = self
            present(destinationVC, animated: true, completion: nil)
            return false
        }
        return true
    }
}
extension AirTicketsViewController: DestinationSelectionDelegate {
    func didSelectDestination() {
        navigateToSearchViewController()
    }
}
