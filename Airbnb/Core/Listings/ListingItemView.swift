//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 20/01/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
    
        "arkit",
        "classkit",
        "carplay",
        "swiftui",

    ]
    
    var body: some View {
        VStack(spacing: 8) {
            //Images
            TabView{
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            // listing details
            HStack(alignment: .top) {
                //details
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundColor(.gray)
                    Text("Nov 3 - 10")
                        .foregroundColor(.gray)
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                Spacer()
                //rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                
            }.font(.footnote)
        }
    }
}

struct ListingItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListingItemView()
    }
}
