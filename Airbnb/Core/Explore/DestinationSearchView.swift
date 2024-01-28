//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 27/01/24.
//

import SwiftUI

struct DestinationSearchView: View {
    
    @Binding var show : Bool
    @State private var destination = ""
    var body: some View {
        VStack{
            Button {
                withAnimation(.easeIn){
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            
            //Where to
            VStack(alignment: .leading){
                Text("Where to?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .imageScale(.small)
                    TextField("Search destination", text: $destination)
                        .font(.subheadline)
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 8.0)
                        .stroke(lineWidth: 1.0)
                        .foregroundStyle(Color(.systemGray4))
                }
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            
            // date selection views
            CollapsedPickerView(title: "When", description: "Add dates")

            
            // num guest views
            CollapsedPickerView(title: "Who", description: "Add guests")
        }
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(show: .constant(false))
    }
}

struct CollapsedPickerView: View {
    
    var title: String
    var description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
        .shadow(radius: 10)
    }
}
