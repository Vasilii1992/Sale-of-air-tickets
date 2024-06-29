

import Foundation

struct Price: Decodable {
    let value: Int
}

struct Offer: Decodable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct OffersResponse: Decodable {
    let offers: [Offer]
}
