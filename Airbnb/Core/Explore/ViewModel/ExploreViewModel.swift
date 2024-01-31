//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Kapil Kumar on 31/01/24.
//

import Foundation
class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    
    init () {
        
    }
    
    func fetchListings() async {
        
    }
}
