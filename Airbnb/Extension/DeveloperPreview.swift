//
//  DeveloperPreview.swift
//  Airbnb
//
//  Created by Kapil Kumar on 30/01/24.
//

import Foundation

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    var listings: [Listing] = [
    
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Kapil", ownerImageUrl: "mail-profile-photo", numberOfBedrooms: 4, numberOfBaths: 3, numberOfGuests: 4, numberOfBeds: 4, latitude: 25.6533, longitude: 26.9876, imageURL: ["listing1", "listing2","listing3","listing4"], pricePerNight: 9879, address: "UDB EcoScape", city: "Jaipur", state: "Rajasthan", title: "UDB Ecoscape", rating: 4.9, features: [.selfCheckIn, .superHost], amenities: [.wifi, .kitchen, .balcony, .laundary, .tv], type: [.villa, .house]),
        
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Kapil", ownerImageUrl: "mail-profile-photo", numberOfBedrooms: 4, numberOfBaths: 3, numberOfGuests: 4, numberOfBeds: 4, latitude: 25.6233, longitude: 26.9846, imageURL: ["listing1", "listing2","listing3","listing4"],  pricePerNight: 9879, address: "UDB EcoScape", city: "Bharatpur", state: "Rajasthan", title: "UDB EcoHomes", rating: 4.9, features: [.selfCheckIn, .superHost], amenities: [.wifi, .kitchen, .balcony, .laundary, .tv], type: [.villa, .house]),
        
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Kapil", ownerImageUrl: "mail-profile-photo", numberOfBedrooms: 4, numberOfBaths: 3, numberOfGuests: 4, numberOfBeds: 4, latitude: 25.6531, longitude: 26.9872, imageURL: ["listing1", "listing2","listing3","listing4"], pricePerNight: 9879, address: "UDB EcoScape", city: "Alwar", state: "Rajasthan", title: "Rudra Building", rating: 4.9, features: [.selfCheckIn, .superHost], amenities: [.wifi, .kitchen, .balcony, .laundary, .tv], type: [.villa, .house]),
        
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, ownerName: "Kapil", ownerImageUrl: "mail-profile-photo", numberOfBedrooms: 4, numberOfBaths: 3, numberOfGuests: 4, numberOfBeds: 4, latitude: 25.6531, longitude: 26.9872,imageURL: ["listing1", "listing2","listing3","listing4"],  pricePerNight: 9879, address: "UDB EcoScape", city: "Delhi", state: "Delhi", title: "Rudra Building", rating: 4.9, features: [.selfCheckIn, .superHost], amenities: [.wifi, .kitchen, .balcony, .laundary, .tv], type: [.villa, .house])
    ]
}
