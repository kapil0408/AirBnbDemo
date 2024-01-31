//
//  ExploreService.swift
//  Airbnb
//
//  Created by Kapil Kumar on 31/01/24.
//

import Foundation

class ExploreService {
    
    
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
    
}
