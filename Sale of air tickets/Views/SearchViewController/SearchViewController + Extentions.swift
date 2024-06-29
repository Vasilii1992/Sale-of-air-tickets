
import UIKit

extension SearchViewController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchStack.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            searchStack.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 20),
            searchStack.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -20),
            searchStack.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 60),
            
            directFlightsBackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            directFlightsBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            directFlightsBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            directFlightsLabel.topAnchor.constraint(equalTo: directFlightsBackView.topAnchor, constant: 20),
            directFlightsLabel.leadingAnchor.constraint(equalTo: directFlightsBackView.leadingAnchor, constant: 20),
            
            vDirectFlightStack.topAnchor.constraint(equalTo: directFlightsLabel.bottomAnchor, constant: 20),
            vDirectFlightStack.leadingAnchor.constraint(equalTo: directFlightsBackView.leadingAnchor, constant: 20),
            vDirectFlightStack.trailingAnchor.constraint(equalTo: directFlightsBackView.trailingAnchor, constant: 20),
            
            allTicketsButton.topAnchor.constraint(equalTo: directFlightsBackView.bottomAnchor, constant: 20),
            allTicketsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            allTicketsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subscriptionBackView.topAnchor.constraint(equalTo: allTicketsButton.bottomAnchor, constant: 30),
            subscriptionBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subscriptionBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subscriptionHStack.topAnchor.constraint(equalTo: subscriptionBackView.topAnchor,constant: 5),
            subscriptionHStack.leadingAnchor.constraint(equalTo: subscriptionBackView.leadingAnchor,constant: 25),
            subscriptionHStack.trailingAnchor.constraint(equalTo: subscriptionBackView.trailingAnchor,constant: -25),
            subscriptionHStack.bottomAnchor.constraint(equalTo: subscriptionBackView.bottomAnchor,constant: -5),
            
        ])
        
    }
}

extension SearchViewController: UITextFieldDelegate {
    
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
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        let data = collectionViewData[indexPath.row]
        
        if indexPath.row == 1 {
            cell.configure(with: "", text: "", isDatePicker: true)
            cell.setDate(Date())
            
        } else {
            cell.configure(with: data.icon, text: data.text)
        }
        
        cell.indexPath = indexPath 

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < collectionViewData.count else {
            return
        }
        
        if indexPath.row == 0 && collectionViewData[indexPath.row].isDefault {
            collectionViewData[indexPath.row].isDefault = false
            collectionViewData[indexPath.row].text = ""
            collectionViewData[indexPath.row].icon = ""
            collectionView.reloadItems(at: [indexPath])
        }
        
        let cellData = collectionViewData[indexPath.row]
        
        if cellData.isDatePickerCell {
            if let cell = collectionView.cellForItem(at: indexPath) as? SearchCollectionViewCell {
                cell.toggleDatePicker()
            }
        }
    }
}


