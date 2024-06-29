
import Foundation


struct TicketResponse: Decodable {
    let tickets: [Ticket]
}

struct Ticket: Decodable {
    let id: Int
    let badge: String?
    let price: Price
    let providerName: String
    let company: String
    let departure: FlightDetail
    let arrival: FlightDetail
    let hasTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable: Bool
    let isExchangable: Bool

    enum CodingKeys: String, CodingKey {
        case id, badge, price, providerName = "provider_name", company, departure, arrival, hasTransfer = "has_transfer", luggage, handLuggage = "hand_luggage", isReturnable = "is_returnable", isExchangable = "is_exchangable"
    }
}

struct FlightDetail: Decodable {
    let town: String
    let date: String
    let airport: String
}

struct Luggage: Decodable {
    let hasLuggage: Bool
    let price: Price?
    
    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage", price
    }
}

struct HandLuggage: Decodable {
    let hasHandLuggage: Bool
    let size: String?
    
    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage", size
    }
}

