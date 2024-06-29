

import Foundation


class NetworkService {
    
    static let shared = NetworkService()
    private init() {}

    func fetchOffers(completion: @escaping (Result<[Offer], Error>) -> Void) {
            guard let url = URL(string: "https://run.mocky.io/v3/ad9a46ba-276c-4a81-88a6-c068e51cce3a") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let offersResponse = try JSONDecoder().decode(OffersResponse.self, from: data)
                    completion(.success(offersResponse.offers))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    
    
    func fetchTicketOffers(completion: @escaping (Result<[TicketOffer], Error>) -> Void) {
            guard let url = URL(string: "https://run.mocky.io/v3/38b5205d-1a3d-4c2f-9d77-2f9d1ef01a4a") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(TicketOffers.self, from: data)
                    completion(.success(decodedResponse.tickets_offers))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    
    
    func fetchTickets(completion: @escaping (Result<[Ticket], Error>) -> Void) {
            guard let url = URL(string: "https://run.mocky.io/v3/c0464573-5a13-45c9-89f8-717436748b69") else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                    return
                }

                do {
                    let ticketResponse = try JSONDecoder().decode(TicketResponse.self, from: data)
                    completion(.success(ticketResponse.tickets))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }

}
