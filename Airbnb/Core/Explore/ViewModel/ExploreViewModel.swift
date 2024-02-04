//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Kapil Kumar on 31/01/24.
//

import Foundation
class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service : ExploreService
    private var listingCopy = [Listing]()
    
    init (service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingCopy = listings
        }catch{
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation() {
        let filterListings = listings.filter {
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        }
        
        self.listings = filterListings.isEmpty ? listingCopy : filterListings
    }
}
