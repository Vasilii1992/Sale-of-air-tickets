//
//  MockData.swift
//  Sale of air tickets
//
//  Created by Василий Тихонов on 10.07.2024.
//

import Foundation


final class MockData {
    
    static let shared = MockData()
    
    
    
    var offers: [Offer] = [
    
        .init(id: 1, title: "Die Antwoord", town: "Будапешт", price: Price.init(value: 22264)),
        .init(id: 2, title: "Socrat& Lera", town: "Санкт- Петербург", price: Price.init(value: 2390)),
        .init(id: 3, title: "Лампабикт", town: "Москва", price: Price.init(value: 12400))
    
    
    ]
    
    
    
    
    
    var ticketOffers: [TicketOffer] = [
        .init(id: 1, title: "Уральские авиалинии", time_range: [ "07:00", "09:10", "10:00", "11:30", "14:15", "19:10", "21:00", "23:30" ], price: Price.init(value: 3999)),
        .init(id: 10, title: "Победа", time_range: ["09:10", "21:00"], price: Price.init(value: 4999)),
        .init(id: 30, title: "NordStar", time_range: ["07:00"], price: Price.init(value: 2390))
    
    ]
    
    var tickets: [Ticket] = [
        .init(
            id: 100,
            badge: "Самый удобный",
            price: Price.init(value: 1999),
            providerName: "На сайте Купибилет",
            company: "Якутия",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T03:15:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-23T07:10:00", airport: "AER"),
            hasTransfer: false,
            luggage: Luggage.init(hasLuggage: false, price: Price.init(value: 1082)),
            handLuggage: HandLuggage.init(hasHandLuggage: true, size: "55x20x40"),
            isReturnable: false,
            isExchangable: true
        ),
        .init(
            id: 101, badge: nil,
            price: Price.init(value: 9999),
            providerName: "На сайте Победа",
            company: "Победа",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T04:00:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-23T08:30:00", airport: "AER"),
            hasTransfer: false,
            luggage: Luggage.init(hasLuggage: false, price: Price.init(value: 1602)),
            handLuggage: HandLuggage.init(hasHandLuggage: true, size: "36x30x27"),
            isReturnable: false,
            isExchangable: true
        ),
        .init(
            id: 102, badge: nil,
            price: Price.init(value: 8500),
            providerName: "На сайте Turkish Airlines",
            company: "Турецкие авиалинии",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T15:00:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-23T18:40:00", airport: "AER"),
            hasTransfer: false,
            luggage: Luggage.init(hasLuggage: true, price: nil),
            handLuggage: HandLuggage.init(hasHandLuggage: true, size: "55x20x40"),
            isReturnable: false,
            isExchangable: false
        ),
        .init(
            id: 103,
            badge: "Рекомендуемый",
            price: Price.init(value: 8086),
            providerName: "На сайте Уральские авиалинии",
            company: "Уральские авиалинии",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T11:30:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-23T15:00:00", airport: "AER"),
            hasTransfer: false,
            luggage: Luggage.init(hasLuggage: false, price: Price.init(value: 1570)),
            handLuggage: HandLuggage.init(hasHandLuggage: true, size: "55x20x40"),
            isReturnable: true,
            isExchangable: true
        ),
        .init(
            id: 104, badge: nil,
            price: Price.init(value: 11560),
            providerName: "На сайте Aeroflot",
            company: "Аэрофлот",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T11:50:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-23T15:20:00", airport: "AER"),
            hasTransfer: true,
            luggage: Luggage.init(hasLuggage: false, price: Price.init(value: 999)),
            handLuggage: HandLuggage.init(hasHandLuggage: true, size: "55x20x40"),
            isReturnable: false,
            isExchangable: true
        ),
        .init(
            id: 105, badge: nil,
            price: Price.init(value: 15600),
            providerName: "На сайте Aeroflot",
            company: "Аэрофлот",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T13:50:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-23T17:20:00", airport: "AER"),
            hasTransfer: true,
            luggage: Luggage.init(hasLuggage: false, price: Price.init(value: 1999)),
            handLuggage: HandLuggage.init(hasHandLuggage: true, size: "55x20x40"),
            isReturnable: true,
            isExchangable: true
        ),
        .init(
            id: 106, badge: nil,
            price: Price.init(value: 9500),
            providerName: "На сайте Aeroflot",
            company: "Аэрофлот",
            departure: FlightDetail.init(town: "Москва", date: "2024-02-23T21:00:00", airport: "VKO"),
            arrival: FlightDetail.init(town: "Сочи", date: "2024-02-24T00:20:00", airport: "AER"),
            hasTransfer: false,
            luggage: Luggage.init(hasLuggage: false, price: Price.init(value: 5999)),
            handLuggage: HandLuggage.init(hasHandLuggage: false, size: nil),
            isReturnable: false,
            isExchangable: false
        )
    ]
    
}
