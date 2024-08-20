//
//  LocationSearchResultCell.swift
//  UberClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-26.
//

import SwiftUI
import MapKit

struct LocationSearchResultCell: View {
    
    let location: MKLocalSearchCompletion
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(Color(.blue))
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(location.title)
                    .font(.body)
                
                Text(location.subtitle)
                    .font(.system(size: 15))
                    .foregroundStyle(Color(.systemGray))
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell(location: MKLocalSearchCompletion())
}
