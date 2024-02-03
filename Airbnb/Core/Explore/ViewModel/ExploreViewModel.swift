//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Kapil Kumar on 31/01/24.
//

import Foundation
class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    private let service : ExploreService
    init (service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        }catch{
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingForLocation(_ location: String) {
        let filterListings = listings.filter {
            $0.city.lowercased() == location.lowercased() ||
            $0.state.lowercased() == location.lowercased()
        }
        
        self.listings = filterListings.isEmpty ? listings : filterListings
    }
}
