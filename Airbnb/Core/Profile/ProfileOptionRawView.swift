//
//  ProfileOptionRawView.swift
//  Airbnb
//
//  Created by Kapil Kumar on 29/01/24.
//

import SwiftUI

struct ProfileOptionRawView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

struct ProfileOptionRawView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionRawView(imageName: "gear", title: "Settings")
    }
}
