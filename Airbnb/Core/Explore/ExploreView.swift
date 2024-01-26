//
//  ExploreView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 20/01/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                SearchAndFilterBar()
                LazyVStack(spacing: 32){
                    ForEach(0...10, id: \.self) { listing in
                        NavigationLink(value: listing) {
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }.padding()
            }
            .navigationDestination(for: Int.self) { listing in
                Text("Lisitng detail view...")
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
