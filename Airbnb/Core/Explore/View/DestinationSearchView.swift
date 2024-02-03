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
    @ObservedObject var viewModel: ExploreViewModel

    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    
    var body: some View {
        VStack{
            HStack{
                
                Button {
                    withAnimation(.easeIn){
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                    }
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
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
                            .onSubmit {
                                print("Update listings")
                            }
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
            
            VStack(alignment: .leading){
                if selectedOption == .dates{
                   
                        Text("When's your trip?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        VStack{
                            DatePicker("From", selection: $startDate, displayedComponents: .date)
                            Divider()
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        }
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 180 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeIn){ selectedOption = .dates }
            }
            
            // num guest views
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests  = numGuests + 1
                    } onDecrement: {
                        guard numGuests > 0 else {return }
                        numGuests = numGuests - 1
                    }
                }
                
                else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            //.modifier(CollapsibleDestinationViewModifier())
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.easeIn){ selectedOption = .guests }
            }
            
            Spacer()
        }
    }
}

struct DestinationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSearchView(show: .constant(false))
    }
}

//struct CollapsibleDestinationViewModifier: ViewBuilder
//{
//    func body(content: Content) -> some View {
//        content
//            .padding()
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 12))
//            .padding()
//            .shadow(radius: 10)
//
//    }
//}


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
    }
}
