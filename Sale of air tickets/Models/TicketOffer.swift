
import Foundation

struct TicketOffers: Decodable {
    let tickets_offers: [TicketOffer]
}

struct TicketOffer: Decodable {
    let id: Int
    let title: String
    let time_range: [String]
    let price: Price
}
