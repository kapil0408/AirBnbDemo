//
//  ListingImageCarouselView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 21/01/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURL, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

struct ListingImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
    }
}
