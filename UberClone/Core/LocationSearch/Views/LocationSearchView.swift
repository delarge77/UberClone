//
//  LocationSearchView.swift
//  UberClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-26.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel

    var body: some View {
        VStack {
            
            // Header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Circle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // List View
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id:\.self) { location in
                        LocationSearchResultCell(location: location)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(location)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.background)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
