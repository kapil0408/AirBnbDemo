//
//  ExploreView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 20/01/24.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
            
            if(showDestinationSearchView){
                DestinationSearchView(show: $showDestinationSearchView)
            }
            else
            {
                ScrollView{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.easeIn){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }.padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
