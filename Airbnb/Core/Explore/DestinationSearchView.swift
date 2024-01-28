//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 27/01/24.
//

import SwiftUI

enum DestinationSearchOptions{
    
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    @Binding var show : Bool
    @State private var destination = ""
    
    @State private var selectedOption: DestinationSearchOptions = .location
    
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
                if selectedOption == .location {
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
                else
                {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }

            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                
                withAnimation(.easeIn){ selectedOption = .location }
            }
            
            // date selection views
            
            VStack{
                if selectedOption == .dates{
                    HStack {
                        
                        Text("Show expanded view")
                        
                        Spacer()
                    }
                }
                else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeIn){ selectedOption = .dates }
            }
            
            // num guest views
            VStack{
                if selectedOption == .guests{
                    HStack {
                        
                        Text("Show expanded view")
                        
                        Spacer()
                    }
                }
                else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeIn){ selectedOption = .guests }
            }
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
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: 10)
    }
}
