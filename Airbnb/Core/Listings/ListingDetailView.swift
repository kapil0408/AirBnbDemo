//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 21/01/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    var images = [
        "arkit",
        "classkit",
        "carplay",
        "swiftui",
    ]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )
    
    var body: some View {
        ScrollView{
            ListingImageCarouselView()
                .frame(height: 320)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text (" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            
            //Host Info View
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire villa hosted by Kapil Goyal")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2){
                        Text("4 Guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                
                Image("arkit")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            Divider()
            
            //listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0..<2 ){ feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are committed to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            
            // Bedroom View
            //            VStack(alignment: .leading, spacing: 16) {
            //                Text("Where You'll sleep")
            //                    .font(.headline)
            //
            //                ScrollView(.horizontal, showsIndicators: false){
            //                    HStack(spacing: 16) {
            //                        ForEach(1..<5) { bedroom in
            //                            VStack{
            //                                Image(systemName: "bed.double")
            //                                Text("Bedroom \(bedroom)")
            //                            }
            //                            .frame(width: 132, height: 100)
            //                            .overlay {
            //                                RoundedRectangle(cornerRadius: 12)
            //                                    .stroke(lineWidth: 1)
            //                                    .foregroundColor(.gray)
            //                            }
            //                        }
            //                    }
            //                }
            //            }
            //            .padding()
            //            Divider()
            
            
            // listing amenties
            VStack(alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(0..<5) { feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(coordinateRegion: $region)
                    .frame(height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }.padding()
            
        }.overlay(alignment: .bottom) {
            VStack{
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack{
                        
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView()
    }
}
