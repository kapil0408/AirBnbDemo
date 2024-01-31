//
//  Listing.swift
//  Airbnb
//
//  Created by Kapil Kumar on 30/01/24.
//

import Foundation

struct Listing : Identifiable, Codable, Hashable {
    
    let id: String
    let ownerId : String
    let ownerName: String
    let ownerImageUrl: String
    
    let numberOfBedrooms: Int
    let numberOfBaths: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    
    let latitude: Double
    let longitude: Double
    let imageURL: [String]

    
    let pricePerNight: Int
    
    let address: String
    let city: String
    let state: String
    let title:String
    var rating: Double
    
    var features:[ListingFeatures]
    var amenities:[ListingAmenties]
    let type: [ListingType]
    
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var id: Int {return self.rawValue}
    
    var imageName:String {
        switch self{
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "modal"
        }
    }
    
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self{
        case .selfCheckIn:
            return "Check yourself in with the keypad"
        case .superHost:
            return "Superhost are experienced, highly rated hosts who are commited to providing great starts for guest"
        }
    }
}


enum ListingAmenties: Int, Codable, Identifiable, Hashable{
    
    case pool
    case kitchen
    case wifi
    case laundary
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String{
        switch self{
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wifi"
        case .laundary:
            return "Laundary"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        }
    }
    
    var imageName: String{
        switch self{
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundary:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkerboard.shield"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcony:
            return "building"
        }
    }
    
    var id: Int {return self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    
    case apartment
    case house
    case townHouse
    case villa
    
    var description:String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
